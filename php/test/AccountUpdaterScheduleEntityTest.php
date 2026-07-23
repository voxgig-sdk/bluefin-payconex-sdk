<?php
declare(strict_types=1);

// AccountUpdaterSchedule entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class AccountUpdaterScheduleEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->AccountUpdaterSchedule(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = account_updater_schedule_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "account_updater_schedule." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $account_updater_schedule_ref01_ent = $client->AccountUpdaterSchedule(null);
        $account_updater_schedule_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.account_updater_schedule"), "account_updater_schedule_ref01"));
        $account_updater_schedule_ref01_data["account_id"] = $setup["idmap"]["account01"];

        $account_updater_schedule_ref01_data_result = $account_updater_schedule_ref01_ent->create($account_updater_schedule_ref01_data, null);
        $account_updater_schedule_ref01_data = Helpers::to_map($account_updater_schedule_ref01_data_result);
        $this->assertNotNull($account_updater_schedule_ref01_data);

    }
}

function account_updater_schedule_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/account_updater_schedule/AccountUpdaterScheduleTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["account_updater_schedule01", "account_updater_schedule02", "account_updater_schedule03", "account01", "account02", "account03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID"]);
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
