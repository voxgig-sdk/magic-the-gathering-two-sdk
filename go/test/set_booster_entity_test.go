package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/magic-the-gathering-two-sdk/go"
	"github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/core"

	vs "github.com/voxgig-sdk/magic-the-gathering-two-sdk/go/utility/struct"
)

func TestSetBoosterEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.SetBooster(nil)
		if ent == nil {
			t.Fatal("expected non-nil SetBoosterEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := set_boosterBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"list"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "set_booster." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set MAGICTHEGATHERINGTWO_TEST_SET_BOOSTER_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		setBoosterRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.set_booster", setup.data)))
		var setBoosterRef01Data map[string]any
		if len(setBoosterRef01DataRaw) > 0 {
			setBoosterRef01Data = core.ToMapAny(setBoosterRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = setBoosterRef01Data

		// LIST
		setBoosterRef01Ent := client.SetBooster(nil)
		setBoosterRef01Match := map[string]any{}

		setBoosterRef01ListResult, err := setBoosterRef01Ent.List(setBoosterRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		_, setBoosterRef01ListOk := setBoosterRef01ListResult.([]any)
		if !setBoosterRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", setBoosterRef01ListResult)
		}

	})
}

func set_boosterBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "set_booster", "SetBoosterTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read set_booster test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse set_booster test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"set_booster01", "set_booster02", "set_booster03"},
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
	entidEnvRaw := os.Getenv("MAGICTHEGATHERINGTWO_TEST_SET_BOOSTER_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"MAGICTHEGATHERINGTWO_TEST_SET_BOOSTER_ENTID": idmap,
		"MAGICTHEGATHERINGTWO_TEST_LIVE":      "FALSE",
		"MAGICTHEGATHERINGTWO_TEST_EXPLAIN":   "FALSE",
		"MAGICTHEGATHERINGTWO_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["MAGICTHEGATHERINGTWO_TEST_SET_BOOSTER_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["MAGICTHEGATHERINGTWO_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["MAGICTHEGATHERINGTWO_APIKEY"],
			},
			extra,
		})
		client = sdk.NewMagicTheGatheringTwoSDK(core.ToMapAny(mergedOpts))
	}

	live := env["MAGICTHEGATHERINGTWO_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["MAGICTHEGATHERINGTWO_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
