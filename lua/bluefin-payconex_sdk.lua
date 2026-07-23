-- BluefinPayconex SDK

local vs = require("utility.struct.struct")
local Utility = require("core.utility_type")
local Spec = require("core.spec")
local helpers = require("core.helpers")

-- Load utility registration (populates Utility._registrar)
require("utility.register")

-- Typed-model annotations (LuaLS ---@class); empty at runtime.
require("bluefin-payconex_types")

-- Load features
local BaseFeature = require("feature.base_feature")
local features_factory = require("features")


local BluefinPayconexSDK = {}
BluefinPayconexSDK.__index = BluefinPayconexSDK


local function _make_feature(name)
  local factory = features_factory[name]
  if factory ~= nil then
    return factory()
  end
  return features_factory.base()
end

BluefinPayconexSDK._make_feature = _make_feature


function BluefinPayconexSDK.new(options)
  local self = setmetatable({}, BluefinPayconexSDK)
  self.mode = "live"
  self.features = {}
  self.options = nil

  local utility = Utility.new()
  self._utility = utility

  local config = require("config")()

  self._rootctx = utility.make_context({
    client = self,
    utility = utility,
    config = config,
    options = options or {},
    shared = {},
  }, nil)

  self.options = utility.make_options(self._rootctx)

  if vs.getpath(self.options, "feature.test.active") == true then
    self.mode = "test"
  end

  self._rootctx.options = self.options

  -- Add features in the resolved order (make_options puts an explicit list
  -- order first, else defaults to test-first). Ordering matters: the `test`
  -- feature installs the base mock transport and the transport features
  -- (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
  -- must be added before them to sit at the base of the chain.
  local feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
  if feature_opts ~= nil then
    local featureorder = vs.getpath(self.options, "__derived__.featureorder")
    if type(featureorder) == "table" then
      for _, fname in ipairs(featureorder) do
        local fopts = helpers.to_map(feature_opts[fname])
        if fopts ~= nil and fopts["active"] == true then
          utility.feature_add(self._rootctx, _make_feature(fname))
        end
      end
    end
  end

  -- Add extension features.
  local extend = vs.getprop(self.options, "extend")
  if type(extend) == "table" then
    for _, f in ipairs(extend) do
      if type(f) == "table" and type(f.get_name) == "function" then
        utility.feature_add(self._rootctx, f)
      end
    end
  end

  -- Initialize features.
  for _, f in ipairs(self.features) do
    utility.feature_init(self._rootctx, f)
  end

  utility.feature_hook(self._rootctx, "PostConstruct")

    -- feature: test


  return self
end


function BluefinPayconexSDK:options_map()
  local out = vs.clone(self.options)
  if type(out) == "table" then
    return out
  end
  return {}
end


function BluefinPayconexSDK:get_utility()
  return Utility.copy(self._utility)
end


function BluefinPayconexSDK:get_root_ctx()
  return self._rootctx
end


function BluefinPayconexSDK:prepare(fetchargs)
  local utility = self._utility

  fetchargs = fetchargs or {}

  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "prepare",
    ctrl = ctrl,
  }, self._rootctx)

  local options = self.options

  local path = vs.getprop(fetchargs, "path") or ""
  if type(path) ~= "string" then path = "" end

  local method = vs.getprop(fetchargs, "method") or "GET"
  if type(method) ~= "string" then method = "GET" end

  local params = helpers.to_map(vs.getprop(fetchargs, "params")) or {}
  local query = helpers.to_map(vs.getprop(fetchargs, "query")) or {}

  local headers = utility.prepare_headers(ctx)

  local base = vs.getprop(options, "base") or ""
  if type(base) ~= "string" then base = "" end
  local prefix = vs.getprop(options, "prefix") or ""
  if type(prefix) ~= "string" then prefix = "" end
  local suffix = vs.getprop(options, "suffix") or ""
  if type(suffix) ~= "string" then suffix = "" end

  ctx.spec = Spec.new({
    base = base,
    prefix = prefix,
    suffix = suffix,
    path = path,
    method = method,
    params = params,
    query = query,
    headers = headers,
    body = vs.getprop(fetchargs, "body"),
    step = "start",
  })

  -- Merge user-provided headers.
  local uh = vs.getprop(fetchargs, "headers")
  if type(uh) == "table" then
    for k, v in pairs(uh) do
      ctx.spec.headers[k] = v
    end
  end

  local _, err = utility.prepare_auth(ctx)
  if err ~= nil then
    return nil, err
  end

  return utility.make_fetch_def(ctx)
