<?php
declare(strict_types=1);

// BluefinPayconex SDK

require_once __DIR__ . '/utility/struct/Struct.php';
require_once __DIR__ . '/core/UtilityType.php';
require_once __DIR__ . '/core/Spec.php';
require_once __DIR__ . '/core/Helpers.php';

// Load utility registration
require_once __DIR__ . '/utility/Register.php';

// Load config and features
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/features.php';

use Voxgig\Struct\Struct;

// Features record diagnostic state on the client as dynamic properties
// (_retry, _cache, _metrics, ...); allow them explicitly (PHP 8.2+
// deprecates implicit dynamic properties).
#[\AllowDynamicProperties]
class BluefinPayconexSDK
{
    public string $mode;
    public array $features;
    public ?array $options;

    private $_utility;
    private $_rootctx;

    public function __construct(array $options = [])
    {
        $this->mode = "live";
        $this->features = [];
        $this->options = null;

        $utility = new BluefinPayconexUtility();
        $this->_utility = $utility;

        $config = BluefinPayconexConfig::make_config();

        $this->_rootctx = ($utility->make_context)([
            "client" => $this,
            "utility" => $utility,
            "config" => $config,
            "options" => $options ?? [],
            "shared" => [],
        ], null);

        $this->options = ($utility->make_options)($this->_rootctx);

        if (Struct::getpath($this->options, "feature.test.active") === true) {
            $this->mode = "test";
        }

        $this->_rootctx->options = $this->options;

        // Add features in the resolved order (make_options puts an explicit
        // list order first, else defaults to test-first). Ordering matters: the
        // `test` feature installs the base mock transport and the transport
        // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        // current, so `test` must be added before them to sit at the base.
        $feature_opts = BluefinPayconexHelpers::to_map(Struct::getprop($this->options, "feature"));
        if ($feature_opts) {
            $featureorder = Struct::getpath($this->options, "__derived__.featureorder");
            if (is_array($featureorder)) {
                foreach ($featureorder as $fname) {
                    $fopts = BluefinPayconexHelpers::to_map($feature_opts[$fname] ?? null);
                    if ($fopts && isset($fopts["active"]) && $fopts["active"] === true) {
                        ($utility->feature_add)($this->_rootctx, BluefinPayconexFeatures::make_feature($fname));
                    }
                }
            }
        }

        // Add extension features.
        $extend_val = Struct::getprop($this->options, "extend");
        if (is_array($extend_val)) {
            foreach ($extend_val as $f) {
                if (is_object($f) && method_exists($f, 'get_name')) {
                    ($utility->feature_add)($this->_rootctx, $f);
                }
            }
        }

        // Initialize features.
        foreach ($this->features as $f) {
            ($utility->feature_init)($this->_rootctx, $f);
        }

        ($utility->feature_hook)($this->_rootctx, "PostConstruct");
    }

    public function options_map(): array
    {
        $out = Struct::clone($this->options);
        return is_array($out) ? $out : [];
    }

    public function get_utility()
    {
        return BluefinPayconexUtility::copy($this->_utility);
    }

    public function get_root_ctx()
    {
        return $this->_rootctx;
    }

    public function prepare(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;
        $fetchargs = $fetchargs ?? [];

        $ctrl = BluefinPayconexHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "prepare",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $opts = $this->options;
        $path = Struct::getprop($fetchargs, "path") ?? "";
        $path = is_string($path) ? $path : "";
        $method_val = Struct::getprop($fetchargs, "method") ?? "GET";
        $method_val = is_string($method_val) ? $method_val : "GET";
        $params = BluefinPayconexHelpers::to_map(Struct::getprop($fetchargs, "params")) ?? [];
        $query = BluefinPayconexHelpers::to_map(Struct::getprop($fetchargs, "query")) ?? [];
        $headers = ($utility->prepare_headers)($ctx);

        $base = Struct::getprop($opts, "base") ?? "";
        $base = is_string($base) ? $base : "";
        $prefix = Struct::getprop($opts, "prefix") ?? "";
        $prefix = is_string($prefix) ? $prefix : "";
        $suffix = Struct::getprop($opts, "suffix") ?? "";
        $suffix = is_string($suffix) ? $suffix : "";

        $ctx->spec = new BluefinPayconexSpec([
            "base" => $base, "prefix" => $prefix, "suffix" => $suffix,
            "path" => $path, "method" => $method_val,
            "params" => $params, "query" => $query, "headers" => $headers,
            "body" => Struct::getprop($fetchargs, "body"),
            "step" => "start",
        ]);

        // Merge user-provided headers.
        $uh = Struct::getprop($fetchargs, "headers");
        if (is_array($uh)) {
            foreach ($uh as $k => $v) {
                $ctx->spec->headers[$k] = $v;
            }
        }

        [$_, $err] = ($utility->prepare_auth)($ctx);
        if ($err) {
            return ($utility->make_error)($ctx, $err);
        }

        [$fetchdef, $fd_err] = ($utility->make_fetch_def)($ctx);
        if ($fd_err) {
            return ($utility->make_error)($ctx, $fd_err);
        }
        return $fetchdef;
    }

