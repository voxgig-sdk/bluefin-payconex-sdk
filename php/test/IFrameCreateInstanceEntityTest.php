<?php
declare(strict_types=1);

// IFrameCreateInstance entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class IFrameCreateInstanceEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->IFrameCreateInstance(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = i_frame_create_instance_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "i_frame_create_instance." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $i_frame_create_instance_ref01_ent = $client->IFrameCreateInstance(null);
        $i_frame_create_instance_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.i_frame_create_instance"), "i_frame_create_instance_ref01"));
        $i_frame_create_instance_ref01_data["account_id"] = $setup["idmap"]["account01"];
        $i_frame_create_instance_ref01_data["payment_iframe_id"] = $setup["idmap"]["payment_iframe01"];

        $i_frame_create_instance_ref01_data_result = $i_frame_create_instance_ref01_ent->create($i_frame_create_instance_ref01_data, null);
        $i_frame_create_instance_ref01_data = Helpers::to_map($i_frame_create_instance_ref01_data_result);
        $this->assertNotNull($i_frame_create_instance_ref01_data);

    }
}

function i_frame_create_instance_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/i_frame_create_instance/IFrameCreateInstanceTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["i_frame_create_instance01", "i_frame_create_instance02", "i_frame_create_instance03", "account01", "account02", "account03", "payment_iframe01", "payment_iframe02", "payment_iframe03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID"]);
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