end


function BluefinPayconexSDK:direct(fetchargs)
  local utility = self._utility

  local fetchdef, err = self:prepare(fetchargs)
  if err ~= nil then
    return { ok = false, err = err }, nil
  end

  fetchargs = fetchargs or {}
  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "direct",
    ctrl = ctrl,
  }, self._rootctx)

  local url = fetchdef["url"] or ""
  local fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

  if fetch_err ~= nil then
    return { ok = false, err = fetch_err }, nil
  end

  if fetched == nil then
    return {
      ok = false,
      err = ctx:make_error("direct_no_response", "response: undefined"),
    }, nil
  end

  if type(fetched) == "table" then
    local status = helpers.to_int(vs.getprop(fetched, "status"))
    local headers = vs.getprop(fetched, "headers") or {}

    -- No-body responses (204, 304) and explicit zero content-length
    -- must skip JSON parsing — calling json() on an empty body errors.
    local content_length = nil
    if type(headers) == "table" then
      content_length = headers["content-length"]
    end
    local no_body = status == 204 or status == 304 or tostring(content_length) == "0"

    local json_data = nil
    if not no_body then
      local jf = vs.getprop(fetched, "json")
      if type(jf) == "function" then
        local ok, result = pcall(jf)
        if ok then
          json_data = result
        end
        -- Non-JSON body: json_data stays nil, status/headers preserved.
      end
    end

    return {
      ok = status >= 200 and status < 300,
      status = status,
      headers = headers,
      data = json_data,
    }, nil
  end

  return {
    ok = false,
    err = ctx:make_error("direct_invalid", "invalid response type"),
  }, nil
end



