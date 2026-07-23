// BluefinPayconex SDK client.

import Foundation

public final class BluefinPayconexSDK {
  public var mode = "live"
  private var options: VMap = VMap()
  private let utility: Utility
  public var features: [BaseFeature] = []
  private var rootctx: Context!

  public init(_ optionsIn: VMap? = nil) {
    utility = Utility()

    let config = SdkConfig.makeConfig()

    var ctxmap: [String: Any?] = [
      "client": self,
      "utility": utility,
      "config": config,
      "shared": VMap(),
    ]
    if let o = optionsIn { ctxmap["options"] = o }

    rootctx = utility.makeContext(ctxmap, nil)

    options = utility.makeOptions(rootctx)

    if gpath(options, "feature", "test", "active") == .bool(true) {
      mode = "test"
    }

    rootctx.options = options

    // Add features in the resolved order (makeOptions puts an explicit list
    // order first, else defaults to test-first). Ordering matters: the `test`
    // feature installs the base mock transport and the transport features
    // (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
    // must be added before them to sit at the base of the chain.
    let featureOpts = gp(options, "feature").asMap ?? VMap()
    if let featureOrder = gpath(options, "__derived__", "featureorder").asList {
      for fnameVal in featureOrder.items {
        let fname = fnameVal.asString ?? ""
        if fname != "", let fopts = gp(featureOpts, fname).asMap,
          fopts.entries["active"]?.asBool == true {
          utility.featureAdd(rootctx, SdkConfig.makeFeature(fname))
        }
      }
    }

    // Add extension features.
    if let extList = gp(options, "extend").asList {
      for f in extList.items {
        if let feat = f.asNative as? BaseFeature {
          utility.featureAdd(rootctx, feat)
        }
      }
    }

    // Initialize features.
    for f in features {
      utility.featureInit(rootctx, f)
    }

    utility.featureHook(rootctx, "PostConstruct")
  }

  public func optionsMap() -> VMap {
    return clone(.map(options)).asMap ?? VMap()
  }

  public func getUtility() -> Utility {
    return Utility.copy(utility)
  }

  public func getRootCtx() -> Context {
    return rootctx
  }

  public func prepare(_ fetchargsIn: VMap?) throws -> VMap {
    let utility = self.utility

    let fetchargs = fetchargsIn ?? VMap()

    let ctrl = gp(fetchargs, "ctrl").asMap ?? VMap()

    let ctx = utility.makeContext(["opname": "prepare", "ctrl": ctrl], rootctx)

    let options = self.options

    let path = gp(fetchargs, "path").asString ?? ""
    var method = gp(fetchargs, "method").asString ?? ""
    if method == "" { method = "GET" }

    let pathParams = gp(fetchargs, "params").asMap ?? VMap()
    let query = gp(fetchargs, "query").asMap ?? VMap()

    let headers = utility.prepareHeaders(ctx)

    let basev = gp(options, "base").asString ?? ""
    let prefix = gp(options, "prefix").asString ?? ""
    let suffix = gp(options, "suffix").asString ?? ""

    let specmap = VMap()
    specmap.entries["base"] = .string(basev)
    specmap.entries["prefix"] = .string(prefix)
    specmap.entries["suffix"] = .string(suffix)
    specmap.entries["path"] = .string(path)
    specmap.entries["method"] = .string(method)
    specmap.entries["params"] = .map(pathParams)
    specmap.entries["query"] = .map(query)
    specmap.entries["headers"] = .map(headers)
    specmap.entries["body"] = gp(fetchargs, "body")
    specmap.entries["step"] = .string("start")
    ctx.spec = Spec(specmap)

    // Merge user-provided headers.
    if let uhm = gp(fetchargs, "headers").asMap {
      for (k, v) in uhm.entries {
        ctx.spec!.headers.entries[k] = v
      }
    }

    _ = try utility.prepareAuth(ctx)

    return try utility.makeFetchDef(ctx)
  }

