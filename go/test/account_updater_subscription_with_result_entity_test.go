package sdktest

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/bluefin-payconex-sdk/go"
	"github.com/voxgig-sdk/bluefin-payconex-sdk/go/core"

	vs "github.com/voxgig-sdk/bluefin-payconex-sdk/go/utility/struct"
)

func TestAccountUpdaterSubscriptionWithResultEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.AccountUpdaterSubscriptionWithResult(nil)
		if ent == nil {
			t.Fatal("expected non-nil AccountUpdaterSubscriptionWithResultEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := account_updater_subscription_with_resultBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create", "update", "load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "account_updater_subscription_with_result." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		accountUpdaterSubscriptionWithResultRef01Ent := client.AccountUpdaterSubscriptionWithResult(nil)
		accountUpdaterSubscriptionWithResultRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "account_updater_subscription_with_result"}, setup.data), "account_updater_subscription_with_result_ref01"))
		accountUpdaterSubscriptionWithResultRef01Data["account_id"] = setup.idmap["account01"]
		accountUpdaterSubscriptionWithResultRef01Data["subscription_id"] = setup.idmap["subscription01"]

		accountUpdaterSubscriptionWithResultRef01DataResult, err := accountUpdaterSubscriptionWithResultRef01Ent.Create(accountUpdaterSubscriptionWithResultRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		accountUpdaterSubscriptionWithResultRef01Data = core.ToMapAny(accountUpdaterSubscriptionWithResultRef01DataResult)
		if accountUpdaterSubscriptionWithResultRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}
		if accountUpdaterSubscriptionWithResultRef01Data["id"] == nil {
			t.Fatal("expected created entity to have an id")
		}

		// UPDATE
		accountUpdaterSubscriptionWithResultRef01DataUp0Up := map[string]any{
			"id": accountUpdaterSubscriptionWithResultRef01Data["id"],
			"account_id": setup.idmap["account_id"],
		}

		accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name := "created_at"
		accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value := fmt.Sprintf("Mark01-account_updater_subscription_with_result_ref01_%d", setup.now)
		accountUpdaterSubscriptionWithResultRef01DataUp0Up[accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name] = accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value

		accountUpdaterSubscriptionWithResultRef01ResdataUp0Result, err := accountUpdaterSubscriptionWithResultRef01Ent.Update(accountUpdaterSubscriptionWithResultRef01DataUp0Up, nil)
		if err != nil {
			t.Fatalf("update failed: %v", err)
		}
		accountUpdaterSubscriptionWithResultRef01ResdataUp0 := core.ToMapAny(accountUpdaterSubscriptionWithResultRef01ResdataUp0Result)
		if accountUpdaterSubscriptionWithResultRef01ResdataUp0 == nil {
			t.Fatal("expected update result to be a map")
		}
		if accountUpdaterSubscriptionWithResultRef01ResdataUp0["id"] != accountUpdaterSubscriptionWithResultRef01DataUp0Up["id"] {
			t.Fatal("expected update result id to match")
		}
		if accountUpdaterSubscriptionWithResultRef01ResdataUp0[accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name] != accountUpdaterSubscriptionWithResultRef01MarkdefUp0Value {
			t.Fatalf("expected %s to be updated, got %v", accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name, accountUpdaterSubscriptionWithResultRef01ResdataUp0[accountUpdaterSubscriptionWithResultRef01MarkdefUp0Name])
		}

		// LOAD
		accountUpdaterSubscriptionWithResultRef01MatchDt0 := map[string]any{
			"id": accountUpdaterSubscriptionWithResultRef01Data["id"],
		}
		accountUpdaterSubscriptionWithResultRef01DataDt0Loaded, err := accountUpdaterSubscriptionWithResultRef01Ent.Load(accountUpdaterSubscriptionWithResultRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult := core.ToMapAny(accountUpdaterSubscriptionWithResultRef01DataDt0Loaded)
		if accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if accountUpdaterSubscriptionWithResultRef01DataDt0LoadResult["id"] != accountUpdaterSubscriptionWithResultRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

	})
}

func account_updater_subscription_with_resultBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "account_updater_subscription_with_result", "AccountUpdaterSubscriptionWithResultTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read account_updater_subscription_with_result test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse account_updater_subscription_with_result test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"account_updater_subscription_with_result01", "account_updater_subscription_with_result02", "account_updater_subscription_with_result03", "account01", "account02", "account03", "subscription01", "subscription02", "subscription03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID": idmap,
		"BLUEFINPAYCONEX_TEST_LIVE":      "FALSE",
		"BLUEFINPAYCONEX_TEST_EXPLAIN":   "FALSE",
		"BLUEFINPAYCONEX_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}
	// Add account_id alias for update test.
	if idmapResolved["account_id"] == nil {
		idmapResolved["account_id"] = idmapResolved["account01"]
	}

	if env["BLUEFINPAYCONEX_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["BLUEFINPAYCONEX_APIKEY"],
			},
			extra,
		})
		client = sdk.NewBluefinPayconexSDK(core.ToMapAny(mergedOpts))
	}

	live := env["BLUEFINPAYCONEX_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["BLUEFINPAYCONEX_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
