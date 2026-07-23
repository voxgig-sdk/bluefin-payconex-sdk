<?php
declare(strict_types=1);

// ApiKey entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class ApiKeyEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->ApiKey(null);
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
                "api_key" => [
                    "s1" => ["id" => "s1"],
                    "s2" => ["id" => "s2"],
                    "s3" => ["id" => "s3"],
                ],
            ],
        ];

        // Fallback: streaming inactive -> yields the materialised list items.
        $base = BluefinPayconexSDK::test($seed, null);
        $seen = iterator_to_array($base->ApiKey(null)->stream("list", null, null), false);
        $this->assertCount(3, $seen);

        // Inbound: streaming active -> yields each item from the feature.
        $cfg = BluefinPayconexConfig::make_config();
        if (isset($cfg["feature"]) && is_array($cfg["feature"]) && isset($cfg["feature"]["streaming"])) {
            $sdk = BluefinPayconexSDK::test($seed, ["feature" => ["streaming" => ["active" => true]]]);
            $got = [];
            foreach ($sdk->ApiKey(null)->stream("list", null, null) as $item) {
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
        $setup = api_key_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create", "list", "update", "load", "remove"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "api_key." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_API_KEY_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $api_key_ref01_ent = $client->ApiKey(null);
        $api_key_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.api_key"), "api_key_ref01"));
        $api_key_ref01_data["account_id"] = $setup["idmap"]["account01"];

        $api_key_ref01_data_result = $api_key_ref01_ent->create($api_key_ref01_data, null);
        $api_key_ref01_data = Helpers::to_map($api_key_ref01_data_result);
        $this->assertNotNull($api_key_ref01_data);
        $this->assertNotNull($api_key_ref01_data["id"]);

        // LIST
        $api_key_ref01_match = [
            "account_id" => $setup["idmap"]["account01"],
        ];

        $api_key_ref01_list_result = $api_key_ref01_ent->list($api_key_ref01_match, null);
        $this->assertIsArray($api_key_ref01_list_result);

        $found_item = sdk_select(
            Runner::entity_list_to_data($api_key_ref01_list_result),
            ["id" => $api_key_ref01_data["id"]]);
        $this->assertNotEmpty($found_item);

        // UPDATE
        $api_key_ref01_data_up0_up = [
            "id" => $api_key_ref01_data["id"],
            "account_id" => $setup["idmap"]["account_id"],
        ];

        $api_key_ref01_markdef_up0_name = "expires_at";
        $api_key_ref01_markdef_up0_value = "Mark01-api_key_ref01_" . $setup["now"];
        $api_key_ref01_data_up0_up[$api_key_ref01_markdef_up0_name] = $api_key_ref01_markdef_up0_value;

        $api_key_ref01_resdata_up0_result = $api_key_ref01_ent->update($api_key_ref01_data_up0_up, null);
        $api_key_ref01_resdata_up0 = Helpers::to_map($api_key_ref01_resdata_up0_result);
        $this->assertNotNull($api_key_ref01_resdata_up0);
        $this->assertEquals($api_key_ref01_resdata_up0["id"], $api_key_ref01_data_up0_up["id"]);
        $this->assertEquals($api_key_ref01_resdata_up0[$api_key_ref01_markdef_up0_name], $api_key_ref01_markdef_up0_value);

        // LOAD
        $api_key_ref01_match_dt0 = [
            "id" => $api_key_ref01_data["id"],
        ];
        $api_key_ref01_data_dt0_loaded = $api_key_ref01_ent->load($api_key_ref01_match_dt0, null);
        $api_key_ref01_data_dt0_load_result = Helpers::to_map($api_key_ref01_data_dt0_loaded);
        $this->assertNotNull($api_key_ref01_data_dt0_load_result);
        $this->assertEquals($api_key_ref01_data_dt0_load_result["id"], $api_key_ref01_data["id"]);

        // REMOVE
        $api_key_ref01_match_rm0 = [
            "id" => $api_key_ref01_data["id"],
        ];
        $api_key_ref01_ent->remove($api_key_ref01_match_rm0, null);

        // LIST
        $api_key_ref01_match_rt0 = [
            "account_id" => $setup["idmap"]["account01"],
        ];

        $api_key_ref01_list_rt0_result = $api_key_ref01_ent->list($api_key_ref01_match_rt0, null);
        $this->assertIsArray($api_key_ref01_list_rt0_result);

        $not_found_item = sdk_select(
            Runner::entity_list_to_data($api_key_ref01_list_rt0_result),
            ["id" => $api_key_ref01_data["id"]]);
        $this->assertEmpty($not_found_item);

    }
}

function api_key_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/api_key/ApiKeyTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["api_key01", "api_key02", "api_key03", "account01", "account02", "account03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_API_KEY_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_API_KEY_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_API_KEY_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }
    if (!isset($idmap_resolved["account_id"])) {
        $idmap_resolved["account_id"] = $idmap_resolved["account01"];
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