  public func direct(_ fetchargsIn: VMap?) -> VMap {
    let utility = self.utility

    let fetchdef: VMap
    do {
      fetchdef = try prepare(fetchargsIn)
    } catch {
      let r = VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(error)
      return r
    }

    let fetchargs = fetchargsIn ?? VMap()
    let ctrl = gp(fetchargs, "ctrl").asMap ?? VMap()

    let ctx = utility.makeContext(["opname": "direct", "ctrl": ctrl], rootctx)

    let url = gp(fetchdef, "url").asString ?? ""

    let fetched: Value
    do {
      fetched = try utility.fetcher(ctx, url, fetchdef)
    } catch {
      let r = VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(error)
      return r
    }

    if isNil(fetched) {
      let r = VMap()
      r.entries["ok"] = .bool(false)
      r.entries["err"] = .nat(ctx.makeError("direct_no_response", "response: undefined"))
      return r
    }

    if let fm = fetched.asMap {
      let status = toInt(gp(fm, "status"))
      let headers = gp(fm, "headers")

      // No-body responses (204, 304) and explicit zero content-length must
      // skip JSON parsing.
      var contentLength = ""
      if let hm = headers.asMap, let cl = hm.entries["content-length"], !isNil(cl) {
        contentLength = stringify(cl)
      }
      let noBody = status == 204 || status == 304 || contentLength == "0"

      var jsonData: Value = .noval
      if !noBody, let jf = gp(fm, "json").asNative as? NativeCall0 {
        jsonData = jf()
      }

      let r = VMap()
      r.entries["ok"] = .bool(status >= 200 && status < 300)
      r.entries["status"] = .int(Int64(status))
      r.entries["headers"] = headers
      r.entries["data"] = jsonData
      return r
    }

    let r = VMap()
    r.entries["ok"] = .bool(false)
    r.entries["err"] = .nat(ctx.makeError("direct_invalid", "invalid response type"))
    return r
  }


  // AccountUpdater returns a AccountUpdater entity bound to this client.
  // Idiomatic usage: try client.AccountUpdater().list(nil) or
  // try client.AccountUpdater().load(vm(("id", .string("..."))), nil).
  public func AccountUpdater(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return AccountUpdaterEntity(self, entopts)
  }

  // AccountUpdaterSchedule returns a AccountUpdaterSchedule entity bound to this client.
  // Idiomatic usage: try client.AccountUpdaterSchedule().list(nil) or
  // try client.AccountUpdaterSchedule().load(vm(("id", .string("..."))), nil).
  public func AccountUpdaterSchedule(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return AccountUpdaterScheduleEntity(self, entopts)
  }

  // AccountUpdaterScheduleWithResult returns a AccountUpdaterScheduleWithResult entity bound to this client.
  // Idiomatic usage: try client.AccountUpdaterScheduleWithResult().list(nil) or
  // try client.AccountUpdaterScheduleWithResult().load(vm(("id", .string("..."))), nil).
  public func AccountUpdaterScheduleWithResult(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return AccountUpdaterScheduleWithResultEntity(self, entopts)
  }

  // AccountUpdaterSubscriptionWithResult returns a AccountUpdaterSubscriptionWithResult entity bound to this client.
  // Idiomatic usage: try client.AccountUpdaterSubscriptionWithResult().list(nil) or
  // try client.AccountUpdaterSubscriptionWithResult().load(vm(("id", .string("..."))), nil).
  public func AccountUpdaterSubscriptionWithResult(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return AccountUpdaterSubscriptionWithResultEntity(self, entopts)
  }

  // AccountUpdaterUpdate returns a AccountUpdaterUpdate entity bound to this client.
  // Idiomatic usage: try client.AccountUpdaterUpdate().list(nil) or
  // try client.AccountUpdaterUpdate().load(vm(("id", .string("..."))), nil).
  public func AccountUpdaterUpdate(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return AccountUpdaterUpdateEntity(self, entopts)
  }

  // ApiKey returns a ApiKey entity bound to this client.
  // Idiomatic usage: try client.ApiKey().list(nil) or
  // try client.ApiKey().load(vm(("id", .string("..."))), nil).
  public func ApiKey(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return ApiKeyEntity(self, entopts)
  }

  // ApplePayMerchantDetail returns a ApplePayMerchantDetail entity bound to this client.
  // Idiomatic usage: try client.ApplePayMerchantDetail().list(nil) or
  // try client.ApplePayMerchantDetail().load(vm(("id", .string("..."))), nil).
  public func ApplePayMerchantDetail(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return ApplePayMerchantDetailEntity(self, entopts)
  }

  // ApplePaySession returns a ApplePaySession entity bound to this client.
  // Idiomatic usage: try client.ApplePaySession().list(nil) or
  // try client.ApplePaySession().load(vm(("id", .string("..."))), nil).
  public func ApplePaySession(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return ApplePaySessionEntity(self, entopts)
  }

