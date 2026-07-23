// BluefinPayconexSDK client (generated — mirrors the go Main fragment).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::config::{make_config, make_feature};
use crate::core::context::{Context, CtxSpec};
use crate::core::error::BluefinPayconexError;
use crate::core::helpers::{call_json, get_bool, get_str, getp, getpath, jo, setp, to_int, to_map};
use crate::core::spec::Spec;
use crate::core::types::FeatureRef;
use crate::core::utility_type::Utility;
use crate::utility::voxgigstruct as vs;
use crate::utility::voxgigstruct::Value;

pub struct BluefinPayconexSDK {
    pub mode: RefCell<String>,
    options: RefCell<Value>,
    utility: Rc<Utility>,
    pub features: RefCell<Vec<FeatureRef>>,
    rootctx: RefCell<Option<Rc<Context>>>,
}

impl BluefinPayconexSDK {
    pub fn new(options: Value) -> Rc<BluefinPayconexSDK> {
        let sdk = Rc::new(BluefinPayconexSDK {
            mode: RefCell::new("live".to_string()),
            options: RefCell::new(Value::Noval),
            utility: Utility::new(),
            features: RefCell::new(Vec::new()),
            rootctx: RefCell::new(None),
        });

        let config = make_config();

        let rootctx = sdk.utility.make_context(
            CtxSpec {
                client: Some(sdk.clone()),
                utility: Some(sdk.utility.clone()),
                config: Some(config),
                options: Some(options),
                shared: Some(Value::empty_map()),
                ..Default::default()
            },
            None,
        );

        let opts = sdk.utility.make_options(&rootctx);
        *sdk.options.borrow_mut() = opts.clone();

        if getpath(&["feature", "test", "active"], &opts) == Value::Bool(true) {
            *sdk.mode.borrow_mut() = "test".to_string();
        }

        *rootctx.options.borrow_mut() = opts.clone();
        *sdk.rootctx.borrow_mut() = Some(rootctx.clone());

        // Add features in the resolved order (make_options puts an explicit
        // List order first, else defaults to test-first). Ordering matters:
        // the `test` feature installs the base mock transport and the
        // transport features (retry/cache/netsim/proxy/ratelimit) wrap
        // whatever is current, so `test` must be added before them to sit at
        // the base of the transport wrapper chain.
        let feature_opts = to_map(&getp(&opts, "feature"));
        if let Value::List(order) = getpath(&["__derived__", "featureorder"], &opts) {
            let names: Vec<String> = order
                .borrow()
                .iter()
                .filter_map(|v| match v {
                    Value::Str(s) => Some(s.clone()),
                    _ => None,
                })
                .collect();
            for fname in names {
                let fopts = getp(&feature_opts, &fname);
                if let Value::Map(_) = fopts {
                    if get_bool(&fopts, "active") == Some(true) {
                        sdk.utility.feature_add(&rootctx, make_feature(&fname));
                    }
                }
            }
        }

        // NOTE: go/ts also accept live Feature objects via an `extend`
        // option; rust options are pure data (Value), so extension features
        // are added with utility.feature_add directly instead.

        // Initialize features.
        let features: Vec<FeatureRef> = sdk.features.borrow().iter().cloned().collect();
        for f in features {
            sdk.utility.feature_init(&rootctx, &f);
        }

        sdk.utility.feature_hook(&rootctx, "PostConstruct");

        sdk
    }

    pub fn options_map(&self) -> Value {
        vs::clone(&self.options.borrow())
    }

    pub fn get_utility(&self) -> Rc<Utility> {
        Utility::copy(&self.utility)
    }

    pub fn get_root_ctx(&self) -> Rc<Context> {
        self.rootctx
            .borrow()
            .clone()
            .expect("SDK root context not initialised")
    }

