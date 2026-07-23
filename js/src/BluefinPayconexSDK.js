// BluefinPayconex Js SDK

const { AccountUpdaterEntity } = require('./entity/AccountUpdaterEntity')
const { AccountUpdaterScheduleEntity } = require('./entity/AccountUpdaterScheduleEntity')
const { AccountUpdaterScheduleWithResultEntity } = require('./entity/AccountUpdaterScheduleWithResultEntity')
const { AccountUpdaterSubscriptionWithResultEntity } = require('./entity/AccountUpdaterSubscriptionWithResultEntity')
const { AccountUpdaterUpdateEntity } = require('./entity/AccountUpdaterUpdateEntity')
const { ApiKeyEntity } = require('./entity/ApiKeyEntity')
const { ApplePayMerchantDetailEntity } = require('./entity/ApplePayMerchantDetailEntity')
const { ApplePaySessionEntity } = require('./entity/ApplePaySessionEntity')
const { DynamicDescriptorEntity } = require('./entity/DynamicDescriptorEntity')
const { IFrameCreateInstanceEntity } = require('./entity/IFrameCreateInstanceEntity')
const { IFrameInstanceEntity } = require('./entity/IFrameInstanceEntity')
const { IframeEntity } = require('./entity/IframeEntity')
const { InitEntity } = require('./entity/InitEntity')
const { ListApiKeyScopesEntryEntity } = require('./entity/ListApiKeyScopesEntryEntity')
const { PaymentIframeEntity } = require('./entity/PaymentIframeEntity')
const { ThreeDSecureAuthEntity } = require('./entity/ThreeDSecureAuthEntity')
const { ThreeDSecureBrowserInitEntity } = require('./entity/ThreeDSecureBrowserInitEntity')
const { ThreeDSecureStatusEntity } = require('./entity/ThreeDSecureStatusEntity')
const { TransactionDetailEntity } = require('./entity/TransactionDetailEntity')
const { WebhookEntity } = require('./entity/WebhookEntity')


const { inspect } = require('node:util')

const { config } = require('./Config')
const { Utility } = require('./utility/Utility')
const { BluefinPayconexEntityBase } = require('./BluefinPayconexEntityBase')


const { BaseFeature } = require('./feature/base/BaseFeature')


const stdutil = new Utility()


class BluefinPayconexSDK {
  _mode = 'live'
  _options
  _utility = new Utility()
  _features
  _rootctx

  constructor(options) {

    this._rootctx = this._utility.makeContext({
      client: this,
      utility: this._utility,
      config,
      options,
      shared: new WeakMap()
    })

    this._options = this._utility.makeOptions(this._rootctx)

    const struct = this._utility.struct
    const getpath = struct.getpath

    if (true === getpath(this._options.feature, 'test.active')) {
      this._mode = 'test'
    }

    this._rootctx.options = this._options

    this._features = []

    const featureAdd = this._utility.featureAdd
    const featureInit = this._utility.featureInit

    // Add features in the resolved order (makeOptions puts an explicit
    // array order first, else defaults to test-first). Ordering matters:
    // the `test` feature installs the base mock transport and the transport
    // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is current,
    // so `test` must be added before them to sit at the base of the chain.
    const featureorder = getpath(this._options, '__derived__.featureorder') || []
    for (const fname of featureorder) {
      const fopts = this._options.feature[fname] || {}
      if (fopts.active) {
        featureAdd(this._rootctx, this._rootctx.config.makeFeature(fname))
      }
    }

    if (null != this._options.extend) {
      for (let f of this._options.extend) {
        featureAdd(this._rootctx, f)
      }
    }

    for (let f of this._features) {
      featureInit(this._rootctx, f)
    }

    const featureHook = this._utility.featureHook
    featureHook(this._rootctx, 'PostConstruct')
  }


  options() {
    return this._utility.struct.clone(this._options)
  }


  utility() {
    return this._utility.struct.clone(this._utility)
  }


