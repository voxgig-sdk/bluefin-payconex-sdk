# BluefinPayconex SDK

from utility.voxgig_struct import voxgig_struct as vs
from core.utility_type import BluefinPayconexUtility
from core.spec import BluefinPayconexSpec
from core import helpers

# Load utility registration (populates Utility._registrar)
from utility import register

# Load features
from feature.base_feature import BluefinPayconexBaseFeature
from features import _make_feature


class BluefinPayconexSDK:

    def __init__(self, options=None):
        self.mode = "live"
        self.features = []
        self.options = None

        utility = BluefinPayconexUtility()
        self._utility = utility

        from config import make_config
        config = make_config()

        self._rootctx = utility.make_context({
            "client": self,
            "utility": utility,
            "config": config,
            "options": options if options is not None else {},
            "shared": {},
        }, None)

        self.options = utility.make_options(self._rootctx)

        if vs.getpath(self.options, "feature.test.active") is True:
            self.mode = "test"

        self._rootctx.options = self.options

        # Add features in the resolved order (make_options puts an explicit
        # list order first, else defaults to test-first). Ordering matters: the
        # `test` feature installs the base mock transport and the transport
        # features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        # current, so `test` must be added before them to sit at the base.
        feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
        if feature_opts is not None:
            featureorder = vs.getpath(self.options, "__derived__.featureorder")
            if isinstance(featureorder, list):
                for fname in featureorder:
                    fopts = helpers.to_map(feature_opts.get(fname))
                    if fopts is not None and fopts.get("active") is True:
                        utility.feature_add(self._rootctx, _make_feature(fname))

        # Add extension features.
        extend = vs.getprop(self.options, "extend")
        if isinstance(extend, list):
            for f in extend:
                if isinstance(f, dict) or (hasattr(f, "get_name") and callable(f.get_name)):
                    utility.feature_add(self._rootctx, f)

        # Initialize features.
        for f in self.features:
            utility.feature_init(self._rootctx, f)

        utility.feature_hook(self._rootctx, "PostConstruct")

        # #BuildFeatures

    def options_map(self):
        out = vs.clone(self.options)
        if isinstance(out, dict):
            return out
        return {}

    def get_utility(self):
        return BluefinPayconexUtility.copy(self._utility)

    def get_root_ctx(self):
        return self._rootctx

    def prepare(self, fetchargs=None):
        utility = self._utility

        if fetchargs is None:
            fetchargs = {}

        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "prepare",
            "ctrl": ctrl,
        }, self._rootctx)

        options = self.options

        path = vs.getprop(fetchargs, "path") or ""
        if not isinstance(path, str):
            path = ""

        method = vs.getprop(fetchargs, "method") or "GET"
        if not isinstance(method, str):
            method = "GET"

        params = helpers.to_map(vs.getprop(fetchargs, "params"))
        if params is None:
            params = {}
        query = helpers.to_map(vs.getprop(fetchargs, "query"))
        if query is None:
            query = {}

        headers = utility.prepare_headers(ctx)

        base = vs.getprop(options, "base") or ""
        if not isinstance(base, str):
            base = ""
        prefix = vs.getprop(options, "prefix") or ""
        if not isinstance(prefix, str):
            prefix = ""
        suffix = vs.getprop(options, "suffix") or ""
        if not isinstance(suffix, str):
            suffix = ""

        ctx.spec = BluefinPayconexSpec({
            "base": base,
            "prefix": prefix,
            "suffix": suffix,
            "path": path,
            "method": method,
            "params": params,
            "query": query,
            "headers": headers,
            "body": vs.getprop(fetchargs, "body"),
            "step": "start",
        })

        # Merge user-provided headers.
        uh = vs.getprop(fetchargs, "headers")
        if isinstance(uh, dict):
            for k, v in uh.items():
                ctx.spec.headers[k] = v

        _, err = utility.prepare_auth(ctx)
        if err is not None:
            raise err

        fetchdef, err = utility.make_fetch_def(ctx)
        if err is not None:
            raise err

        return fetchdef

    def direct(self, fetchargs=None):
        utility = self._utility

        try:
            fetchdef = self.prepare(fetchargs)
        except Exception as err:
            # direct() is the raw-HTTP escape hatch: it never raises, it
            # returns a result object callers branch on via result["ok"].
            return {"ok": False, "err": err}

        if fetchargs is None:
            fetchargs = {}
        ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl"))
        if ctrl is None:
            ctrl = {}

        ctx = utility.make_context({
            "opname": "direct",
            "ctrl": ctrl,
        }, self._rootctx)

        url = fetchdef.get("url", "")
        fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

        if fetch_err is not None:
            return {"ok": False, "err": fetch_err}

        if fetched is None:
            return {
                "ok": False,
                "err": ctx.make_error("direct_no_response", "response: undefined"),
            }

        if isinstance(fetched, dict):
            status = helpers.to_int(vs.getprop(fetched, "status"))
            headers = vs.getprop(fetched, "headers") or {}

            # No-body responses (204, 304) and explicit zero content-length
            # must skip JSON parsing — calling json() on an empty body raises.
            content_length = None
            if isinstance(headers, dict):
                content_length = headers.get("content-length")
            no_body = status in (204, 304) or str(content_length) == "0"

            json_data = None
            if not no_body:
                jf = vs.getprop(fetched, "json")
                if callable(jf):
                    try:
                        json_data = jf()
                    except Exception:
                        # Non-JSON body (e.g. text/plain, text/html). Surface
                        # status + headers but leave data as None.
                        json_data = None

            return {
                "ok": status >= 200 and status < 300,
                "status": status,
                "headers": headers,
                "data": json_data,
            }

        return {
            "ok": False,
            "err": ctx.make_error("direct_invalid", "invalid response type"),
        }


    def AccountUpdater(self, data=None) -> "AccountUpdaterEntity":
        """Entity factory: client.AccountUpdater().list() / client.AccountUpdater().load({"id": ...})."""
        from entity.account_updater_entity import AccountUpdaterEntity
        return AccountUpdaterEntity(self, data)


    def AccountUpdaterSchedule(self, data=None) -> "AccountUpdaterScheduleEntity":
        """Entity factory: client.AccountUpdaterSchedule().list() / client.AccountUpdaterSchedule().load({"id": ...})."""
        from entity.account_updater_schedule_entity import AccountUpdaterScheduleEntity
        return AccountUpdaterScheduleEntity(self, data)


    def AccountUpdaterScheduleWithResult(self, data=None) -> "AccountUpdaterScheduleWithResultEntity":
        """Entity factory: client.AccountUpdaterScheduleWithResult().list() / client.AccountUpdaterScheduleWithResult().load({"id": ...})."""
        from entity.account_updater_schedule_with_result_entity import AccountUpdaterScheduleWithResultEntity
        return AccountUpdaterScheduleWithResultEntity(self, data)


    def AccountUpdaterSubscriptionWithResult(self, data=None) -> "AccountUpdaterSubscriptionWithResultEntity":
        """Entity factory: client.AccountUpdaterSubscriptionWithResult().list() / client.AccountUpdaterSubscriptionWithResult().load({"id": ...})."""
        from entity.account_updater_subscription_with_result_entity import AccountUpdaterSubscriptionWithResultEntity
        return AccountUpdaterSubscriptionWithResultEntity(self, data)


    def AccountUpdaterUpdate(self, data=None) -> "AccountUpdaterUpdateEntity":
        """Entity factory: client.AccountUpdaterUpdate().list() / client.AccountUpdaterUpdate().load({"id": ...})."""
        from entity.account_updater_update_entity import AccountUpdaterUpdateEntity
        return AccountUpdaterUpdateEntity(self, data)


    def ApiKey(self, data=None) -> "ApiKeyEntity":
        """Entity factory: client.ApiKey().list() / client.ApiKey().load({"id": ...})."""
        from entity.api_key_entity import ApiKeyEntity
        return ApiKeyEntity(self, data)


    def ApplePayMerchantDetail(self, data=None) -> "ApplePayMerchantDetailEntity":
        """Entity factory: client.ApplePayMerchantDetail().list() / client.ApplePayMerchantDetail().load({"id": ...})."""
        from entity.apple_pay_merchant_detail_entity import ApplePayMerchantDetailEntity
        return ApplePayMerchantDetailEntity(self, data)


    def ApplePaySession(self, data=None) -> "ApplePaySessionEntity":
        """Entity factory: client.ApplePaySession().list() / client.ApplePaySession().load({"id": ...})."""
        from entity.apple_pay_session_entity import ApplePaySessionEntity
        return ApplePaySessionEntity(self, data)


    def DynamicDescriptor(self, data=None) -> "DynamicDescriptorEntity":
        """Entity factory: client.DynamicDescriptor().list() / client.DynamicDescriptor().load({"id": ...})."""
        from entity.dynamic_descriptor_entity import DynamicDescriptorEntity
        return DynamicDescriptorEntity(self, data)


    def IFrameCreateInstance(self, data=None) -> "IFrameCreateInstanceEntity":
        """Entity factory: client.IFrameCreateInstance().list() / client.IFrameCreateInstance().load({"id": ...})."""
        from entity.i_frame_create_instance_entity import IFrameCreateInstanceEntity
        return IFrameCreateInstanceEntity(self, data)


    def IFrameInstance(self, data=None) -> "IFrameInstanceEntity":
        """Entity factory: client.IFrameInstance().list() / client.IFrameInstance().load({"id": ...})."""
        from entity.i_frame_instance_entity import IFrameInstanceEntity
        return IFrameInstanceEntity(self, data)


    def Iframe(self, data=None) -> "IframeEntity":
        """Entity factory: client.Iframe().list() / client.Iframe().load({"id": ...})."""
        from entity.iframe_entity import IframeEntity
        return IframeEntity(self, data)


    def Init(self, data=None) -> "InitEntity":
        """Entity factory: client.Init().list() / client.Init().load({"id": ...})."""
        from entity.init_entity import InitEntity
        return InitEntity(self, data)


    def ListApiKeyScopesEntry(self, data=None) -> "ListApiKeyScopesEntryEntity":
        """Entity factory: client.ListApiKeyScopesEntry().list() / client.ListApiKeyScopesEntry().load({"id": ...})."""
        from entity.list_api_key_scopes_entry_entity import ListApiKeyScopesEntryEntity
        return ListApiKeyScopesEntryEntity(self, data)


    def PaymentIframe(self, data=None) -> "PaymentIframeEntity":
        """Entity factory: client.PaymentIframe().list() / client.PaymentIframe().load({"id": ...})."""
        from entity.payment_iframe_entity import PaymentIframeEntity
        return PaymentIframeEntity(self, data)


    def ThreeDSecureAuth(self, data=None) -> "ThreeDSecureAuthEntity":
        """Entity factory: client.ThreeDSecureAuth().list() / client.ThreeDSecureAuth().load({"id": ...})."""
        from entity.three_d_secure_auth_entity import ThreeDSecureAuthEntity
        return ThreeDSecureAuthEntity(self, data)


    def ThreeDSecureBrowserInit(self, data=None) -> "ThreeDSecureBrowserInitEntity":
        """Entity factory: client.ThreeDSecureBrowserInit().list() / client.ThreeDSecureBrowserInit().load({"id": ...})."""
        from entity.three_d_secure_browser_init_entity import ThreeDSecureBrowserInitEntity
        return ThreeDSecureBrowserInitEntity(self, data)


    def ThreeDSecureStatus(self, data=None) -> "ThreeDSecureStatusEntity":
        """Entity factory: client.ThreeDSecureStatus().list() / client.ThreeDSecureStatus().load({"id": ...})."""
        from entity.three_d_secure_status_entity import ThreeDSecureStatusEntity
        return ThreeDSecureStatusEntity(self, data)


    def TransactionDetail(self, data=None) -> "TransactionDetailEntity":
        """Entity factory: client.TransactionDetail().list() / client.TransactionDetail().load({"id": ...})."""
        from entity.transaction_detail_entity import TransactionDetailEntity
        return TransactionDetailEntity(self, data)


    def Webhook(self, data=None) -> "WebhookEntity":
        """Entity factory: client.Webhook().list() / client.Webhook().load({"id": ...})."""
        from entity.webhook_entity import WebhookEntity
        return WebhookEntity(self, data)



    @classmethod
    def test(cls, testopts=None, sdkopts=None) -> "BluefinPayconexSDK":
        if sdkopts is None:
            sdkopts = {}
        sdkopts = vs.clone(sdkopts)
        if not isinstance(sdkopts, dict):
            sdkopts = {}

        if testopts is None:
            testopts = {}
        testopts = vs.clone(testopts)
        if not isinstance(testopts, dict):
            testopts = {}
        testopts["active"] = True

        vs.setpath(sdkopts, "feature.test", testopts)

        sdk = cls(sdkopts)
        sdk.mode = "test"

        return sdk


