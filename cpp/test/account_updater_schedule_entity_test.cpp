// Generated basic-flow test for the account_updater_schedule entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct AccountUpdaterScheduleSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static AccountUpdaterScheduleSetup account_updater_schedule_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/account_updater_schedule/AccountUpdaterScheduleTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("account_updater_schedule01"), Value("account_updater_schedule02"), Value("account_updater_schedule03"), Value("account01"), Value("account02"), Value("account03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SCHEDULE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  AccountUpdaterScheduleSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void account_updater_schedule_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->account_updater_schedule();
  ASSERT_EQ(ent->getName(), std::string("account_updater_schedule"), "entity name");
}

static void account_updater_schedule_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"account_updater_schedule", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->account_updater_schedule();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->account_updater_schedule();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void account_updater_schedule_entity_basic() {
  auto setup = account_updater_schedule_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("account_updater_schedule.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto account_updater_schedule_ref01_ent = client->account_updater_schedule();
  Value account_updater_schedule_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "account_updater_schedule"}), "account_updater_schedule_ref01"));
  if (!account_updater_schedule_ref01_data.is_map()) account_updater_schedule_ref01_data = vmap();
  setp(account_updater_schedule_ref01_data, "account_id", getp(setup.idmap, "account01"));
  {
    Value account_updater_schedule_ref01_data_result = account_updater_schedule_ref01_ent->create(Struct::clone(account_updater_schedule_ref01_data), Value::undef());
    account_updater_schedule_ref01_data = Helpers::toMapAny(account_updater_schedule_ref01_data_result);
    if (!account_updater_schedule_ref01_data.is_map()) account_updater_schedule_ref01_data = vmap();
    ASSERT_TRUE(account_updater_schedule_ref01_data.is_map(), "expected create result to be a map");
  }

}

int main() {
  T_RUN(account_updater_schedule_entity_instance);
  T_RUN(account_updater_schedule_entity_stream);
  T_RUN(account_updater_schedule_entity_basic);
  return sdktest::summary("account_updater_schedule_entity_test");
}
