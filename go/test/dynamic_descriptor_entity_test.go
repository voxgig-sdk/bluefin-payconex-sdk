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

func TestDynamicDescriptorEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.DynamicDescriptor(nil)
		if ent == nil {
			t.Fatal("expected non-nil DynamicDescriptorEntity")
		}
	})

	// Feature #4: the entity Stream(action, ...) method runs the op pipeline and
	// returns a channel over result items. With the streaming feature active it
	// yields the feature's incremental output; otherwise it falls back to the
	// materialised list so Stream always yields.
	t.Run("stream", func(t *testing.T) {
		seed := map[string]any{
			"entity": map[string]any{
				"dynamic_descriptor": map[string]any{
					"s1": map[string]any{"id": "s1"},
					"s2": map[string]any{"id": "s2"},
					"s3": map[string]any{"id": "s3"},
				},
			},
		}

		// Fallback: streaming inactive -> yields the materialised list items.
		base := sdk.TestSDK(seed, nil)
		var seen []any
		for item := range base.DynamicDescriptor(nil).Stream("list", nil, nil) {
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
			for item := range streamSdk.DynamicDescriptor(nil).Stream("list", nil, nil) {
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
		setup := dynamic_descriptorBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create", "list", "update", "load", "remove"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "dynamic_descriptor." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		dynamicDescriptorRef01Ent := client.DynamicDescriptor(nil)
		dynamicDescriptorRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "dynamic_descriptor"}, setup.data), "dynamic_descriptor_ref01"))
		dynamicDescriptorRef01Data["account_id"] = setup.idmap["account01"]

		dynamicDescriptorRef01DataResult, err := dynamicDescriptorRef01Ent.Create(dynamicDescriptorRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		dynamicDescriptorRef01Data = core.ToMapAny(dynamicDescriptorRef01DataResult)
		if dynamicDescriptorRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}
		if dynamicDescriptorRef01Data["id"] == nil {
			t.Fatal("expected created entity to have an id")
		}

		// LIST
		dynamicDescriptorRef01Match := map[string]any{
			"account_id": setup.idmap["account01"],
		}

		dynamicDescriptorRef01ListResult, err := dynamicDescriptorRef01Ent.List(dynamicDescriptorRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		dynamicDescriptorRef01List, dynamicDescriptorRef01ListOk := dynamicDescriptorRef01ListResult.([]any)
		if !dynamicDescriptorRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", dynamicDescriptorRef01ListResult)
		}

		foundItem := vs.Select(entityListToData(dynamicDescriptorRef01List), map[string]any{"id": dynamicDescriptorRef01Data["id"]})
		if vs.IsEmpty(foundItem) {
			t.Fatal("expected to find created entity in list")
		}

		// UPDATE
		dynamicDescriptorRef01DataUp0Up := map[string]any{
			"id": dynamicDescriptorRef01Data["id"],
			"account_id": setup.idmap["account_id"],
		}

		dynamicDescriptorRef01MarkdefUp0Name := "city"
		dynamicDescriptorRef01MarkdefUp0Value := fmt.Sprintf("Mark01-dynamic_descriptor_ref01_%d", setup.now)
		dynamicDescriptorRef01DataUp0Up[dynamicDescriptorRef01MarkdefUp0Name] = dynamicDescriptorRef01MarkdefUp0Value

		dynamicDescriptorRef01ResdataUp0Result, err := dynamicDescriptorRef01Ent.Update(dynamicDescriptorRef01DataUp0Up, nil)
		if err != nil {
			t.Fatalf("update failed: %v", err)
		}
		dynamicDescriptorRef01ResdataUp0 := core.ToMapAny(dynamicDescriptorRef01ResdataUp0Result)
		if dynamicDescriptorRef01ResdataUp0 == nil {
			t.Fatal("expected update result to be a map")
		}
		if dynamicDescriptorRef01ResdataUp0["id"] != dynamicDescriptorRef01DataUp0Up["id"] {
			t.Fatal("expected update result id to match")
		}
		if dynamicDescriptorRef01ResdataUp0[dynamicDescriptorRef01MarkdefUp0Name] != dynamicDescriptorRef01MarkdefUp0Value {
			t.Fatalf("expected %s to be updated, got %v", dynamicDescriptorRef01MarkdefUp0Name, dynamicDescriptorRef01ResdataUp0[dynamicDescriptorRef01MarkdefUp0Name])
		}

		// LOAD
		dynamicDescriptorRef01MatchDt0 := map[string]any{
			"id": dynamicDescriptorRef01Data["id"],
		}
		dynamicDescriptorRef01DataDt0Loaded, err := dynamicDescriptorRef01Ent.Load(dynamicDescriptorRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		dynamicDescriptorRef01DataDt0LoadResult := core.ToMapAny(dynamicDescriptorRef01DataDt0Loaded)
		if dynamicDescriptorRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if dynamicDescriptorRef01DataDt0LoadResult["id"] != dynamicDescriptorRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

		// REMOVE
		dynamicDescriptorRef01MatchRm0 := map[string]any{
			"id": dynamicDescriptorRef01Data["id"],
		}
		_, err = dynamicDescriptorRef01Ent.Remove(dynamicDescriptorRef01MatchRm0, nil)
		if err != nil {
			t.Fatalf("remove failed: %v", err)
		}

		// LIST
		dynamicDescriptorRef01MatchRt0 := map[string]any{
			"account_id": setup.idmap["account01"],
		}

		dynamicDescriptorRef01ListRt0Result, err := dynamicDescriptorRef01Ent.List(dynamicDescriptorRef01MatchRt0, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		dynamicDescriptorRef01ListRt0, dynamicDescriptorRef01ListRt0Ok := dynamicDescriptorRef01ListRt0Result.([]any)
		if !dynamicDescriptorRef01ListRt0Ok {
			t.Fatalf("expected list result to be an array, got %T", dynamicDescriptorRef01ListRt0Result)
		}

		notFoundItem := vs.Select(entityListToData(dynamicDescriptorRef01ListRt0), map[string]any{"id": dynamicDescriptorRef01Data["id"]})
		if !vs.IsEmpty(notFoundItem) {
			t.Fatal("expected removed entity to not be in list")
		}

	})
}

func dynamic_descriptorBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "dynamic_descriptor", "DynamicDescriptorTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read dynamic_descriptor test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse dynamic_descriptor test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"dynamic_descriptor01", "dynamic_descriptor02", "dynamic_descriptor03", "account01", "account02", "account03"},
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
	entidEnvRaw := os.Getenv("BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID": idmap,
		"BLUEFINPAYCONEX_TEST_LIVE":      "FALSE",
		"BLUEFINPAYCONEX_TEST_EXPLAIN":   "FALSE",
		"BLUEFINPAYCONEX_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINPAYCONEX_TEST_DYNAMIC_DESCRIPTOR_ENTID"])
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
