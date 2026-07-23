<?php
declare(strict_types=1);

// ApplePayMerchantDetail entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class ApplePayMerchantDetailEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->ApplePayMerchantDetail(null);
        $this->assertNotNull($ent);
    }

    // Feature #4: the entity stream(action, ...) method runs the op pipeline
    // and yields result items. With the streaming feature active it yields the
    // feature's incremental output; otherwise it falls back to the materialised
    // list so stream always yields.
    public function test_stream(): void
    {
        $seed = [
            "entity" => [
                "apple_pay_merchant_detail" => [
                    "s1" => ["id" => "s1"],
                    "s2" => ["id" => "s2"],
                    "s3" => ["id" => "s3"],
                ],
            ],
        ];

        // Fallback: streaming inactive -> yields the materialised list items.
        $base = BluefinPayconexSDK::test($seed, null);
        $seen = iterator_to_array($base->ApplePayMerchantDetail(null)->stream("list", null, null), false);
        $this->assertCount(3, $seen);

        // Inbound: streaming active -> yields each item from the feature.
        $cfg = BluefinPayconexConfig::make_config();
        if (isset($cfg["feature"]) && is_array($cfg["feature"]) && isset($cfg["feature"]["streaming"])) {
            $sdk = BluefinPayconexSDK::test($seed, ["feature" => ["streaming" => ["active" => true]]]);
            $got = [];
            foreach ($sdk->ApplePayMerchantDetail(null)->stream("list", null, null) as $item) {
                if (is_array($item) && array_is_list($item)) {
                    foreach ($item as $sub) {
                        $got[] = $sub;
                    }
                } else {
                    $got[] = $item;
                }
            }
            $this->assertCount(3, $got);
        }
    }

    public function test_basic_flow(): void
    {
        $setup = apple_pay_merchant_detail_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create", "list"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "apple_pay_merchant_detail." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $apple_pay_merchant_detail_ref01_ent = $client->ApplePayMerchantDetail(null);
        $apple_pay_merchant_detail_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.apple_pay_merchant_detail"), "apple_pay_merchant_detail_ref01"));
        $apple_pay_merchant_detail_ref01_data["account_id"] = $setup["idmap"]["account01"];

        $apple_pay_merchant_detail_ref01_data_result = $apple_pay_merchant_detail_ref01_ent->create($apple_pay_merchant_detail_ref01_data, null);
        $apple_pay_merchant_detail_ref01_data = Helpers::to_map($apple_pay_merchant_detail_ref01_data_result);
        $this->assertNotNull($apple_pay_merchant_detail_ref01_data);

        // LIST
        $apple_pay_merchant_detail_ref01_match = [
            "account_id" => $setup["idmap"]["account01"],
        ];

        $apple_pay_merchant_detail_ref01_list_result = $apple_pay_merchant_detail_ref01_ent->list($apple_pay_merchant_detail_ref01_match, null);
        $this->assertIsArray($apple_pay_merchant_detail_ref01_list_result);

    }
}

function apple_pay_merchant_detail_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/apple_pay_merchant_detail/ApplePayMerchantDetailTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["apple_pay_merchant_detail01", "apple_pay_merchant_detail02", "apple_pay_merchant_detail03", "account01", "account02", "account03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["BLUEFINPAYCONEX_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
                "apikey" => $env["BLUEFINPAYCONEX_APIKEY"],
            ],
            $extra ?? [],
        ]);
        $client = new BluefinPayconexSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["BLUEFINPAYCONEX_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["BLUEFINPAYCONEX_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
