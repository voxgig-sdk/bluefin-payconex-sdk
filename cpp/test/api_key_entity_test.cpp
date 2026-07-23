// Generated basic-flow test for the api_key entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct ApiKeySetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static ApiKeySetup api_key_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/api_key/ApiKeyTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("api_key01"), Value("api_key02"), Value("api_key03"), Value("account01"), Value("account02"), Value("account03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_API_KEY_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_API_KEY_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  if (getp(idmap_resolved, "account_id").is_undef()) {
    setp(idmap_resolved, "account_id", getp(idmap_resolved, "account01"));
  }

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  ApiKeySetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void api_key_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->api_key();
  ASSERT_EQ(ent->getName(), std::string("api_key"), "entity name");
}

static void api_key_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"api_key", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->api_key();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->api_key();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void api_key_entity_basic() {
  auto setup = api_key_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "update", "load", "remove"}) {
    auto sk = is_control_skipped("entityOp", std::string("api_key.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto api_key_ref01_ent = client->api_key();
  Value api_key_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "api_key"}), "api_key_ref01"));
  if (!api_key_ref01_data.is_map()) api_key_ref01_data = vmap();
  setp(api_key_ref01_data, "account_id", getp(setup.idmap, "account01"));
  {
    Value api_key_ref01_data_result = api_key_ref01_ent->create(Struct::clone(api_key_ref01_data), Value::undef());
    api_key_ref01_data = Helpers::toMapAny(api_key_ref01_data_result);
    if (!api_key_ref01_data.is_map()) api_key_ref01_data = vmap();
    ASSERT_TRUE(api_key_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(api_key_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value api_key_ref01_match = vmap();
  setp(api_key_ref01_match, "account_id", getp(setup.idmap, "account01"));
  Value api_key_ref01_list = api_key_ref01_ent->list(Struct::clone(api_key_ref01_match), Value::undef());
  ASSERT_TRUE(api_key_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(api_key_ref01_list), vmap({{"id", getp(api_key_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // UPDATE
  Value api_key_ref01_data_up0_up = vmap();
  setp(api_key_ref01_data_up0_up, "id", getp(api_key_ref01_data, "id"));
  setp(api_key_ref01_data_up0_up, "account_id", getp(setup.idmap, "account_id"));
  std::string api_key_ref01_data_up0_markval = std::string("Mark01-api_key_ref01_") + std::to_string(setup.now);
  setp(api_key_ref01_data_up0_up, "expires_at", Value(api_key_ref01_data_up0_markval));
  Value api_key_ref01_resdata_up0_result = api_key_ref01_ent->update(Struct::clone(api_key_ref01_data_up0_up), Value::undef());
  Value api_key_ref01_resdata_up0 = Helpers::toMapAny(api_key_ref01_resdata_up0_result);
  if (!api_key_ref01_resdata_up0.is_map()) api_key_ref01_resdata_up0 = vmap();
  ASSERT_TRUE(api_key_ref01_resdata_up0.is_map(), "expected update result to be a map");
  ASSERT_EQ_VAL(getp(api_key_ref01_resdata_up0, "id"), getp(api_key_ref01_data_up0_up, "id"), "expected update result id to match");
  ASSERT_EQ_VAL(getp(api_key_ref01_resdata_up0, "expires_at"), Value(api_key_ref01_data_up0_markval), "expected expires_at to be updated");

  // LOAD
  Value api_key_ref01_match_dt0 = vmap({{"id", getp(api_key_ref01_data, "id")}});
  Value api_key_ref01_data_dt0_loaded = api_key_ref01_ent->load(Struct::clone(api_key_ref01_match_dt0), Value::undef());
  Value api_key_ref01_data_dt0_load_result = Helpers::toMapAny(api_key_ref01_data_dt0_loaded);
  ASSERT_TRUE(api_key_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(api_key_ref01_data_dt0_load_result, "id"), getp(api_key_ref01_data, "id"), "expected load result id to match");

  // REMOVE
  {
    Value api_key_ref01_match_rm0 = vmap({{"id", getp(api_key_ref01_data, "id")}});
    api_key_ref01_ent->remove(Struct::clone(api_key_ref01_match_rm0), Value::undef());
  }

  // LIST
  Value api_key_ref01_match_rt0 = vmap();
  setp(api_key_ref01_match_rt0, "account_id", getp(setup.idmap, "account01"));
  Value api_key_ref01_list_rt0 = api_key_ref01_ent->list(Struct::clone(api_key_ref01_match_rt0), Value::undef());
  ASSERT_TRUE(api_key_ref01_list_rt0.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(api_key_ref01_list_rt0), vmap({{"id", getp(api_key_ref01_data, "id")}}));
    ASSERT_TRUE(found.empty(), "expected removed entity to not be in list");
  }

}

int main() {
  T_RUN(api_key_entity_instance);
  T_RUN(api_key_entity_stream);
  T_RUN(api_key_entity_basic);
  return sdktest::summary("api_key_entity_test");
}
