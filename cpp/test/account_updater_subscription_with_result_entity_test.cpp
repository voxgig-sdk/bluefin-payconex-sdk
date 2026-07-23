// Generated basic-flow test for the account_updater_subscription_with_result entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct AccountUpdaterSubscriptionWithResultSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static AccountUpdaterSubscriptionWithResultSetup account_updater_subscription_with_result_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/account_updater_subscription_with_result/AccountUpdaterSubscriptionWithResultTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("account_updater_subscription_with_result01"), Value("account_updater_subscription_with_result02"), Value("account_updater_subscription_with_result03"), Value("account01"), Value("account02"), Value("account03"), Value("subscription01"), Value("subscription02"), Value("subscription03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_ACCOUNT_UPDATER_SUBSCRIPTION_WITH_RESULT_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  if (getp(idmap_resolved, "account_id").is_undef()) {
    setp(idmap_resolved, "account_id", getp(idmap_resolved, "account01"));
  }

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  AccountUpdaterSubscriptionWithResultSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void account_updater_subscription_with_result_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->account_updater_subscription_with_result();
  ASSERT_EQ(ent->getName(), std::string("account_updater_subscription_with_result"), "entity name");
}

static void account_updater_subscription_with_result_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"account_updater_subscription_with_result", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->account_updater_subscription_with_result();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->account_updater_subscription_with_result();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void account_updater_subscription_with_result_entity_basic() {
  auto setup = account_updater_subscription_with_result_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "update", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("account_updater_subscription_with_result.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto account_updater_subscription_with_result_ref01_ent = client->account_updater_subscription_with_result();
  Value account_updater_subscription_with_result_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "account_updater_subscription_with_result"}), "account_updater_subscription_with_result_ref01"));
  if (!account_updater_subscription_with_result_ref01_data.is_map()) account_updater_subscription_with_result_ref01_data = vmap();
  setp(account_updater_subscription_with_result_ref01_data, "account_id", getp(setup.idmap, "account01"));
  setp(account_updater_subscription_with_result_ref01_data, "subscription_id", getp(setup.idmap, "subscription01"));
  {
    Value account_updater_subscription_with_result_ref01_data_result = account_updater_subscription_with_result_ref01_ent->create(Struct::clone(account_updater_subscription_with_result_ref01_data), Value::undef());
    account_updater_subscription_with_result_ref01_data = Helpers::toMapAny(account_updater_subscription_with_result_ref01_data_result);
    if (!account_updater_subscription_with_result_ref01_data.is_map()) account_updater_subscription_with_result_ref01_data = vmap();
    ASSERT_TRUE(account_updater_subscription_with_result_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(account_updater_subscription_with_result_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // UPDATE
  Value account_updater_subscription_with_result_ref01_data_up0_up = vmap();
  setp(account_updater_subscription_with_result_ref01_data_up0_up, "id", getp(account_updater_subscription_with_result_ref01_data, "id"));
  setp(account_updater_subscription_with_result_ref01_data_up0_up, "account_id", getp(setup.idmap, "account_id"));
  std::string account_updater_subscription_with_result_ref01_data_up0_markval = std::string("Mark01-account_updater_subscription_with_result_ref01_") + std::to_string(setup.now);
  setp(account_updater_subscription_with_result_ref01_data_up0_up, "created_at", Value(account_updater_subscription_with_result_ref01_data_up0_markval));
  Value account_updater_subscription_with_result_ref01_resdata_up0_result = account_updater_subscription_with_result_ref01_ent->update(Struct::clone(account_updater_subscription_with_result_ref01_data_up0_up), Value::undef());
  Value account_updater_subscription_with_result_ref01_resdata_up0 = Helpers::toMapAny(account_updater_subscription_with_result_ref01_resdata_up0_result);
  if (!account_updater_subscription_with_result_ref01_resdata_up0.is_map()) account_updater_subscription_with_result_ref01_resdata_up0 = vmap();
  ASSERT_TRUE(account_updater_subscription_with_result_ref01_resdata_up0.is_map(), "expected update result to be a map");
  ASSERT_EQ_VAL(getp(account_updater_subscription_with_result_ref01_resdata_up0, "id"), getp(account_updater_subscription_with_result_ref01_data_up0_up, "id"), "expected update result id to match");
  ASSERT_EQ_VAL(getp(account_updater_subscription_with_result_ref01_resdata_up0, "created_at"), Value(account_updater_subscription_with_result_ref01_data_up0_markval), "expected created_at to be updated");

  // LOAD
  Value account_updater_subscription_with_result_ref01_match_dt0 = vmap({{"id", getp(account_updater_subscription_with_result_ref01_data, "id")}});
  Value account_updater_subscription_with_result_ref01_data_dt0_loaded = account_updater_subscription_with_result_ref01_ent->load(Struct::clone(account_updater_subscription_with_result_ref01_match_dt0), Value::undef());
  Value account_updater_subscription_with_result_ref01_data_dt0_load_result = Helpers::toMapAny(account_updater_subscription_with_result_ref01_data_dt0_loaded);
  ASSERT_TRUE(account_updater_subscription_with_result_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(account_updater_subscription_with_result_ref01_data_dt0_load_result, "id"), getp(account_updater_subscription_with_result_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(account_updater_subscription_with_result_entity_instance);
  T_RUN(account_updater_subscription_with_result_entity_stream);
  T_RUN(account_updater_subscription_with_result_entity_basic);
  return sdktest::summary("account_updater_subscription_with_result_entity_test");
}