  // DynamicDescriptor returns a DynamicDescriptor entity bound to this client.
  // Idiomatic usage: try client.DynamicDescriptor().list(nil) or
  // try client.DynamicDescriptor().load(vm(("id", .string("..."))), nil).
  public func DynamicDescriptor(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return DynamicDescriptorEntity(self, entopts)
  }

  // IFrameCreateInstance returns a IFrameCreateInstance entity bound to this client.
  // Idiomatic usage: try client.IFrameCreateInstance().list(nil) or
  // try client.IFrameCreateInstance().load(vm(("id", .string("..."))), nil).
  public func IFrameCreateInstance(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return IFrameCreateInstanceEntity(self, entopts)
  }

  // IFrameInstance returns a IFrameInstance entity bound to this client.
  // Idiomatic usage: try client.IFrameInstance().list(nil) or
  // try client.IFrameInstance().load(vm(("id", .string("..."))), nil).
  public func IFrameInstance(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return IFrameInstanceEntity(self, entopts)
  }

  // Iframe returns a Iframe entity bound to this client.
  // Idiomatic usage: try client.Iframe().list(nil) or
  // try client.Iframe().load(vm(("id", .string("..."))), nil).
  public func Iframe(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return IframeEntity(self, entopts)
  }

  // Init returns a Init entity bound to this client.
  // Idiomatic usage: try client.Init().list(nil) or
  // try client.Init().load(vm(("id", .string("..."))), nil).
  public func Init(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return InitEntity(self, entopts)
  }

  // ListApiKeyScopesEntry returns a ListApiKeyScopesEntry entity bound to this client.
  // Idiomatic usage: try client.ListApiKeyScopesEntry().list(nil) or
  // try client.ListApiKeyScopesEntry().load(vm(("id", .string("..."))), nil).
  public func ListApiKeyScopesEntry(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return ListApiKeyScopesEntryEntity(self, entopts)
  }

  // PaymentIframe returns a PaymentIframe entity bound to this client.
  // Idiomatic usage: try client.PaymentIframe().list(nil) or
  // try client.PaymentIframe().load(vm(("id", .string("..."))), nil).
  public func PaymentIframe(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return PaymentIframeEntity(self, entopts)
  }

  // ThreeDSecureAuth returns a ThreeDSecureAuth entity bound to this client.
  // Idiomatic usage: try client.ThreeDSecureAuth().list(nil) or
  // try client.ThreeDSecureAuth().load(vm(("id", .string("..."))), nil).
  public func ThreeDSecureAuth(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return ThreeDSecureAuthEntity(self, entopts)
  }

  // ThreeDSecureBrowserInit returns a ThreeDSecureBrowserInit entity bound to this client.
  // Idiomatic usage: try client.ThreeDSecureBrowserInit().list(nil) or
  // try client.ThreeDSecureBrowserInit().load(vm(("id", .string("..."))), nil).
  public func ThreeDSecureBrowserInit(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return ThreeDSecureBrowserInitEntity(self, entopts)
  }

  // ThreeDSecureStatus returns a ThreeDSecureStatus entity bound to this client.
  // Idiomatic usage: try client.ThreeDSecureStatus().list(nil) or
  // try client.ThreeDSecureStatus().load(vm(("id", .string("..."))), nil).
  public func ThreeDSecureStatus(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return ThreeDSecureStatusEntity(self, entopts)
  }

  // TransactionDetail returns a TransactionDetail entity bound to this client.
  // Idiomatic usage: try client.TransactionDetail().list(nil) or
  // try client.TransactionDetail().load(vm(("id", .string("..."))), nil).
  public func TransactionDetail(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return TransactionDetailEntity(self, entopts)
  }

  // Webhook returns a Webhook entity bound to this client.
  // Idiomatic usage: try client.Webhook().list(nil) or
  // try client.Webhook().load(vm(("id", .string("..."))), nil).
  public func Webhook(_ entopts: VMap? = nil) -> BluefinPayconexEntityBase {
    return WebhookEntity(self, entopts)
  }


  public static func testSDK(_ testoptsIn: VMap?, _ sdkoptsIn: VMap?) -> BluefinPayconexSDK {
    let sdkopts = clone(.map(sdkoptsIn ?? VMap())).asMap ?? VMap()

    let testopts = clone(.map(testoptsIn ?? VMap())).asMap ?? VMap()
    testopts.entries["active"] = .bool(true)

    _ = setpath(.map(sdkopts), jtp("feature", "test"), .map(testopts))

    let sdk = BluefinPayconexSDK(sdkopts)
    sdk.mode = "test"
    return sdk
  }
}