  async prepare(fetchargs) {
    const utility = this._utility
    const struct = utility.struct
    const clone = struct.clone

    const {
      makeContext,
      makeFetchDef,
      prepareHeaders,
      prepareAuth,
    } = utility

    fetchargs = fetchargs || {}

    let ctx = makeContext({
      opname: 'prepare',
      ctrl: fetchargs.ctrl || {},
    }, this._rootctx)

    const options = this._options

    // Build spec directly from SDK options + user-provided fetch args.
    const spec = {
      base: options.base,
      prefix: options.prefix,
      suffix: options.suffix,
      path: fetchargs.path || '',
      method: fetchargs.method || 'GET',
      params: fetchargs.params || {},
      query: fetchargs.query || {},
      headers: prepareHeaders(ctx),
      body: fetchargs.body,
      step: 'start',
    }

    ctx.spec = spec

    // Merge user-provided headers over SDK defaults.
    if (fetchargs.headers) {
      const uheaders = fetchargs.headers
      for (let key in uheaders) {
        spec.headers[key] = uheaders[key]
      }
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    const authResult = prepareAuth(ctx)
    if (authResult instanceof Error) {
      return authResult
    }

    return makeFetchDef(ctx)
  }


  async direct(fetchargs) {
    const utility = this._utility
    const fetcher = utility.fetcher
    const makeContext = utility.makeContext

    const fetchdef = await this.prepare(fetchargs)
    if (fetchdef instanceof Error) {
      return fetchdef
    }

    let ctx = makeContext({
      opname: 'direct',
      ctrl: (fetchargs || {}).ctrl || {},
    }, this._rootctx)

    try {
      const fetched = await fetcher(ctx, fetchdef.url, fetchdef)

      if (null == fetched) {
        return { ok: false, err: ctx.error('direct_no_response', 'response: undefined') }
      }
      else if (fetched instanceof Error) {
        return { ok: false, err: fetched }
      }

      const status = fetched.status
      const json = 'function' === typeof fetched.json ? await fetched.json() : fetched.json

      return {
        ok: status >= 200 && status < 300,
        status,
        headers: fetched.headers,
        data: json,
      }
    }
    catch (err) {
      return { ok: false, err }
    }
  }



  // Entity access: `client.AccountUpdater().list()` / `client.AccountUpdater().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  AccountUpdater(entopts) {
    const self = this
    return new AccountUpdaterEntity(self, entopts)
  }


