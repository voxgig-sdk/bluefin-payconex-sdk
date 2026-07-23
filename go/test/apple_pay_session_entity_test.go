package sdktest

import (
	"encoding/json"
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

func TestApplePaySessionEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.ApplePaySession(nil)
		if ent == nil {
			t.Fatal("expected non-nil ApplePaySessionEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := apple_pay_sessionBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "apple_pay_session." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_APPLE_PAY_SESSION_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		applePaySessionRef01Ent := client.ApplePaySession(nil)
		applePaySessionRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "apple_pay_session"}, setup.data), "apple_pay_session_ref01"))
		applePaySessionRef01Data["account_id"] = setup.idmap["account01"]

		applePaySessionRef01DataResult, err := applePaySessionRef01Ent.Create(applePaySessionRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		applePaySessionRef01Data = core.ToMapAny(applePaySessionRef01DataResult)
		if applePaySessionRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func apple_pay_sessionBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "apple_pay_session", "ApplePaySessionTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read apple_pay_session test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse apple_pay_session test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"apple_pay_session01", "apple_pay_session02", "apple_pay_session03", "account01", "account02", "account03"},
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
	entidEnvRaw := os.Getenv("BLUEFINPAYCONEX_TEST_APPLE_PAY_SESSION_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINPAYCONEX_TEST_APPLE_PAY_SESSION_ENTID": idmap,
		"BLUEFINPAYCONEX_TEST_LIVE":      "FALSE",
		"BLUEFINPAYCONEX_TEST_EXPLAIN":   "FALSE",
		"BLUEFINPAYCONEX_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINPAYCONEX_TEST_APPLE_PAY_SESSION_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
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
