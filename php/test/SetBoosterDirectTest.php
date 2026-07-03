<?php
declare(strict_types=1);

// SetBooster direct test

require_once __DIR__ . '/../magicthegatheringtwo_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;

class SetBoosterDirectTest extends TestCase
{
    public function test_direct_list_set_booster(): void
    {
        $setup = set_booster_direct_setup([
            ["id" => "direct01"],
            ["id" => "direct02"],
        ]);
        [$_shouldSkip, $_reason] = Runner::is_control_skipped("direct", "direct-list-set_booster", $setup["live"] ? "live" : "unit");
        if ($_shouldSkip) {
            $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
            return;
        }
        if ($setup["live"]) {
            foreach (["set_booster01"] as $_liveKey) {
                if (!isset($setup["idmap"][$_liveKey]) || $setup["idmap"][$_liveKey] === null) {
                    $this->markTestSkipped("live test needs $_liveKey via *_ENTID env var (synthetic IDs only)");
                    return;
                }
            }
        }
        $client = $setup["client"];

        $params = [];
        if ($setup["live"]) {
            $params["id"] = $setup["idmap"]["set_booster01"];
        } else {
            $params["id"] = "direct01";
        }

        [$result, $err] = $client->direct([
            "path" => "sets/{id}/booster",
            "method" => "GET",
            "params" => $params,
        ]);
        if ($setup["live"]) {
            // Live mode is lenient: synthetic IDs frequently 4xx and the
            // list-response shape varies wildly across public APIs. Skip
            // rather than fail when the call doesn't return a usable list.
            if ($err !== null) {
                $this->markTestSkipped("list call failed (likely synthetic IDs against live API): " . (string)$err);
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
            $this->assertNull($err);
            $this->assertTrue($result["ok"]);
            $this->assertEquals(200, Helpers::to_int($result["status"]));
            $this->assertIsArray($result["data"]);
            $this->assertCount(2, $result["data"]);
            $this->assertCount(1, $setup["calls"]);
        }
    }

}


function set_booster_direct_setup($mockres)
{
    Runner::load_env_local();

    $calls = new \ArrayObject();

    $env = Runner::env_override([
        "MAGICTHEGATHERINGTWO_TEST_SET_BOOSTER_ENTID" => [],
        "MAGICTHEGATHERINGTWO_TEST_LIVE" => "FALSE",
        "MAGICTHEGATHERINGTWO_APIKEY" => "NONE",
    ]);

    $live = $env["MAGICTHEGATHERINGTWO_TEST_LIVE"] === "TRUE";

    if ($live) {
        $merged_opts = [
            "apikey" => $env["MAGICTHEGATHERINGTWO_APIKEY"],
        ];
        $client = new MagicTheGatheringTwoSDK($merged_opts);
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

    $client = new MagicTheGatheringTwoSDK([
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
