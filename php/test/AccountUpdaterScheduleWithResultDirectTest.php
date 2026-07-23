<?php
declare(strict_types=1);

// AccountUpdaterScheduleWithResult direct test

require_once __DIR__ . '/../bluefinpayconex_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;

class AccountUpdaterScheduleWithResultDirectTest extends TestCase
{
    public function test_direct_list_account_updater_schedule_with_result(): void
    {
        $setup = account_updater_schedule_with_result_direct_setup([
            ["id" => "direct01"],
            ["id" => "direct02"],
        ]);
        [$_shouldSkip, $_reason] = Runner::is_control_skipped("direct", "direct-list-account_updater_schedule_with_result", $setup["live"] ? "live" : "unit");
        if ($_shouldSkip) {
            $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
            return;
        }
        if ($setup["live"]) {
            foreach (["account01", "schedule01"] as $_liveKey) {
                if (!isset($setup["idmap"][$_liveKey]) || $setup["idmap"][$_liveKey] === null) {
                    $this->markTestSkipped("live test needs $_liveKey via *_ENTID env var (synthetic IDs only)");
                    return;
                }
            }
        }
        $client = $setup["client"];

        $params = [];
        if ($setup["live"]) {
            $params["account_id"] = $setup["idmap"]["account01"];
        } else {
            $params["account_id"] = "direct01";
        }
        if ($setup["live"]) {
            $params["schedule_id"] = $setup["idmap"]["schedule01"];
        } else {
            $params["schedule_id"] = "direct01";
        }

        $result = $client->direct([
            "path" => "api/v4/accounts/{account_id}/account-updater/schedules/{schedule_id}/results",
            "method" => "GET",
            "params" => $params,
        ]);
        if ($setup["live"]) {
            // Live mode is lenient: synthetic IDs frequently 4xx and the
            // list-response shape varies wildly across public APIs. Skip
            // rather than fail when the call doesn't return a usable list.
            if (!empty($result["err"])) {
                $this->markTestSkipped("list call failed (likely synthetic IDs against live API): " . (string)$result["err"]);
                return;
            }
            if (empty($result["ok"])) {
                $this->markTestSkipped("list call not ok (likely synthetic IDs against live API)");
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
            $this->assertIsArray($result["data"]);
            $this->assertCount(2, $result["data"]);
            $this->assertCount(1, $setup["calls"]);
        }
    }

}


function account_updater_schedule_with_result_direct_setup($mockres)
{
    Runner::load_env_local();

    $calls = new \ArrayObject();

    $env = Runner::env_override([
        "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID" => [],
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