    public function direct(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;

        // direct() is the raw-HTTP escape hatch: it never throws, it returns
        // an {ok, err, ...} dict. prepare() now raises on error, so catch it
        // and surface the failure through the dict instead.
        try {
            $fetchdef = $this->prepare($fetchargs);
        } catch (\Throwable $err) {
            return ["ok" => false, "err" => $err];
        }

        $fetchargs = $fetchargs ?? [];
        $ctrl = BluefinPayconexHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "direct",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $url = $fetchdef["url"] ?? "";
        [$fetched, $fetch_err] = ($utility->fetcher)($ctx, $url, $fetchdef);

        if ($fetch_err) {
            return ["ok" => false, "err" => $fetch_err];
        }

        if ($fetched === null) {
            return [
                "ok" => false,
                "err" => $ctx->make_error("direct_no_response", "response: undefined"),
            ];
        }

        if (is_array($fetched)) {
            $status = BluefinPayconexHelpers::to_int(Struct::getprop($fetched, "status"));
            $headers = Struct::getprop($fetched, "headers") ?? [];

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing — calling json() on an empty body errors.
            $content_length = is_array($headers) ? ($headers["content-length"] ?? null) : null;
            $no_body = $status === 204 || $status === 304 || (string)$content_length === "0";

            $json_data = null;
            if (!$no_body) {
                $jf = Struct::getprop($fetched, "json");
                if (is_callable($jf)) {
                    try {
                        $json_data = $jf();
                    } catch (\Throwable $e) {
                        // Non-JSON body — leave data null but keep status/ok.
                        $json_data = null;
                    }
                }
            }

            return [
                "ok" => $status >= 200 && $status < 300,
                "status" => $status,
                "headers" => Struct::getprop($fetched, "headers"),
                "data" => $json_data,
            ];
        }

        return [
            "ok" => false,
            "err" => $ctx->make_error("direct_invalid", "invalid response type"),
        ];
    }


    private $_account_updater = null;

    // Canonical facade: $client->AccountUpdater()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->account_updater()
    // resolves here too.
    public function AccountUpdater($data = null)
    {
        require_once __DIR__ . '/entity/account_updater_entity.php';
        if ($data === null) {
            if ($this->_account_updater === null) {
                $this->_account_updater = new AccountUpdaterEntity($this, null);
            }
            return $this->_account_updater;
        }
        return new AccountUpdaterEntity($this, $data);
    }


    private $_account_updater_schedule = null;

    // Canonical facade: $client->AccountUpdaterSchedule()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->account_updater_schedule()
    // resolves here too.
    public function AccountUpdaterSchedule($data = null)
    {
        require_once __DIR__ . '/entity/account_updater_schedule_entity.php';
        if ($data === null) {
            if ($this->_account_updater_schedule === null) {
                $this->_account_updater_schedule = new AccountUpdaterScheduleEntity($this, null);
            }
            return $this->_account_updater_schedule;
        }
        return new AccountUpdaterScheduleEntity($this, $data);
    }


    private $_account_updater_schedule_with_result = null;

    // Canonical facade: $client->AccountUpdaterScheduleWithResult()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->account_updater_schedule_with_result()
    // resolves here too.
    public function AccountUpdaterScheduleWithResult($data = null)
    {
        require_once __DIR__ . '/entity/account_updater_schedule_with_result_entity.php';
        if ($data === null) {
            if ($this->_account_updater_schedule_with_result === null) {
                $this->_account_updater_schedule_with_result = new AccountUpdaterScheduleWithResultEntity($this, null);
            }
            return $this->_account_updater_schedule_with_result;
        }
        return new AccountUpdaterScheduleWithResultEntity($this, $data);
    }


    private $_account_updater_subscription_with_result = null;

    // Canonical facade: $client->AccountUpdaterSubscriptionWithResult()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->account_updater_subscription_with_result()
    // resolves here too.
    public function AccountUpdaterSubscriptionWithResult($data = null)
    {
        require_once __DIR__ . '/entity/account_updater_subscription_with_result_entity.php';
        if ($data === null) {
            if ($this->_account_updater_subscription_with_result === null) {
                $this->_account_updater_subscription_with_result = new AccountUpdaterSubscriptionWithResultEntity($this, null);
            }
            return $this->_account_updater_subscription_with_result;
        }
        return new AccountUpdaterSubscriptionWithResultEntity($this, $data);
    }