from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from entity.account_updater_entity import AccountUpdaterEntity
    from entity.account_updater_schedule_entity import AccountUpdaterScheduleEntity
    from entity.account_updater_schedule_with_result_entity import AccountUpdaterScheduleWithResultEntity
    from entity.account_updater_subscription_with_result_entity import AccountUpdaterSubscriptionWithResultEntity
    from entity.account_updater_update_entity import AccountUpdaterUpdateEntity
    from entity.api_key_entity import ApiKeyEntity
    from entity.apple_pay_merchant_detail_entity import ApplePayMerchantDetailEntity
    from entity.apple_pay_session_entity import ApplePaySessionEntity
    from entity.dynamic_descriptor_entity import DynamicDescriptorEntity
    from entity.i_frame_create_instance_entity import IFrameCreateInstanceEntity
    from entity.i_frame_instance_entity import IFrameInstanceEntity
    from entity.iframe_entity import IframeEntity
    from entity.init_entity import InitEntity
    from entity.list_api_key_scopes_entry_entity import ListApiKeyScopesEntryEntity
    from entity.payment_iframe_entity import PaymentIframeEntity
    from entity.three_d_secure_auth_entity import ThreeDSecureAuthEntity
    from entity.three_d_secure_browser_init_entity import ThreeDSecureBrowserInitEntity
    from entity.three_d_secure_status_entity import ThreeDSecureStatusEntity
    from entity.transaction_detail_entity import TransactionDetailEntity
    from entity.webhook_entity import WebhookEntity
