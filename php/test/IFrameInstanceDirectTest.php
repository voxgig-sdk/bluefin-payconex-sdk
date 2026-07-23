<?php
declare(strict_types=1);

// IFrameInstance direct test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;

class IFrameInstanceDirectTest extends TestCase
{
    public function test_direct_load_i_frame_instance(): void
    {
        $setup = i_frame_instance_direct_setup(["id" => "direct01"]);
        [$_shouldSkip, $_reason] = Runner::is_control_skipped("direct", "direct-load-i_frame_instance", $setup["live"] ? "live" : "unit");
        if ($_shouldSkip) {
            $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
            return;
        }
        $client = $setup["client"];

        $params = [];
        $query = [];
        if ($setup["live"]) {
            $params["account_id"] = 120615523104;
            $params["id"] = "ifri_2a08d8fc30b64a8a9d8b9f0ec37b59c9";
            $params["payment_iframe_id"] = "ifr_2a08d8fc30b64a8a9d8b9f0ec37b59c9";
        } else {
            $params["account_id"] = "direct01";
            $params["id"] = "direct02";
            $params["payment_iframe_id"] = "direct03";
        }

        $result = $client->direct([
            "path" => "api/v4/accounts/{account_id}/payment-iframe/{payment_iframe_id}/instance/{id}",
            "method" => "GET",
            "params" => $params,
            "query" => $query,
        ]);
        if ($setup["live"]) {
            // Live mode is lenient: synthetic IDs frequently 4xx. Skip
            // rather than fail when the load endpoint isn't reachable
            // with the IDs we can construct from setup.idmap.
            if (!empty($result["err"])) {
                $this->markTestSkipped("load call failed (likely synthetic IDs against live API): " . (string)$result["err"]);
                return;
            }
            if (empty($result["ok"])) {
                $this->markTestSkipped("load call not ok (likely synthetic IDs against live API)");
                return;
            }
            $status = Helpers::to_int($result["status"]);
            if ($status < 200 || $status >= 300) {
                $this->markTestSkipped("expected 2xx status, got " . $status);
                return;
            }
        } else {
            $this->assertArrayNotHasKey("err", $result);
            $this->assertTrue($result["ok"]);
            $this->assertEquals(200, Helpers::to_int($result["status"]));
            $this->assertNotNull($result["data"]);
            if (is_array($result["data"]) && isset($result["data"]["id"])) {
                $this->assertEquals("direct01", $result["data"]["id"]);
            }
            $this->assertCount(1, $setup["calls"]);
        }
    }

}


function i_frame_instance_direct_setup($mockres)
{
    Runner::load_env_local();

    $calls = new \ArrayObject();

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_I_FRAME_INSTANCE_ENTID" => [],
        "BLUEFINPAYCONEX_TEST_LIVE" => "FALSE",
        "BLUEFINPAYCONEX_APIKEY" => "NONE",
    ]);

    $live = $env["BLUEFINPAYCONEX_TEST_LIVE"] === "TRUE";

    if ($live) {
        $merged_opts = [
            "apikey" => $env["BLUEFINPAYCONEX_APIKEY"],
        ];
        $client = new BluefinPayconexSDK($merged_opts);
        return [
            "client" => $client,
            "calls" => $calls,
            "live" => true,
            "idmap" => [],
        ];
    }

    $mock_fetch = function ($url, $init) use ($calls, $mockres) {
        $calls[] = ["url" => $url, "init" => $init];
        return [
            [
                "status" => 200,
                "statusText" => "OK",
                "headers" => [],
                "json" => function () use ($mockres) {
                    if ($mockres !== null) {
                        return $mockres;
                    }
                    return ["id" => "direct01"];
                },
                "body" => "mock",
            ],
            null,
        ];
    };

    $client = new BluefinPayconexSDK([
        "base" => "http://localhost:8080",
        "system" => [
            "fetch" => $mock_fetch,
        ],
    ]);

    return [
        "client" => $client,
        "calls" => $calls,
        "live" => false,
        "idmap" => [],
    ];
}