    private $_account_updater_update = null;

    // Canonical facade: $client->AccountUpdaterUpdate()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->account_updater_update()
    // resolves here too.
    public function AccountUpdaterUpdate($data = null)
    {
        require_once __DIR__ . '/entity/account_updater_update_entity.php';
        if ($data === null) {
            if ($this->_account_updater_update === null) {
                $this->_account_updater_update = new AccountUpdaterUpdateEntity($this, null);
            }
            return $this->_account_updater_update;
        }
        return new AccountUpdaterUpdateEntity($this, $data);
    }


    private $_api_key = null;

    // Canonical facade: $client->ApiKey()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->api_key()
    // resolves here too.
    public function ApiKey($data = null)
    {
        require_once __DIR__ . '/entity/api_key_entity.php';
        if ($data === null) {
            if ($this->_api_key === null) {
                $this->_api_key = new ApiKeyEntity($this, null);
            }
            return $this->_api_key;
        }
        return new ApiKeyEntity($this, $data);
    }


    private $_apple_pay_merchant_detail = null;

    // Canonical facade: $client->ApplePayMerchantDetail()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->apple_pay_merchant_detail()
    // resolves here too.
    public function ApplePayMerchantDetail($data = null)
    {
        require_once __DIR__ . '/entity/apple_pay_merchant_detail_entity.php';
        if ($data === null) {
            if ($this->_apple_pay_merchant_detail === null) {
                $this->_apple_pay_merchant_detail = new ApplePayMerchantDetailEntity($this, null);
            }
            return $this->_apple_pay_merchant_detail;
        }
        return new ApplePayMerchantDetailEntity($this, $data);
    }


    private $_apple_pay_session = null;

    // Canonical facade: $client->ApplePaySession()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->apple_pay_session()
    // resolves here too.
    public function ApplePaySession($data = null)
    {
        require_once __DIR__ . '/entity/apple_pay_session_entity.php';
        if ($data === null) {
            if ($this->_apple_pay_session === null) {
                $this->_apple_pay_session = new ApplePaySessionEntity($this, null);
            }
            return $this->_apple_pay_session;
        }
        return new ApplePaySessionEntity($this, $data);
    }


    private $_dynamic_descriptor = null;

    // Canonical facade: $client->DynamicDescriptor()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->dynamic_descriptor()
    // resolves here too.
    public function DynamicDescriptor($data = null)
    {
        require_once __DIR__ . '/entity/dynamic_descriptor_entity.php';
        if ($data === null) {
            if ($this->_dynamic_descriptor === null) {
                $this->_dynamic_descriptor = new DynamicDescriptorEntity($this, null);
            }
            return $this->_dynamic_descriptor;
        }
        return new DynamicDescriptorEntity($this, $data);
    }


    private $_i_frame_create_instance = null;

    // Canonical facade: $client->IFrameCreateInstance()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->i_frame_create_instance()
    // resolves here too.
    public function IFrameCreateInstance($data = null)
    {
        require_once __DIR__ . '/entity/i_frame_create_instance_entity.php';
        if ($data === null) {
            if ($this->_i_frame_create_instance === null) {
                $this->_i_frame_create_instance = new IFrameCreateInstanceEntity($this, null);
            }
            return $this->_i_frame_create_instance;
        }
        return new IFrameCreateInstanceEntity($this, $data);
    }


    private $_i_frame_instance = null;

    // Canonical facade: $client->IFrameInstance()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->i_frame_instance()
    // resolves here too.
    public function IFrameInstance($data = null)
    {
        require_once __DIR__ . '/entity/i_frame_instance_entity.php';
        if ($data === null) {
            if ($this->_i_frame_instance === null) {
                $this->_i_frame_instance = new IFrameInstanceEntity($this, null);
            }
            return $this->_i_frame_instance;
        }
        return new IFrameInstanceEntity($this, $data);
    }


    private $_iframe = null;

    // Canonical facade: $client->Iframe()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->iframe()
    // resolves here too.
    public function Iframe($data = null)
    {
        require_once __DIR__ . '/entity/iframe_entity.php';
        if ($data === null) {
            if ($this->_iframe === null) {
                $this->_iframe = new IframeEntity($this, null);
            }
            return $this->_iframe;
        }
        return new IframeEntity($this, $data);
    }


    private $_init = null;

    // Canonical facade: $client->Init()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->init()
    // resolves here too.
    public function Init($data = null)
    {
        require_once __DIR__ . '/entity/init_entity.php';
        if ($data === null) {
            if ($this->_init === null) {
                $this->_init = new InitEntity($this, null);
            }
            return $this->_init;
        }
        return new InitEntity($this, $data);
    }


