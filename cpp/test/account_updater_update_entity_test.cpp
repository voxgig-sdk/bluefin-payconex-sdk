// Generated basic-flow test for the account_updater_update entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct AccountUpdaterUpdateSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static AccountUpdaterUpdateSetup account_updater_update_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/account_updater_update/AccountUpdaterUpdateTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("account_updater_update01"), Value("account_updater_update02"), Value("account_updater_update03"), Value("account01"), Value("account02"), Value("account03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_UPDATE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  AccountUpdaterUpdateSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void account_updater_update_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->account_updater_update();
  ASSERT_EQ(ent->getName(), std::string("account_updater_update"), "entity name");
}

static void account_updater_update_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"account_updater_update", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->account_updater_update();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->account_updater_update();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void account_updater_update_entity_basic() {
  auto setup = account_updater_update_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"load"}) {
    auto sk = is_control_skipped("entityOp", std::string("account_updater_update.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value account_updater_update_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "account_updater_update"}));
  Value account_updater_update_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(account_updater_update_ref01_data_raw);
    account_updater_update_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!account_updater_update_ref01_data.is_map()) account_updater_update_ref01_data = vmap();
  }
  // LOAD
  auto account_updater_update_ref01_ent = client->account_updater_update();
  Value account_updater_update_ref01_match_dt0 = vmap({{"id", getp(account_updater_update_ref01_data, "id")}});
  Value account_updater_update_ref01_data_dt0_loaded = account_updater_update_ref01_ent->load(Struct::clone(account_updater_update_ref01_match_dt0), Value::undef());
  Value account_updater_update_ref01_data_dt0_load_result = Helpers::toMapAny(account_updater_update_ref01_data_dt0_loaded);
  ASSERT_TRUE(account_updater_update_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(account_updater_update_ref01_data_dt0_load_result, "id"), getp(account_updater_update_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(account_updater_update_entity_instance);
  T_RUN(account_updater_update_entity_stream);
  T_RUN(account_updater_update_entity_basic);
  return sdktest::summary("account_updater_update_entity_test");
}
