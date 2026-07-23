<?php
declare(strict_types=1);

// TransactionDetail entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class TransactionDetailEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->TransactionDetail(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = transaction_detail_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["update", "load"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "transaction_detail." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // Bootstrap entity data from existing test data.
        $transaction_detail_ref01_data_raw = Vs::items(Helpers::to_map(
            Vs::getpath($setup["data"], "existing.transaction_detail")));
        $transaction_detail_ref01_data = null;
        if (count($transaction_detail_ref01_data_raw) > 0) {
            $transaction_detail_ref01_data = Helpers::to_map($transaction_detail_ref01_data_raw[0][1]);
        }

        // UPDATE
        $transaction_detail_ref01_ent = $client->TransactionDetail(null);
        $transaction_detail_ref01_data_up0_up = [
            "id" => $transaction_detail_ref01_data["id"],
            "account_id" => $setup["idmap"]["account_id"],
        ];

        $transaction_detail_ref01_markdef_up0_name = "description";
        $transaction_detail_ref01_markdef_up0_value = "Mark01-transaction_detail_ref01_" . $setup["now"];
        $transaction_detail_ref01_data_up0_up[$transaction_detail_ref01_markdef_up0_name] = $transaction_detail_ref01_markdef_up0_value;

        $transaction_detail_ref01_resdata_up0_result = $transaction_detail_ref01_ent->update($transaction_detail_ref01_data_up0_up, null);
        $transaction_detail_ref01_resdata_up0 = Helpers::to_map($transaction_detail_ref01_resdata_up0_result);
        $this->assertNotNull($transaction_detail_ref01_resdata_up0);
        $this->assertEquals($transaction_detail_ref01_resdata_up0["id"], $transaction_detail_ref01_data_up0_up["id"]);
        $this->assertEquals($transaction_detail_ref01_resdata_up0[$transaction_detail_ref01_markdef_up0_name], $transaction_detail_ref01_markdef_up0_value);

        // LOAD
        $transaction_detail_ref01_match_dt0 = [
            "id" => $transaction_detail_ref01_data["id"],
        ];
        $transaction_detail_ref01_data_dt0_loaded = $transaction_detail_ref01_ent->load($transaction_detail_ref01_match_dt0, null);
        $transaction_detail_ref01_data_dt0_load_result = Helpers::to_map($transaction_detail_ref01_data_dt0_loaded);
        $this->assertNotNull($transaction_detail_ref01_data_dt0_load_result);
        $this->assertEquals($transaction_detail_ref01_data_dt0_load_result["id"], $transaction_detail_ref01_data["id"]);

    }
}

function transaction_detail_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/transaction_detail/TransactionDetailTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["transaction_detail01", "transaction_detail02", "transaction_detail03", "account01", "account02", "account03", "payment01", "payment02", "payment03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"]);
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
