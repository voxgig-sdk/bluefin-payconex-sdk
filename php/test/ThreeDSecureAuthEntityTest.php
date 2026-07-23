<?php
declare(strict_types=1);

// ThreeDSecureAuth entity test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class ThreeDSecureAuthEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = BluefinPayconexSDK::test(null, null);
        $ent = $testsdk->ThreeDSecureAuth(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = three_d_secure_auth_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "three_d_secure_auth." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $three_d_secure_auth_ref01_ent = $client->ThreeDSecureAuth(null);
        $three_d_secure_auth_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.three_d_secure_auth"), "three_d_secure_auth_ref01"));
        $three_d_secure_auth_ref01_data["3_d_id"] = $setup["idmap"]["3_d01"];
        $three_d_secure_auth_ref01_data["account_id"] = $setup["idmap"]["account01"];

        $three_d_secure_auth_ref01_data_result = $three_d_secure_auth_ref01_ent->create($three_d_secure_auth_ref01_data, null);
        $three_d_secure_auth_ref01_data = Helpers::to_map($three_d_secure_auth_ref01_data_result);
        $this->assertNotNull($three_d_secure_auth_ref01_data);

    }
}

function three_d_secure_auth_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/three_d_secure_auth/ThreeDSecureAuthTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = BluefinPayconexSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["three_d_secure_auth01", "three_d_secure_auth02", "three_d_secure_auth03", "account01", "account02", "account03", "3_d01", "3_d02", "3_d03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID" => $idmap,
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_TEST_EXPLAIN" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID"]);
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