  // Entity access: `client.AccountUpdaterSchedule().list()` / `client.AccountUpdaterSchedule().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  AccountUpdaterSchedule(entopts) {
    const self = this
    return new AccountUpdaterScheduleEntity(self, entopts)
  }


  // Entity access: `client.AccountUpdaterScheduleWithResult().list()` / `client.AccountUpdaterScheduleWithResult().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  AccountUpdaterScheduleWithResult(entopts) {
    const self = this
    return new AccountUpdaterScheduleWithResultEntity(self, entopts)
  }


  // Entity access: `client.AccountUpdaterSubscriptionWithResult().list()` / `client.AccountUpdaterSubscriptionWithResult().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  AccountUpdaterSubscriptionWithResult(entopts) {
    const self = this
    return new AccountUpdaterSubscriptionWithResultEntity(self, entopts)
  }


  // Entity access: `client.AccountUpdaterUpdate().list()` / `client.AccountUpdaterUpdate().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  AccountUpdaterUpdate(entopts) {
    const self = this
    return new AccountUpdaterUpdateEntity(self, entopts)
  }


  // Entity access: `client.ApiKey().list()` / `client.ApiKey().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ApiKey(entopts) {
    const self = this
    return new ApiKeyEntity(self, entopts)
  }


  // Entity access: `client.ApplePayMerchantDetail().list()` / `client.ApplePayMerchantDetail().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ApplePayMerchantDetail(entopts) {
    const self = this
    return new ApplePayMerchantDetailEntity(self, entopts)
  }


  // Entity access: `client.ApplePaySession().list()` / `client.ApplePaySession().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ApplePaySession(entopts) {
    const self = this
    return new ApplePaySessionEntity(self, entopts)
  }


  // Entity access: `client.DynamicDescriptor().list()` / `client.DynamicDescriptor().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  DynamicDescriptor(entopts) {
    const self = this
    return new DynamicDescriptorEntity(self, entopts)
  }


  // Entity access: `client.IFrameCreateInstance().list()` / `client.IFrameCreateInstance().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  IFrameCreateInstance(entopts) {
    const self = this
    return new IFrameCreateInstanceEntity(self, entopts)
  }


  // Entity access: `client.IFrameInstance().list()` / `client.IFrameInstance().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  IFrameInstance(entopts) {
    const self = this
    return new IFrameInstanceEntity(self, entopts)
  }


  // Entity access: `client.Iframe().list()` / `client.Iframe().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Iframe(entopts) {
    const self = this
    return new IframeEntity(self, entopts)
  }


  // Entity access: `client.Init().list()` / `client.Init().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Init(entopts) {
    const self = this
    return new InitEntity(self, entopts)
  }


  // Entity access: `client.ListApiKeyScopesEntry().list()` / `client.ListApiKeyScopesEntry().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ListApiKeyScopesEntry(entopts) {
    const self = this
    return new ListApiKeyScopesEntryEntity(self, entopts)
  }


  // Entity access: `client.PaymentIframe().list()` / `client.PaymentIframe().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  PaymentIframe(entopts) {
    const self = this
    return new PaymentIframeEntity(self, entopts)
  }


  // Entity access: `client.ThreeDSecureAuth().list()` / `client.ThreeDSecureAuth().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ThreeDSecureAuth(entopts) {
    const self = this
    return new ThreeDSecureAuthEntity(self, entopts)
  }


  // Entity access: `client.ThreeDSecureBrowserInit().list()` / `client.ThreeDSecureBrowserInit().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ThreeDSecureBrowserInit(entopts) {
    const self = this
    return new ThreeDSecureBrowserInitEntity(self, entopts)
  }


  // Entity access: `client.ThreeDSecureStatus().list()` / `client.ThreeDSecureStatus().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  ThreeDSecureStatus(entopts) {
    const self = this
    return new ThreeDSecureStatusEntity(self, entopts)
  }


  // Entity access: `client.TransactionDetail().list()` / `client.TransactionDetail().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  TransactionDetail(entopts) {
    const self = this
    return new TransactionDetailEntity(self, entopts)
  }


  // Entity access: `client.Webhook().list()` / `client.Webhook().load({ id })`.
  // The argument is the entity OPTIONS object (passed to the entity
  // constructor as entopts), not initial entity data.
  Webhook(entopts) {
    const self = this
    return new WebhookEntity(self, entopts)
  }




  static test(testoptsarg, sdkoptsarg) {
    const struct = stdutil.struct
    const setpath = struct.setpath
    const getdef = struct.getdef
    const clone = struct.clone
    const setprop = struct.setprop

    const sdkopts = getdef(clone(sdkoptsarg), {})
    const testopts = getdef(clone(testoptsarg), {})
    setprop(testopts, 'active', true)
    setpath(sdkopts, 'feature.test', testopts)

    const testsdk = new BluefinPayconexSDK(sdkopts)
    testsdk._mode = 'test'

    return testsdk
  }


  tester(testopts, sdkopts) {
    return BluefinPayconexSDK.test(testopts, sdkopts)
  }


  toJSON() {
    return { name: 'BluefinPayconex' }
  }

  toString() {
    return 'BluefinPayconex ' + this._utility.struct.jsonify(this.toJSON())
  }

  [inspect.custom]() {
    return this.toString()
  }

}




const SDK = BluefinPayconexSDK


module.exports = {
  stdutil,
  config,

  BaseFeature,
  BluefinPayconexEntityBase,

  BluefinPayconexSDK,
  SDK,
}