    private $_list_api_key_scopes_entry = null;

    // Canonical facade: $client->ListApiKeyScopesEntry()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->list_api_key_scopes_entry()
    // resolves here too.
    public function ListApiKeyScopesEntry($data = null)
    {
        require_once __DIR__ . '/entity/list_api_key_scopes_entry_entity.php';
        if ($data === null) {
            if ($this->_list_api_key_scopes_entry === null) {
                $this->_list_api_key_scopes_entry = new ListApiKeyScopesEntryEntity($this, null);
            }
            return $this->_list_api_key_scopes_entry;
        }
        return new ListApiKeyScopesEntryEntity($this, $data);
    }


    private $_payment_iframe = null;

    // Canonical facade: $client->PaymentIframe()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->payment_iframe()
    // resolves here too.
    public function PaymentIframe($data = null)
    {
        require_once __DIR__ . '/entity/payment_iframe_entity.php';
        if ($data === null) {
            if ($this->_payment_iframe === null) {
                $this->_payment_iframe = new PaymentIframeEntity($this, null);
            }
            return $this->_payment_iframe;
        }
        return new PaymentIframeEntity($this, $data);
    }


    private $_three_d_secure_auth = null;

    // Canonical facade: $client->ThreeDSecureAuth()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->three_d_secure_auth()
    // resolves here too.
    public function ThreeDSecureAuth($data = null)
    {
        require_once __DIR__ . '/entity/three_d_secure_auth_entity.php';
        if ($data === null) {
            if ($this->_three_d_secure_auth === null) {
                $this->_three_d_secure_auth = new ThreeDSecureAuthEntity($this, null);
            }
            return $this->_three_d_secure_auth;
        }
        return new ThreeDSecureAuthEntity($this, $data);
    }


    private $_three_d_secure_browser_init = null;

    // Canonical facade: $client->ThreeDSecureBrowserInit()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->three_d_secure_browser_init()
    // resolves here too.
    public function ThreeDSecureBrowserInit($data = null)
    {
        require_once __DIR__ . '/entity/three_d_secure_browser_init_entity.php';
        if ($data === null) {
            if ($this->_three_d_secure_browser_init === null) {
                $this->_three_d_secure_browser_init = new ThreeDSecureBrowserInitEntity($this, null);
            }
            return $this->_three_d_secure_browser_init;
        }
        return new ThreeDSecureBrowserInitEntity($this, $data);
    }


    private $_three_d_secure_status = null;

    // Canonical facade: $client->ThreeDSecureStatus()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->three_d_secure_status()
    // resolves here too.
    public function ThreeDSecureStatus($data = null)
    {
        require_once __DIR__ . '/entity/three_d_secure_status_entity.php';
        if ($data === null) {
            if ($this->_three_d_secure_status === null) {
                $this->_three_d_secure_status = new ThreeDSecureStatusEntity($this, null);
            }
            return $this->_three_d_secure_status;
        }
        return new ThreeDSecureStatusEntity($this, $data);
    }


    private $_transaction_detail = null;

    // Canonical facade: $client->TransactionDetail()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->transaction_detail()
    // resolves here too.
    public function TransactionDetail($data = null)
    {
        require_once __DIR__ . '/entity/transaction_detail_entity.php';
        if ($data === null) {
            if ($this->_transaction_detail === null) {
                $this->_transaction_detail = new TransactionDetailEntity($this, null);
            }
            return $this->_transaction_detail;
        }
        return new TransactionDetailEntity($this, $data);
    }


    private $_webhook = null;

    // Canonical facade: $client->Webhook()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->webhook()
    // resolves here too.
    public function Webhook($data = null)
    {
        require_once __DIR__ . '/entity/webhook_entity.php';
        if ($data === null) {
            if ($this->_webhook === null) {
                $this->_webhook = new WebhookEntity($this, null);
            }
            return $this->_webhook;
        }
        return new WebhookEntity($this, $data);
    }



    public static function test(?array $testopts = null, ?array $sdkopts = null): self
    {
        $sdkopts = $sdkopts ?? [];
        $sdkopts = Struct::clone($sdkopts);
        $sdkopts = is_array($sdkopts) ? $sdkopts : [];

        $testopts = $testopts ?? [];
        $testopts = Struct::clone($testopts);
        $testopts = is_array($testopts) ? $testopts : [];
        $testopts["active"] = true;

        if (!isset($sdkopts["feature"])) {
            $sdkopts["feature"] = [];
        }
        $sdkopts["feature"]["test"] = $testopts;

        $sdk = new BluefinPayconexSDK($sdkopts);
        $sdk->mode = "test";
        return $sdk;
    }
}
