# BluefinPayconex SDK

require_relative 'utility/struct/voxgig_struct'
require_relative 'core/utility_type'
require_relative 'core/spec'
require_relative 'core/helpers'

# Load utility registration
require_relative 'utility/register'

# Load config and features
require_relative 'config'
require_relative 'feature/base_feature'
require_relative 'features'

# Load typed models (Struct value objects).
require_relative 'BluefinPayconex_types'


class BluefinPayconexSDK
  attr_accessor :mode, :features, :options

  def initialize(options = {})
    @mode = "live"
    @features = []
    @options = nil

    utility = BluefinPayconexUtility.new
    @_utility = utility

    config = BluefinPayconexConfig.make_config

    @_rootctx = utility.make_context.call({
      "client" => self,
      "utility" => utility,
      "config" => config,
      "options" => options || {},
      "shared" => {},
    }, nil)

    @options = utility.make_options.call(@_rootctx)

    if VoxgigStruct.getpath(@options, "feature.test.active") == true
      @mode = "test"
    end

    @_rootctx.options = @options

    # Add features in the resolved order (make_options puts an explicit array
    # order first, else defaults to test-first). Ordering matters: the `test`
    # feature installs the base mock transport and the transport features
    # (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
    # must be added before them to sit at the base of the chain.
    feature_opts = BluefinPayconexHelpers.to_map(VoxgigStruct.getprop(@options, "feature"))
    if feature_opts
      featureorder = VoxgigStruct.getpath(@options, "__derived__.featureorder")
      if featureorder.is_a?(Array)
        featureorder.each do |fname|
          fopts = BluefinPayconexHelpers.to_map(feature_opts[fname])
          if fopts && fopts["active"] == true
            utility.feature_add.call(@_rootctx, BluefinPayconexFeatures.make_feature(fname))
          end
        end
      end
    end

    # Add extension features.
    extend_val = VoxgigStruct.getprop(@options, "extend")
    if extend_val.is_a?(Array)
      extend_val.each do |f|
        if f.respond_to?(:get_name)
          utility.feature_add.call(@_rootctx, f)
        end
      end
    end

    # Initialize features.
    @features.each do |f|
      utility.feature_init.call(@_rootctx, f)
    end

    utility.feature_hook.call(@_rootctx, "PostConstruct")
  end

  def options_map
    out = VoxgigStruct.clone(@options)
    out.is_a?(Hash) ? out : {}
  end

  def get_utility
    BluefinPayconexUtility.copy(@_utility)
  end

  def get_root_ctx
    @_rootctx
  end

  def prepare(fetchargs = {})
    utility = @_utility
    fetchargs ||= {}

    ctrl = BluefinPayconexHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "prepare",
      "ctrl" => ctrl,
    }, @_rootctx)

    opts = @options
    path = VoxgigStruct.getprop(fetchargs, "path") || ""
    path = "" unless path.is_a?(String)
    method_val = VoxgigStruct.getprop(fetchargs, "method") || "GET"
    method_val = "GET" unless method_val.is_a?(String)
    params = BluefinPayconexHelpers.to_map(VoxgigStruct.getprop(fetchargs, "params")) || {}
    query = BluefinPayconexHelpers.to_map(VoxgigStruct.getprop(fetchargs, "query")) || {}
    headers = utility.prepare_headers.call(ctx)

    base = VoxgigStruct.getprop(opts, "base") || ""
    base = "" unless base.is_a?(String)
    prefix = VoxgigStruct.getprop(opts, "prefix") || ""
    prefix = "" unless prefix.is_a?(String)
    suffix = VoxgigStruct.getprop(opts, "suffix") || ""
    suffix = "" unless suffix.is_a?(String)

    ctx.spec = BluefinPayconexSpec.new({
      "base" => base, "prefix" => prefix, "suffix" => suffix,
      "path" => path, "method" => method_val,
      "params" => params, "query" => query, "headers" => headers,
      "body" => VoxgigStruct.getprop(fetchargs, "body"),
      "step" => "start",
    })

    # Merge user-provided headers.
    uh = VoxgigStruct.getprop(fetchargs, "headers")
    if uh.is_a?(Hash)
      uh.each { |k, v| ctx.spec.headers[k] = v }
    end

    _, err = utility.prepare_auth.call(ctx)
    raise err if err

    # make_fetch_def returns a (fetchdef, err) tuple; destructure it and
    # return just the fetchdef Hash (raising on error) so callers — including
    # direct(), which indexes fetchdef["url"] — receive a Hash, mirroring the
    # ts/py prepare().
    fetchdef, fd_err = utility.make_fetch_def.call(ctx)
    raise fd_err if fd_err

    fetchdef
  end

  def direct(fetchargs = {})
    utility = @_utility

    # direct() is the raw-HTTP escape hatch: it always returns a result hash
    # ({ "ok" => ..., ... }) and never raises. prepare() raises on error, so
    # trap that and surface it in the hash.
    begin
      fetchdef = prepare(fetchargs)
    rescue BluefinPayconexError => err
      return { "ok" => false, "err" => err }
    end

    fetchargs ||= {}
    ctrl = BluefinPayconexHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "direct",
      "ctrl" => ctrl,
    }, @_rootctx)

    url = fetchdef["url"] || ""
    fetched, fetch_err = utility.fetcher.call(ctx, url, fetchdef)

    return { "ok" => false, "err" => fetch_err } if fetch_err

    if fetched.nil?
      return {
        "ok" => false,
        "err" => ctx.make_error("direct_no_response", "response: undefined"),
      }
    end

    if fetched.is_a?(Hash)
      status = BluefinPayconexHelpers.to_int(VoxgigStruct.getprop(fetched, "status"))
      headers = VoxgigStruct.getprop(fetched, "headers") || {}

      # No-body responses (204, 304) and explicit zero content-length must
      # skip JSON parsing — calling json() on an empty body errors.
      content_length = headers.is_a?(Hash) ? headers["content-length"] : nil
      no_body = status == 204 || status == 304 || content_length.to_s == "0"

      json_data = nil
      unless no_body
        jf = VoxgigStruct.getprop(fetched, "json")
        if jf.is_a?(Proc)
          begin
            json_data = jf.call
          rescue StandardError
            # Non-JSON body — leave data nil, keep status/headers.
            json_data = nil
          end
        end
      end

      return {
        "ok" => status >= 200 && status < 300,
        "status" => status,
        "headers" => headers,
        "data" => json_data,
      }
    end

    return {
      "ok" => false,
      "err" => ctx.make_error("direct_invalid", "invalid response type"),
    }
  end


  # Canonical facade: client.AccountUpdater.list / client.AccountUpdater.load({ "id" => ... })
  def AccountUpdater(data = nil)
    require_relative 'entity/account_updater_entity'
    AccountUpdaterEntity.new(self, data)
  end


  # Canonical facade: client.AccountUpdaterSchedule.list / client.AccountUpdaterSchedule.load({ "id" => ... })
  def AccountUpdaterSchedule(data = nil)
    require_relative 'entity/account_updater_schedule_entity'
    AccountUpdaterScheduleEntity.new(self, data)
  end


  # Canonical facade: client.AccountUpdaterScheduleWithResult.list / client.AccountUpdaterScheduleWithResult.load({ "id" => ... })
  def AccountUpdaterScheduleWithResult(data = nil)
    require_relative 'entity/account_updater_schedule_with_result_entity'
    AccountUpdaterScheduleWithResultEntity.new(self, data)
  end


  # Canonical facade: client.AccountUpdaterSubscriptionWithResult.list / client.AccountUpdaterSubscriptionWithResult.load({ "id" => ... })
  def AccountUpdaterSubscriptionWithResult(data = nil)
    require_relative 'entity/account_updater_subscription_with_result_entity'
    AccountUpdaterSubscriptionWithResultEntity.new(self, data)
  end


  # Canonical facade: client.AccountUpdaterUpdate.list / client.AccountUpdaterUpdate.load({ "id" => ... })
  def AccountUpdaterUpdate(data = nil)
    require_relative 'entity/account_updater_update_entity'
    AccountUpdaterUpdateEntity.new(self, data)
  end


  # Canonical facade: client.ApiKey.list / client.ApiKey.load({ "id" => ... })
  def ApiKey(data = nil)
    require_relative 'entity/api_key_entity'
    ApiKeyEntity.new(self, data)
  end


  # Canonical facade: client.ApplePayMerchantDetail.list / client.ApplePayMerchantDetail.load({ "id" => ... })
  def ApplePayMerchantDetail(data = nil)
    require_relative 'entity/apple_pay_merchant_detail_entity'
    ApplePayMerchantDetailEntity.new(self, data)
  end


  # Canonical facade: client.ApplePaySession.list / client.ApplePaySession.load({ "id" => ... })
  def ApplePaySession(data = nil)
    require_relative 'entity/apple_pay_session_entity'
    ApplePaySessionEntity.new(self, data)
  end


  # Canonical facade: client.DynamicDescriptor.list / client.DynamicDescriptor.load({ "id" => ... })
  def DynamicDescriptor(data = nil)
    require_relative 'entity/dynamic_descriptor_entity'
    DynamicDescriptorEntity.new(self, data)
  end


  # Canonical facade: client.IFrameCreateInstance.list / client.IFrameCreateInstance.load({ "id" => ... })
  def IFrameCreateInstance(data = nil)
    require_relative 'entity/i_frame_create_instance_entity'
    IFrameCreateInstanceEntity.new(self, data)
  end


  # Canonical facade: client.IFrameInstance.list / client.IFrameInstance.load({ "id" => ... })
  def IFrameInstance(data = nil)
    require_relative 'entity/i_frame_instance_entity'
    IFrameInstanceEntity.new(self, data)
  end


  # Canonical facade: client.Iframe.list / client.Iframe.load({ "id" => ... })
  def Iframe(data = nil)
    require_relative 'entity/iframe_entity'
    IframeEntity.new(self, data)
  end


  # Canonical facade: client.Init.list / client.Init.load({ "id" => ... })
  def Init(data = nil)
    require_relative 'entity/init_entity'
    InitEntity.new(self, data)
  end


  # Canonical facade: client.ListApiKeyScopesEntry.list / client.ListApiKeyScopesEntry.load({ "id" => ... })
  def ListApiKeyScopesEntry(data = nil)
    require_relative 'entity/list_api_key_scopes_entry_entity'
    ListApiKeyScopesEntryEntity.new(self, data)
  end


  # Canonical facade: client.PaymentIframe.list / client.PaymentIframe.load({ "id" => ... })
  def PaymentIframe(data = nil)
    require_relative 'entity/payment_iframe_entity'
    PaymentIframeEntity.new(self, data)
  end


  # Canonical facade: client.ThreeDSecureAuth.list / client.ThreeDSecureAuth.load({ "id" => ... })
  def ThreeDSecureAuth(data = nil)
    require_relative 'entity/three_d_secure_auth_entity'
    ThreeDSecureAuthEntity.new(self, data)
  end


  # Canonical facade: client.ThreeDSecureBrowserInit.list / client.ThreeDSecureBrowserInit.load({ "id" => ... })
  def ThreeDSecureBrowserInit(data = nil)
    require_relative 'entity/three_d_secure_browser_init_entity'
    ThreeDSecureBrowserInitEntity.new(self, data)
  end


  # Canonical facade: client.ThreeDSecureStatus.list / client.ThreeDSecureStatus.load({ "id" => ... })
  def ThreeDSecureStatus(data = nil)
    require_relative 'entity/three_d_secure_status_entity'
    ThreeDSecureStatusEntity.new(self, data)
  end


  # Canonical facade: client.TransactionDetail.list / client.TransactionDetail.load({ "id" => ... })
  def TransactionDetail(data = nil)
    require_relative 'entity/transaction_detail_entity'
    TransactionDetailEntity.new(self, data)
  end


  # Canonical facade: client.Webhook.list / client.Webhook.load({ "id" => ... })
  def Webhook(data = nil)
    require_relative 'entity/webhook_entity'
    WebhookEntity.new(self, data)
  end



  def self.test(testopts = nil, sdkopts = nil)
    sdkopts = sdkopts || {}
    sdkopts = VoxgigStruct.clone(sdkopts)
    sdkopts = {} unless sdkopts.is_a?(Hash)

    testopts = testopts || {}
    testopts = VoxgigStruct.clone(testopts)
    testopts = {} unless testopts.is_a?(Hash)
    testopts["active"] = true

    VoxgigStruct.setpath(sdkopts, "feature.test", testopts)

    sdk = BluefinPayconexSDK.new(sdkopts)
    sdk.mode = "test"
    sdk
  end
end
