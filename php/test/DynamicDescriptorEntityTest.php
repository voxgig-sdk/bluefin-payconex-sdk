<?php
declare(strict_types=1);

// DynamicDescriptor entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class DynamicDescriptorEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->DynamicDescriptor(null);
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
                "dynamic_descriptor" => [
                    "s1" => ["id" => "s1"],
                    "s2" => ["id" => "s2"],
                    "s3" => ["id" => "s3"],
                ],
            ],
        ];

        // Fallback: streaming inactive -> yields the materialised list items.
        $base = BluefinPayconexSDK::test($seed, null);
        $seen = iterator_to_array($base->DynamicDescriptor(null)->stream("list", null, null), false);
        $this->assertCount(3, $seen);

        // Inbound: streaming active -> yields each item from the feature.
        $cfg = BluefinPayconexConfig::make_config();
        if (isset($cfg["feature"]) && is_array($cfg["feature"]) && isset($cfg["feature"]["streaming"])) {
            $sdk = BluefinPayconexSDK::test($seed, ["feature" => ["streaming" => ["active" => true]]]);
            $got = [];
            foreach ($sdk->DynamicDescriptor(null)->stream("list", null, null) as $item) {
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
        $setup = dynamic_descriptor_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create", "list", "update", "load", "remove"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "dynamic_descriptor." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $dynamic_descriptor_ref01_ent = $client->DynamicDescriptor(null);
        $dynamic_descriptor_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.dynamic_descriptor"), "dynamic_descriptor_ref01"));
        $dynamic_descriptor_ref01_data["account_id"] = $setup["idmap"]["account01"];

        $dynamic_descriptor_ref01_data_result = $dynamic_descriptor_ref01_ent->create($dynamic_descriptor_ref01_data, null);
        $dynamic_descriptor_ref01_data = Helpers::to_map($dynamic_descriptor_ref01_data_result);
        $this->assertNotNull($dynamic_descriptor_ref01_data);
        $this->assertNotNull($dynamic_descriptor_ref01_data["id"]);

        // LIST
        $dynamic_descriptor_ref01_match = [
            "account_id" => $setup["idmap"]["account01"],
        ];

        $dynamic_descriptor_ref01_list_result = $dynamic_descriptor_ref01_ent->list($dynamic_descriptor_ref01_match, null);
        $this->assertIsArray($dynamic_descriptor_ref01_list_result);

        $found_item = sdk_select(
            Runner::entity_list_to_data($dynamic_descriptor_ref01_list_result),
            ["id" => $dynamic_descriptor_ref01_data["id"]]);
        $this->assertNotEmpty($found_item);

        // UPDATE
        $dynamic_descriptor_ref01_data_up0_up = [
            "id" => $dynamic_descriptor_ref01_data["id"],
            "account_id" => $setup["idmap"]["account_id"],
        ];

        $dynamic_descriptor_ref01_markdef_up0_name = "city";
        $dynamic_descriptor_ref01_markdef_up0_value = "Mark01-dynamic_descriptor_ref01_" . $setup["now"];
        $dynamic_descriptor_ref01_data_up0_up[$dynamic_descriptor_ref01_markdef_up0_name] = $dynamic_descriptor_ref01_markdef_up0_value;

        $dynamic_descriptor_ref01_resdata_up0_result = $dynamic_descriptor_ref01_ent->update($dynamic_descriptor_ref01_data_up0_up, null);
        $dynamic_descriptor_ref01_resdata_up0 = Helpers::to_map($dynamic_descriptor_ref01_resdata_up0_result);
        $this->assertNotNull($dynamic_descriptor_ref01_resdata_up0);
        $this->assertEquals($dynamic_descriptor_ref01_resdata_up0["id"], $dynamic_descriptor_ref01_data_up0_up["id"]);
        $this->assertEquals($dynamic_descriptor_ref01_resdata_up0[$dynamic_descriptor_ref01_markdef_up0_name], $dynamic_descriptor_ref01_markdef_up0_value);

        // LOAD
        $dynamic_descriptor_ref01_match_dt0 = [
            "id" => $dynamic_descriptor_ref01_data["id"],
        ];
        $dynamic_descriptor_ref01_data_dt0_loaded = $dynamic_descriptor_ref01_ent->load($dynamic_descriptor_ref01_match_dt0, null);
        $dynamic_descriptor_ref01_data_dt0_load_result = Helpers::to_map($dynamic_descriptor_ref01_data_dt0_loaded);
        $this->assertNotNull($dynamic_descriptor_ref01_data_dt0_load_result);
        $this->assertEquals($dynamic_descriptor_ref01_data_dt0_load_result["id"], $dynamic_descriptor_ref01_data["id"]);

        // REMOVE
        $dynamic_descriptor_ref01_match_rm0 = [
            "id" => $dynamic_descriptor_ref01_data["id"],
        ];
        $dynamic_descriptor_ref01_ent->remove($dynamic_descriptor_ref01_match_rm0, null);

        // LIST
        $dynamic_descriptor_ref01_match_rt0 = [
            "account_id" => $setup["idmap"]["account01"],
        ];

        $dynamic_descriptor_ref01_list_rt0_result = $dynamic_descriptor_ref01_ent->list($dynamic_descriptor_ref01_match_rt0, null);
        $this->assertIsArray($dynamic_descriptor_ref01_list_rt0_result);

        $not_found_item = sdk_select(
            Runner::entity_list_to_data($dynamic_descriptor_ref01_list_rt0_result),
            ["id" => $dynamic_descriptor_ref01_data["id"]]);
        $this->assertEmpty($not_found_item);

    }
}

function dynamic_descriptor_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/dynamic_descriptor/DynamicDescriptorTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["dynamic_descriptor01", "dynamic_descriptor02", "dynamic_descriptor03", "account01", "account02", "account03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID"]);
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
