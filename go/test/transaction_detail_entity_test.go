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

func TestTransactionDetailEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.TransactionDetail(nil)
		if ent == nil {
			t.Fatal("expected non-nil TransactionDetailEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := transaction_detailBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"update", "load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "transaction_detail." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		transactionDetailRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.transaction_detail", setup.data)))
		var transactionDetailRef01Data map[string]any
		if len(transactionDetailRef01DataRaw) > 0 {
			transactionDetailRef01Data = core.ToMapAny(transactionDetailRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = transactionDetailRef01Data

		// UPDATE
		transactionDetailRef01Ent := client.TransactionDetail(nil)
		transactionDetailRef01DataUp0Up := map[string]any{
			"id": transactionDetailRef01Data["id"],
			"account_id": setup.idmap["account_id"],
		}

		transactionDetailRef01MarkdefUp0Name := "description"
		transactionDetailRef01MarkdefUp0Value := fmt.Sprintf("Mark01-transaction_detail_ref01_%d", setup.now)
		transactionDetailRef01DataUp0Up[transactionDetailRef01MarkdefUp0Name] = transactionDetailRef01MarkdefUp0Value

		transactionDetailRef01ResdataUp0Result, err := transactionDetailRef01Ent.Update(transactionDetailRef01DataUp0Up, nil)
		if err != nil {
			t.Fatalf("update failed: %v", err)
		}
		transactionDetailRef01ResdataUp0 := core.ToMapAny(transactionDetailRef01ResdataUp0Result)
		if transactionDetailRef01ResdataUp0 == nil {
			t.Fatal("expected update result to be a map")
		}
		if transactionDetailRef01ResdataUp0["id"] != transactionDetailRef01DataUp0Up["id"] {
			t.Fatal("expected update result id to match")
		}
		if transactionDetailRef01ResdataUp0[transactionDetailRef01MarkdefUp0Name] != transactionDetailRef01MarkdefUp0Value {
			t.Fatalf("expected %s to be updated, got %v", transactionDetailRef01MarkdefUp0Name, transactionDetailRef01ResdataUp0[transactionDetailRef01MarkdefUp0Name])
		}

		// LOAD
		transactionDetailRef01MatchDt0 := map[string]any{
			"id": transactionDetailRef01Data["id"],
		}
		transactionDetailRef01DataDt0Loaded, err := transactionDetailRef01Ent.Load(transactionDetailRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		transactionDetailRef01DataDt0LoadResult := core.ToMapAny(transactionDetailRef01DataDt0Loaded)
		if transactionDetailRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if transactionDetailRef01DataDt0LoadResult["id"] != transactionDetailRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

	})
}

func transaction_detailBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "transaction_detail", "TransactionDetailTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read transaction_detail test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse transaction_detail test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"transaction_detail01", "transaction_detail02", "transaction_detail03", "account01", "account02", "account03", "payment01", "payment02", "payment03"},
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
	entidEnvRaw := os.Getenv("BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID": idmap,
		"BLUEFINPAYCONEX_TEST_LIVE":      "FALSE",
		"BLUEFINPAYCONEX_TEST_EXPLAIN":   "FALSE",
		"BLUEFINPAYCONEX_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"])
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
