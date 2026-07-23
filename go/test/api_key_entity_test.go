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

func TestApiKeyEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.ApiKey(nil)
		if ent == nil {
			t.Fatal("expected non-nil ApiKeyEntity")
		}
	})

	// Feature #4: the entity Stream(action, ...) method runs the op pipeline and
	// returns a channel over result items. With the streaming feature active it
	// yields the feature's incremental output; otherwise it falls back to the
	// materialised list so Stream always yields.
	t.Run("stream", func(t *testing.T) {
		seed := map[string]any{
			"entity": map[string]any{
				"api_key": map[string]any{
					"s1": map[string]any{"id": "s1"},
					"s2": map[string]any{"id": "s2"},
					"s3": map[string]any{"id": "s3"},
				},
			},
		}

		// Fallback: streaming inactive -> yields the materialised list items.
		base := sdk.TestSDK(seed, nil)
		var seen []any
		for item := range base.ApiKey(nil).Stream("list", nil, nil) {
			seen = append(seen, item)
		}
		if len(seen) != 3 {
			t.Fatalf("expected 3 streamed items, got %d", len(seen))
		}

		// Inbound: streaming active -> yields each item from the feature iterator.
		hasStreaming := false
		if fm, ok := core.MakeConfig()["feature"].(map[string]any); ok {
			_, hasStreaming = fm["streaming"]
		}
		if hasStreaming {
			streamSdk := sdk.TestSDK(seed, map[string]any{
				"feature": map[string]any{"streaming": map[string]any{"active": true}},
			})
			var got []any
			for item := range streamSdk.ApiKey(nil).Stream("list", nil, nil) {
				if sub, ok := item.([]any); ok {
					got = append(got, sub...)
				} else {
					got = append(got, item)
				}
			}
			if len(got) != 3 {
				t.Fatalf("expected 3 items via streaming feature, got %d", len(got))
			}
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := api_keyBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create", "list", "update", "load", "remove"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "api_key." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_API_KEY_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		apiKeyRef01Ent := client.ApiKey(nil)
		apiKeyRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "api_key"}, setup.data), "api_key_ref01"))
		apiKeyRef01Data["account_id"] = setup.idmap["account01"]

		apiKeyRef01DataResult, err := apiKeyRef01Ent.Create(apiKeyRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		apiKeyRef01Data = core.ToMapAny(apiKeyRef01DataResult)
		if apiKeyRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}
		if apiKeyRef01Data["id"] == nil {
			t.Fatal("expected created entity to have an id")
		}

		// LIST
		apiKeyRef01Match := map[string]any{
			"account_id": setup.idmap["account01"],
		}

		apiKeyRef01ListResult, err := apiKeyRef01Ent.List(apiKeyRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		apiKeyRef01List, apiKeyRef01ListOk := apiKeyRef01ListResult.([]any)
		if !apiKeyRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", apiKeyRef01ListResult)
		}

		foundItem := vs.Select(entityListToData(apiKeyRef01List), map[string]any{"id": apiKeyRef01Data["id"]})
		if vs.IsEmpty(foundItem) {
			t.Fatal("expected to find created entity in list")
		}

		// UPDATE
		apiKeyRef01DataUp0Up := map[string]any{
			"id": apiKeyRef01Data["id"],
			"account_id": setup.idmap["account_id"],
		}

		apiKeyRef01MarkdefUp0Name := "expires_at"
		apiKeyRef01MarkdefUp0Value := fmt.Sprintf("Mark01-api_key_ref01_%d", setup.now)
		apiKeyRef01DataUp0Up[apiKeyRef01MarkdefUp0Name] = apiKeyRef01MarkdefUp0Value

		apiKeyRef01ResdataUp0Result, err := apiKeyRef01Ent.Update(apiKeyRef01DataUp0Up, nil)
		if err != nil {
			t.Fatalf("update failed: %v", err)
		}
		apiKeyRef01ResdataUp0 := core.ToMapAny(apiKeyRef01ResdataUp0Result)
		if apiKeyRef01ResdataUp0 == nil {
			t.Fatal("expected update result to be a map")
		}
		if apiKeyRef01ResdataUp0["id"] != apiKeyRef01DataUp0Up["id"] {
			t.Fatal("expected update result id to match")
		}
		if apiKeyRef01ResdataUp0[apiKeyRef01MarkdefUp0Name] != apiKeyRef01MarkdefUp0Value {
			t.Fatalf("expected %s to be updated, got %v", apiKeyRef01MarkdefUp0Name, apiKeyRef01ResdataUp0[apiKeyRef01MarkdefUp0Name])
		}

		// LOAD
		apiKeyRef01MatchDt0 := map[string]any{
			"id": apiKeyRef01Data["id"],
		}
		apiKeyRef01DataDt0Loaded, err := apiKeyRef01Ent.Load(apiKeyRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		apiKeyRef01DataDt0LoadResult := core.ToMapAny(apiKeyRef01DataDt0Loaded)
		if apiKeyRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if apiKeyRef01DataDt0LoadResult["id"] != apiKeyRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

		// REMOVE
		apiKeyRef01MatchRm0 := map[string]any{
			"id": apiKeyRef01Data["id"],
		}
		_, err = apiKeyRef01Ent.Remove(apiKeyRef01MatchRm0, nil)
		if err != nil {
			t.Fatalf("remove failed: %v", err)
		}

		// LIST
		apiKeyRef01MatchRt0 := map[string]any{
			"account_id": setup.idmap["account01"],
		}

		apiKeyRef01ListRt0Result, err := apiKeyRef01Ent.List(apiKeyRef01MatchRt0, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		apiKeyRef01ListRt0, apiKeyRef01ListRt0Ok := apiKeyRef01ListRt0Result.([]any)
		if !apiKeyRef01ListRt0Ok {
			t.Fatalf("expected list result to be an array, got %T", apiKeyRef01ListRt0Result)
		}

		notFoundItem := vs.Select(entityListToData(apiKeyRef01ListRt0), map[string]any{"id": apiKeyRef01Data["id"]})
		if !vs.IsEmpty(notFoundItem) {
			t.Fatal("expected removed entity to not be in list")
		}

	})
}

func api_keyBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "api_key", "ApiKeyTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read api_key test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse api_key test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"api_key01", "api_key02", "api_key03", "account01", "account02", "account03"},
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
	entidEnvRaw := os.Getenv("BLUEFINPAYCONEX_TEST_API_KEY_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINPAYCONEX_TEST_API_KEY_ENTID": idmap,
		"BLUEFINPAYCONEX_TEST_LIVE":      "FALSE",
		"BLUEFINPAYCONEX_TEST_EXPLAIN":   "FALSE",
		"BLUEFINPAYCONEX_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINPAYCONEX_TEST_API_KEY_ENTID"])
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