-- Idiomatic facade: client:AccountUpdater():list() / client:AccountUpdater():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:AccountUpdater(data)
  local EntityMod = require("entity.account_updater_entity")
  if data == nil then
    if self._account_updater == nil then
      self._account_updater = EntityMod.new(self, nil)
    end
    return self._account_updater
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:AccountUpdaterSchedule():list() / client:AccountUpdaterSchedule():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:AccountUpdaterSchedule(data)
  local EntityMod = require("entity.account_updater_schedule_entity")
  if data == nil then
    if self._account_updater_schedule == nil then
      self._account_updater_schedule = EntityMod.new(self, nil)
    end
    return self._account_updater_schedule
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:AccountUpdaterScheduleWithResult():list() / client:AccountUpdaterScheduleWithResult():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:AccountUpdaterScheduleWithResult(data)
  local EntityMod = require("entity.account_updater_schedule_with_result_entity")
  if data == nil then
    if self._account_updater_schedule_with_result == nil then
      self._account_updater_schedule_with_result = EntityMod.new(self, nil)
    end
    return self._account_updater_schedule_with_result
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:AccountUpdaterSubscriptionWithResult():list() / client:AccountUpdaterSubscriptionWithResult():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:AccountUpdaterSubscriptionWithResult(data)
  local EntityMod = require("entity.account_updater_subscription_with_result_entity")
  if data == nil then
    if self._account_updater_subscription_with_result == nil then
      self._account_updater_subscription_with_result = EntityMod.new(self, nil)
    end
    return self._account_updater_subscription_with_result
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:AccountUpdaterUpdate():list() / client:AccountUpdaterUpdate():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:AccountUpdaterUpdate(data)
  local EntityMod = require("entity.account_updater_update_entity")
  if data == nil then
    if self._account_updater_update == nil then
      self._account_updater_update = EntityMod.new(self, nil)
    end
    return self._account_updater_update
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ApiKey():list() / client:ApiKey():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:ApiKey(data)
  local EntityMod = require("entity.api_key_entity")
  if data == nil then
    if self._api_key == nil then
      self._api_key = EntityMod.new(self, nil)
    end
    return self._api_key
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ApplePayMerchantDetail():list() / client:ApplePayMerchantDetail():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:ApplePayMerchantDetail(data)
  local EntityMod = require("entity.apple_pay_merchant_detail_entity")
  if data == nil then
    if self._apple_pay_merchant_detail == nil then
      self._apple_pay_merchant_detail = EntityMod.new(self, nil)
    end
    return self._apple_pay_merchant_detail
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ApplePaySession():list() / client:ApplePaySession():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:ApplePaySession(data)
  local EntityMod = require("entity.apple_pay_session_entity")
  if data == nil then
    if self._apple_pay_session == nil then
      self._apple_pay_session = EntityMod.new(self, nil)
    end
    return self._apple_pay_session
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DynamicDescriptor():list() / client:DynamicDescriptor():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:DynamicDescriptor(data)
  local EntityMod = require("entity.dynamic_descriptor_entity")
  if data == nil then
    if self._dynamic_descriptor == nil then
      self._dynamic_descriptor = EntityMod.new(self, nil)
    end
    return self._dynamic_descriptor
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:IFrameCreateInstance():list() / client:IFrameCreateInstance():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:IFrameCreateInstance(data)
  local EntityMod = require("entity.i_frame_create_instance_entity")
  if data == nil then
    if self._i_frame_create_instance == nil then
      self._i_frame_create_instance = EntityMod.new(self, nil)
    end
    return self._i_frame_create_instance
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:IFrameInstance():list() / client:IFrameInstance():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:IFrameInstance(data)
  local EntityMod = require("entity.i_frame_instance_entity")
  if data == nil then
    if self._i_frame_instance == nil then
      self._i_frame_instance = EntityMod.new(self, nil)
    end
    return self._i_frame_instance
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Iframe():list() / client:Iframe():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:Iframe(data)
  local EntityMod = require("entity.iframe_entity")
  if data == nil then
    if self._iframe == nil then
      self._iframe = EntityMod.new(self, nil)
    end
    return self._iframe
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Init():list() / client:Init():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:Init(data)
  local EntityMod = require("entity.init_entity")
  if data == nil then
    if self._init == nil then
      self._init = EntityMod.new(self, nil)
    end
    return self._init
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ListApiKeyScopesEntry():list() / client:ListApiKeyScopesEntry():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:ListApiKeyScopesEntry(data)
  local EntityMod = require("entity.list_api_key_scopes_entry_entity")
  if data == nil then
    if self._list_api_key_scopes_entry == nil then
      self._list_api_key_scopes_entry = EntityMod.new(self, nil)
    end
    return self._list_api_key_scopes_entry
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:PaymentIframe():list() / client:PaymentIframe():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:PaymentIframe(data)
  local EntityMod = require("entity.payment_iframe_entity")
  if data == nil then
    if self._payment_iframe == nil then
      self._payment_iframe = EntityMod.new(self, nil)
    end
    return self._payment_iframe
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ThreeDSecureAuth():list() / client:ThreeDSecureAuth():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:ThreeDSecureAuth(data)
  local EntityMod = require("entity.three_d_secure_auth_entity")
  if data == nil then
    if self._three_d_secure_auth == nil then
      self._three_d_secure_auth = EntityMod.new(self, nil)
    end
    return self._three_d_secure_auth
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ThreeDSecureBrowserInit():list() / client:ThreeDSecureBrowserInit():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:ThreeDSecureBrowserInit(data)
  local EntityMod = require("entity.three_d_secure_browser_init_entity")
  if data == nil then
    if self._three_d_secure_browser_init == nil then
      self._three_d_secure_browser_init = EntityMod.new(self, nil)
    end
    return self._three_d_secure_browser_init
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:ThreeDSecureStatus():list() / client:ThreeDSecureStatus():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:ThreeDSecureStatus(data)
  local EntityMod = require("entity.three_d_secure_status_entity")
  if data == nil then
    if self._three_d_secure_status == nil then
      self._three_d_secure_status = EntityMod.new(self, nil)
    end
    return self._three_d_secure_status
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:TransactionDetail():list() / client:TransactionDetail():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:TransactionDetail(data)
  local EntityMod = require("entity.transaction_detail_entity")
  if data == nil then
    if self._transaction_detail == nil then
      self._transaction_detail = EntityMod.new(self, nil)
    end
    return self._transaction_detail
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Webhook():list() / client:Webhook():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinPayconexSDK:Webhook(data)
  local EntityMod = require("entity.webhook_entity")
  if data == nil then
    if self._webhook == nil then
      self._webhook = EntityMod.new(self, nil)
    end
    return self._webhook
  end
  return EntityMod.new(self, data)
end




function BluefinPayconexSDK.test(testopts, sdkopts)
  sdkopts = sdkopts or {}
  sdkopts = vs.clone(sdkopts)
  if type(sdkopts) ~= "table" then
    sdkopts = {}
  end

  testopts = testopts or {}
  testopts = vs.clone(testopts)
  if type(testopts) ~= "table" then
    testopts = {}
  end
  testopts["active"] = true

  vs.setpath(sdkopts, "feature.test", testopts)

  local sdk = BluefinPayconexSDK.new(sdkopts)
  sdk.mode = "test"

  return sdk
end


return BluefinPayconexSDK
