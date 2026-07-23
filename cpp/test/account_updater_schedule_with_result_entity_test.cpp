// Generated basic-flow test for the account_updater_schedule_with_result entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct AccountUpdaterScheduleWithResultSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static AccountUpdaterScheduleWithResultSetup account_updater_schedule_with_result_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/account_updater_schedule_with_result/AccountUpdaterScheduleWithResultTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("account_updater_schedule_with_result01"), Value("account_updater_schedule_with_result02"), Value("account_updater_schedule_with_result03"), Value("account01"), Value("account02"), Value("account03"), Value("schedule01"), Value("schedule02"), Value("schedule03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_WITH_RESULT_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  AccountUpdaterScheduleWithResultSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void account_updater_schedule_with_result_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->account_updater_schedule_with_result();
  ASSERT_EQ(ent->getName(), std::string("account_updater_schedule_with_result"), "entity name");
}

static void account_updater_schedule_with_result_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"account_updater_schedule_with_result", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->account_updater_schedule_with_result();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->account_updater_schedule_with_result();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void account_updater_schedule_with_result_entity_basic() {
  auto setup = account_updater_schedule_with_result_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list"}) {
    auto sk = is_control_skipped("entityOp", std::string("account_updater_schedule_with_result.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto account_updater_schedule_with_result_ref01_ent = client->account_updater_schedule_with_result();
  Value account_updater_schedule_with_result_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "account_updater_schedule_with_result"}), "account_updater_schedule_with_result_ref01"));
  if (!account_updater_schedule_with_result_ref01_data.is_map()) account_updater_schedule_with_result_ref01_data = vmap();
  setp(account_updater_schedule_with_result_ref01_data, "account_id", getp(setup.idmap, "account01"));
  setp(account_updater_schedule_with_result_ref01_data, "schedule_id", getp(setup.idmap, "schedule01"));
  {
    Value account_updater_schedule_with_result_ref01_data_result = account_updater_schedule_with_result_ref01_ent->create(Struct::clone(account_updater_schedule_with_result_ref01_data), Value::undef());
    account_updater_schedule_with_result_ref01_data = Helpers::toMapAny(account_updater_schedule_with_result_ref01_data_result);
    if (!account_updater_schedule_with_result_ref01_data.is_map()) account_updater_schedule_with_result_ref01_data = vmap();
    ASSERT_TRUE(account_updater_schedule_with_result_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(account_updater_schedule_with_result_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value account_updater_schedule_with_result_ref01_match = vmap();
  setp(account_updater_schedule_with_result_ref01_match, "account_id", getp(setup.idmap, "account01"));
  setp(account_updater_schedule_with_result_ref01_match, "schedule_id", getp(setup.idmap, "schedule01"));
  Value account_updater_schedule_with_result_ref01_list = account_updater_schedule_with_result_ref01_ent->list(Struct::clone(account_updater_schedule_with_result_ref01_match), Value::undef());
  ASSERT_TRUE(account_updater_schedule_with_result_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(account_updater_schedule_with_result_ref01_list), vmap({{"id", getp(account_updater_schedule_with_result_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

}

int main() {
  T_RUN(account_updater_schedule_with_result_entity_instance);
  T_RUN(account_updater_schedule_with_result_entity_stream);
  T_RUN(account_updater_schedule_with_result_entity_basic);
  return sdktest::summary("account_updater_schedule_with_result_entity_test");
}
