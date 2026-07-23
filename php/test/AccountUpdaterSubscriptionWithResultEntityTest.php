<?php
declare(strict_types=1);

// AccountUpdaterSubscriptionWithResult entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class AccountUpdaterSubscriptionWithResultEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->AccountUpdaterSubscriptionWithResult(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = account_updater_subscription_with_result_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create", "update", "load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "account_updater_subscription_with_result." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $account_updater_subscription_with_result_ref01_ent = $client->AccountUpdaterSubscriptionWithResult(null);
        $account_updater_subscription_with_result_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.account_updater_subscription_with_result"), "account_updater_subscription_with_result_ref01"));
        $account_updater_subscription_with_result_ref01_data["account_id"] = $setup["idmap"]["account01"];
        $account_updater_subscription_with_result_ref01_data["subscription_id"] = $setup["idmap"]["subscription01"];

        $account_updater_subscription_with_result_ref01_data_result = $account_updater_subscription_with_result_ref01_ent->create($account_updater_subscription_with_result_ref01_data, null);
        $account_updater_subscription_with_result_ref01_data = Helpers::to_map($account_updater_subscription_with_result_ref01_data_result);
        $this->assertNotNull($account_updater_subscription_with_result_ref01_data);
        $this->assertNotNull($account_updater_subscription_with_result_ref01_data["id"]);

        // UPDATE
        $account_updater_subscription_with_result_ref01_data_up0_up = [
            "id" => $account_updater_subscription_with_result_ref01_data["id"],
            "account_id" => $setup["idmap"]["account_id"],
        ];

        $account_updater_subscription_with_result_ref01_markdef_up0_name = "created_at";
        $account_updater_subscription_with_result_ref01_markdef_up0_value = "Mark01-account_updater_subscription_with_result_ref01_" . $setup["now"];
        $account_updater_subscription_with_result_ref01_data_up0_up[$account_updater_subscription_with_result_ref01_markdef_up0_name] = $account_updater_subscription_with_result_ref01_markdef_up0_value;

        $account_updater_subscription_with_result_ref01_resdata_up0_result = $account_updater_subscription_with_result_ref01_ent->update($account_updater_subscription_with_result_ref01_data_up0_up, null);
        $account_updater_subscription_with_result_ref01_resdata_up0 = Helpers::to_map($account_updater_subscription_with_result_ref01_resdata_up0_result);
        $this->assertNotNull($account_updater_subscription_with_result_ref01_resdata_up0);
        $this->assertEquals($account_updater_subscription_with_result_ref01_resdata_up0["id"], $account_updater_subscription_with_result_ref01_data_up0_up["id"]);
        $this->assertEquals($account_updater_subscription_with_result_ref01_resdata_up0[$account_updater_subscription_with_result_ref01_markdef_up0_name], $account_updater_subscription_with_result_ref01_markdef_up0_value);

        // LOAD
        $account_updater_subscription_with_result_ref01_match_dt0 = [
            "id" => $account_updater_subscription_with_result_ref01_data["id"],
        ];
        $account_updater_subscription_with_result_ref01_data_dt0_loaded = $account_updater_subscription_with_result_ref01_ent->load($account_updater_subscription_with_result_ref01_match_dt0, null);
        $account_updater_subscription_with_result_ref01_data_dt0_load_result = Helpers::to_map($account_updater_subscription_with_result_ref01_data_dt0_loaded);
        $this->assertNotNull($account_updater_subscription_with_result_ref01_data_dt0_load_result);
        $this->assertEquals($account_updater_subscription_with_result_ref01_data_dt0_load_result["id"], $account_updater_subscription_with_result_ref01_data["id"]);

    }
}

function account_updater_subscription_with_result_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["account_updater_subscription_with_result01", "account_updater_subscription_with_result02", "account_updater_subscription_with_result03", "account01", "account02", "account03", "subscription01", "subscription02", "subscription03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"]);
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
