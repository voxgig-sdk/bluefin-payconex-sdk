// Generated basic-flow test for the webhook entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct WebhookSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static WebhookSetup webhook_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/webhook/WebhookTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("webhook01"), Value("webhook02"), Value("webhook03"), Value("account01"), Value("account02"), Value("account03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_WEBHOOK_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  if (getp(idmap_resolved, "account_id").is_undef()) {
    setp(idmap_resolved, "account_id", getp(idmap_resolved, "account01"));
  }

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  WebhookSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void webhook_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->webhook();
  ASSERT_EQ(ent->getName(), std::string("webhook"), "entity name");
}

static void webhook_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"webhook", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->webhook();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->webhook();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void webhook_entity_basic() {
  auto setup = webhook_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "update", "load", "remove"}) {
    auto sk = is_control_skipped("entityOp", std::string("webhook.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto webhook_ref01_ent = client->webhook();
  Value webhook_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "webhook"}), "webhook_ref01"));
  if (!webhook_ref01_data.is_map()) webhook_ref01_data = vmap();
  setp(webhook_ref01_data, "account_id", getp(setup.idmap, "account01"));
  {
    Value webhook_ref01_data_result = webhook_ref01_ent->create(Struct::clone(webhook_ref01_data), Value::undef());
    webhook_ref01_data = Helpers::toMapAny(webhook_ref01_data_result);
    if (!webhook_ref01_data.is_map()) webhook_ref01_data = vmap();
    ASSERT_TRUE(webhook_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(webhook_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value webhook_ref01_match = vmap();
  setp(webhook_ref01_match, "account_id", getp(setup.idmap, "account01"));
  Value webhook_ref01_list = webhook_ref01_ent->list(Struct::clone(webhook_ref01_match), Value::undef());
  ASSERT_TRUE(webhook_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(webhook_ref01_list), vmap({{"id", getp(webhook_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // UPDATE
  Value webhook_ref01_data_up0_up = vmap();
  setp(webhook_ref01_data_up0_up, "id", getp(webhook_ref01_data, "id"));
  setp(webhook_ref01_data_up0_up, "account_id", getp(setup.idmap, "account_id"));
  std::string webhook_ref01_data_up0_markval = std::string("Mark01-webhook_ref01_") + std::to_string(setup.now);
  setp(webhook_ref01_data_up0_up, "event", Value(webhook_ref01_data_up0_markval));
  Value webhook_ref01_resdata_up0_result = webhook_ref01_ent->update(Struct::clone(webhook_ref01_data_up0_up), Value::undef());
  Value webhook_ref01_resdata_up0 = Helpers::toMapAny(webhook_ref01_resdata_up0_result);
  if (!webhook_ref01_resdata_up0.is_map()) webhook_ref01_resdata_up0 = vmap();
  ASSERT_TRUE(webhook_ref01_resdata_up0.is_map(), "expected update result to be a map");
  ASSERT_EQ_VAL(getp(webhook_ref01_resdata_up0, "id"), getp(webhook_ref01_data_up0_up, "id"), "expected update result id to match");
  ASSERT_EQ_VAL(getp(webhook_ref01_resdata_up0, "event"), Value(webhook_ref01_data_up0_markval), "expected event to be updated");

  // LOAD
  Value webhook_ref01_match_dt0 = vmap({{"id", getp(webhook_ref01_data, "id")}});
  Value webhook_ref01_data_dt0_loaded = webhook_ref01_ent->load(Struct::clone(webhook_ref01_match_dt0), Value::undef());
  Value webhook_ref01_data_dt0_load_result = Helpers::toMapAny(webhook_ref01_data_dt0_loaded);
  ASSERT_TRUE(webhook_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(webhook_ref01_data_dt0_load_result, "id"), getp(webhook_ref01_data, "id"), "expected load result id to match");

  // REMOVE
  {
    Value webhook_ref01_match_rm0 = vmap({{"id", getp(webhook_ref01_data, "id")}});
    webhook_ref01_ent->remove(Struct::clone(webhook_ref01_match_rm0), Value::undef());
  }

  // LIST
  Value webhook_ref01_match_rt0 = vmap();
  setp(webhook_ref01_match_rt0, "account_id", getp(setup.idmap, "account01"));
  Value webhook_ref01_list_rt0 = webhook_ref01_ent->list(Struct::clone(webhook_ref01_match_rt0), Value::undef());
  ASSERT_TRUE(webhook_ref01_list_rt0.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(webhook_ref01_list_rt0), vmap({{"id", getp(webhook_ref01_data, "id")}}));
    ASSERT_TRUE(found.empty(), "expected removed entity to not be in list");
  }

}

int main() {
  T_RUN(webhook_entity_instance);
  T_RUN(webhook_entity_stream);
  T_RUN(webhook_entity_basic);
  return sdktest::summary("webhook_entity_test");
}
