<?php
declare(strict_types=1);

// AccountUpdaterScheduleWithResult entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class AccountUpdaterScheduleWithResultEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->AccountUpdaterScheduleWithResult(null);
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
                "account_updater_schedule_with_result" => [
                    "s1" => ["id" => "s1"],
                    "s2" => ["id" => "s2"],
                    "s3" => ["id" => "s3"],
                ],
            ],
        ];

        // Fallback: streaming inactive -> yields the materialised list items.
        $base = BluefinPayconexSDK::test($seed, null);
        $seen = iterator_to_array($base->AccountUpdaterScheduleWithResult(null)->stream("list", null, null), false);
        $this->assertCount(3, $seen);

        // Inbound: streaming active -> yields each item from the feature.
        $cfg = BluefinPayconexConfig::make_config();
        if (isset($cfg["feature"]) && is_array($cfg["feature"]) && isset($cfg["feature"]["streaming"])) {
            $sdk = BluefinPayconexSDK::test($seed, ["feature" => ["streaming" => ["active" => true]]]);
            $got = [];
            foreach ($sdk->AccountUpdaterScheduleWithResult(null)->stream("list", null, null) as $item) {
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
        $setup = account_updater_schedule_with_result_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create", "list"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "account_updater_schedule_with_result." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $account_updater_schedule_with_result_ref01_ent = $client->AccountUpdaterScheduleWithResult(null);
        $account_updater_schedule_with_result_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.account_updater_schedule_with_result"), "account_updater_schedule_with_result_ref01"));
        $account_updater_schedule_with_result_ref01_data["account_id"] = $setup["idmap"]["account01"];
        $account_updater_schedule_with_result_ref01_data["schedule_id"] = $setup["idmap"]["schedule01"];

        $account_updater_schedule_with_result_ref01_data_result = $account_updater_schedule_with_result_ref01_ent->create($account_updater_schedule_with_result_ref01_data, null);
        $account_updater_schedule_with_result_ref01_data = Helpers::to_map($account_updater_schedule_with_result_ref01_data_result);
        $this->assertNotNull($account_updater_schedule_with_result_ref01_data);
        $this->assertNotNull($account_updater_schedule_with_result_ref01_data["id"]);

        // LIST
        $account_updater_schedule_with_result_ref01_match = [
            "account_id" => $setup["idmap"]["account01"],
            "schedule_id" => $setup["idmap"]["schedule01"],
        ];

        $account_updater_schedule_with_result_ref01_list_result = $account_updater_schedule_with_result_ref01_ent->list($account_updater_schedule_with_result_ref01_match, null);
        $this->assertIsArray($account_updater_schedule_with_result_ref01_list_result);

        $found_item = sdk_select(
            Runner::entity_list_to_data($account_updater_schedule_with_result_ref01_list_result),
            ["id" => $account_updater_schedule_with_result_ref01_data["id"]]);
        $this->assertNotEmpty($found_item);

    }
}

function account_updater_schedule_with_result_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/account_updater_schedule_with_result/AccountUpdaterScheduleWithResultTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["account_updater_schedule_with_result01", "account_updater_schedule_with_result02", "account_updater_schedule_with_result03", "account01", "account02", "account03", "schedule01", "schedule02", "schedule03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"]);
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