    pub fn prepare(&self, fetchargs: Value) -> Result<Value, BluefinPayconexError> {
        let utility = &self.utility;

        let fetchargs = match fetchargs {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let ctrl = match to_map(&getp(&fetchargs, "ctrl")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let ctx = utility.make_context(
            CtxSpec {
                opname: Some("prepare".to_string()),
                ctrl: Some(ctrl),
                ..Default::default()
            },
            Some(&self.get_root_ctx()),
        );

        let options = self.options.borrow().clone();

        let path = get_str(&fetchargs, "path").unwrap_or_default();
        let method = get_str(&fetchargs, "method")
            .filter(|m| !m.is_empty())
            .unwrap_or_else(|| "GET".to_string());

        let params = match to_map(&getp(&fetchargs, "params")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };
        let query = match to_map(&getp(&fetchargs, "query")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let headers = utility.prepare_headers(&ctx);

        let specmap = jo(vec![
            ("base", getp(&options, "base")),
            ("prefix", getp(&options, "prefix")),
            ("suffix", getp(&options, "suffix")),
            ("path", Value::str(path)),
            ("method", Value::str(method)),
            ("params", params),
            ("query", query),
            ("headers", headers),
            ("body", getp(&fetchargs, "body")),
            ("step", Value::str("start")),
        ]);
        let spec = Rc::new(RefCell::new(Spec::new(&specmap)));
        *ctx.spec.borrow_mut() = Some(spec.clone());

        // Merge user-provided headers.
        if let Value::Map(uh) = getp(&fetchargs, "headers") {
            let spec_headers = spec.borrow().headers.clone();
            for (k, v) in uh.borrow().iter() {
                setp(&spec_headers, k, v.clone());
            }
        }

        utility.prepare_auth(&ctx)?;

        utility.make_fetch_def(&ctx)
    }

    pub fn direct(&self, fetchargs: Value) -> Result<Value, BluefinPayconexError> {
        let utility = &self.utility;

        let fetchdef = match self.prepare(fetchargs.clone()) {
            Ok(fd) => fd,
            Err(err) => {
                return Ok(jo(vec![
                    ("ok", Value::Bool(false)),
                    ("err", Value::str(err.msg.clone())),
                ]));
            }
        };

        let ctrl = match to_map(&getp(&fetchargs, "ctrl")) {
            Value::Map(m) => Value::Map(m),
            _ => Value::empty_map(),
        };

        let ctx = utility.make_context(
            CtxSpec {
                opname: Some("direct".to_string()),
                ctrl: Some(ctrl),
                ..Default::default()
            },
            Some(&self.get_root_ctx()),
        );

        let url = get_str(&fetchdef, "url").unwrap_or_default();
        let fetched = utility.fetch(&ctx, &url, &fetchdef);

        let fetched = match fetched {
            Err(err) => {
                return Ok(jo(vec![
                    ("ok", Value::Bool(false)),
                    ("err", Value::str(err.msg.clone())),
                ]));
            }
            Ok(f) => f,
        };

        if fetched.is_noval() || fetched.is_null() {
            return Ok(jo(vec![
                ("ok", Value::Bool(false)),
                ("err", Value::str("response: undefined")),
            ]));
        }

        if let Value::Map(_) = &fetched {
            let status = to_int(&getp(&fetched, "status"));
            let headers = getp(&fetched, "headers");

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing.
            let content_length = match getp(&headers, "content-length") {
                Value::Str(s) => s,
                Value::Num(n) => format!("{}", n as i64),
                _ => String::new(),
            };
            let no_body = status == 204 || status == 304 || content_length == "0";

            let json_data = if no_body {
                Value::Noval
            } else {
                let jf = getp(&fetched, "json");
                if let Value::Func(_) = jf {
                    call_json(&jf)
                } else {
                    Value::Noval
                }
            };

            return Ok(jo(vec![
                ("ok", Value::Bool((200..300).contains(&status))),
                ("status", Value::Num(status as f64)),
                ("headers", headers),
                ("data", json_data),
            ]));
        }

        Ok(jo(vec![
            ("ok", Value::Bool(false)),
            ("err", Value::str("invalid response type")),
        ]))
    }


    /// AccountUpdater entity bound to this client.
    pub fn account_updater(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::account_updater::AccountUpdaterEntity> {
        crate::entity::account_updater::AccountUpdaterEntity::new(self, entopts)
    }

    /// AccountUpdaterSchedule entity bound to this client.
    pub fn account_updater_schedule(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::account_updater_schedule::AccountUpdaterScheduleEntity> {
        crate::entity::account_updater_schedule::AccountUpdaterScheduleEntity::new(self, entopts)
    }

    /// AccountUpdaterScheduleWithResult entity bound to this client.
    pub fn account_updater_schedule_with_result(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::account_updater_schedule_with_result::AccountUpdaterScheduleWithResultEntity> {
        crate::entity::account_updater_schedule_with_result::AccountUpdaterScheduleWithResultEntity::new(self, entopts)
    }

    /// AccountUpdaterSubscriptionWithResult entity bound to this client.
    pub fn account_updater_subscription_with_result(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::account_updater_subscription_with_result::AccountUpdaterSubscriptionWithResultEntity> {
        crate::entity::account_updater_subscription_with_result::AccountUpdaterSubscriptionWithResultEntity::new(self, entopts)
    }

    /// AccountUpdaterUpdate entity bound to this client.
    pub fn account_updater_update(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::account_updater_update::AccountUpdaterUpdateEntity> {
        crate::entity::account_updater_update::AccountUpdaterUpdateEntity::new(self, entopts)
    }

    /// ApiKey entity bound to this client.
    pub fn api_key(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::api_key::ApiKeyEntity> {
        crate::entity::api_key::ApiKeyEntity::new(self, entopts)
    }

    /// ApplePayMerchantDetail entity bound to this client.
    pub fn apple_pay_merchant_detail(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::apple_pay_merchant_detail::ApplePayMerchantDetailEntity> {
        crate::entity::apple_pay_merchant_detail::ApplePayMerchantDetailEntity::new(self, entopts)
    }

    /// ApplePaySession entity bound to this client.
    pub fn apple_pay_session(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::apple_pay_session::ApplePaySessionEntity> {
        crate::entity::apple_pay_session::ApplePaySessionEntity::new(self, entopts)
    }

    /// DynamicDescriptor entity bound to this client.
    pub fn dynamic_descriptor(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::dynamic_descriptor::DynamicDescriptorEntity> {
        crate::entity::dynamic_descriptor::DynamicDescriptorEntity::new(self, entopts)
    }

    /// IFrameCreateInstance entity bound to this client.
    pub fn i_frame_create_instance(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::i_frame_create_instance::IFrameCreateInstanceEntity> {
        crate::entity::i_frame_create_instance::IFrameCreateInstanceEntity::new(self, entopts)
    }

    /// IFrameInstance entity bound to this client.
    pub fn i_frame_instance(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::i_frame_instance::IFrameInstanceEntity> {
        crate::entity::i_frame_instance::IFrameInstanceEntity::new(self, entopts)
    }

    /// Iframe entity bound to this client.
    pub fn iframe(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::iframe::IframeEntity> {
        crate::entity::iframe::IframeEntity::new(self, entopts)
    }

    /// Init entity bound to this client.
    pub fn init(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::init::InitEntity> {
        crate::entity::init::InitEntity::new(self, entopts)
    }

    /// ListApiKeyScopesEntry entity bound to this client.
    pub fn list_api_key_scopes_entry(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::list_api_key_scopes_entry::ListApiKeyScopesEntryEntity> {
        crate::entity::list_api_key_scopes_entry::ListApiKeyScopesEntryEntity::new(self, entopts)
    }

    /// PaymentIframe entity bound to this client.
    pub fn payment_iframe(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::payment_iframe::PaymentIframeEntity> {
        crate::entity::payment_iframe::PaymentIframeEntity::new(self, entopts)
    }

    /// ThreeDSecureAuth entity bound to this client.
    pub fn three_d_secure_auth(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::three_d_secure_auth::ThreeDSecureAuthEntity> {
        crate::entity::three_d_secure_auth::ThreeDSecureAuthEntity::new(self, entopts)
    }

    /// ThreeDSecureBrowserInit entity bound to this client.
    pub fn three_d_secure_browser_init(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::three_d_secure_browser_init::ThreeDSecureBrowserInitEntity> {
        crate::entity::three_d_secure_browser_init::ThreeDSecureBrowserInitEntity::new(self, entopts)
    }

    /// ThreeDSecureStatus entity bound to this client.
    pub fn three_d_secure_status(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::three_d_secure_status::ThreeDSecureStatusEntity> {
        crate::entity::three_d_secure_status::ThreeDSecureStatusEntity::new(self, entopts)
    }

    /// TransactionDetail entity bound to this client.
    pub fn transaction_detail(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::transaction_detail::TransactionDetailEntity> {
        crate::entity::transaction_detail::TransactionDetailEntity::new(self, entopts)
    }

    /// Webhook entity bound to this client.
    pub fn webhook(self: &Rc<Self>, entopts: Value) -> Rc<crate::entity::webhook::WebhookEntity> {
        crate::entity::webhook::WebhookEntity::new(self, entopts)
    }

}

pub fn test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinPayconexSDK> {
    let sdkopts = match sdkopts {
        Value::Map(_) => vs::clone(&sdkopts),
        _ => Value::empty_map(),
    };

    let testopts = match testopts {
        Value::Map(_) => vs::clone(&testopts),
        _ => Value::empty_map(),
    };
    setp(&testopts, "active", Value::Bool(true));

    // set_path mutates `sdkopts` in place and returns the inner parent node;
    // discard the return so we pass the full options root (mirrors go's
    // vs.SetPath(sdkopts, ...) which does not rebind).
    vs::set_path(
        &sdkopts,
        &Value::list(vec![Value::str("feature"), Value::str("test")]),
        testopts,
        None,
    );

    let sdk = BluefinPayconexSDK::new(sdkopts);
    *sdk.mode.borrow_mut() = "test".to_string();

    sdk
}
