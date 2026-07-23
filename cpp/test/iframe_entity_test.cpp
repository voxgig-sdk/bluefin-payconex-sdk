// Generated basic-flow test for the iframe entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct IframeSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static IframeSetup iframe_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/iframe/IframeTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("iframe01"), Value("iframe02"), Value("iframe03"), Value("account01"), Value("account02"), Value("account03"), Value("payment_iframe01"), Value("payment_iframe02"), Value("payment_iframe03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_IFRAME_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_IFRAME_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  if (getp(idmap_resolved, "account_id").is_undef()) {
    setp(idmap_resolved, "account_id", getp(idmap_resolved, "account01"));
  }

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  IframeSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void iframe_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->iframe();
  ASSERT_EQ(ent->getName(), std::string("iframe"), "entity name");
}

static void iframe_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"iframe", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->iframe();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->iframe();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void iframe_entity_basic() {
  auto setup = iframe_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "update", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("iframe.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto iframe_ref01_ent = client->iframe();
  Value iframe_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "iframe"}), "iframe_ref01"));
  if (!iframe_ref01_data.is_map()) iframe_ref01_data = vmap();
  setp(iframe_ref01_data, "account_id", getp(setup.idmap, "account01"));
  {
    Value iframe_ref01_data_result = iframe_ref01_ent->create(Struct::clone(iframe_ref01_data), Value::undef());
    iframe_ref01_data = Helpers::toMapAny(iframe_ref01_data_result);
    if (!iframe_ref01_data.is_map()) iframe_ref01_data = vmap();
    ASSERT_TRUE(iframe_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(iframe_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value iframe_ref01_match = vmap();
  setp(iframe_ref01_match, "account_id", getp(setup.idmap, "account01"));
  Value iframe_ref01_list = iframe_ref01_ent->list(Struct::clone(iframe_ref01_match), Value::undef());
  ASSERT_TRUE(iframe_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(iframe_ref01_list), vmap({{"id", getp(iframe_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // UPDATE
  Value iframe_ref01_data_up0_up = vmap();
  setp(iframe_ref01_data_up0_up, "id", getp(iframe_ref01_data, "id"));
  setp(iframe_ref01_data_up0_up, "account_id", getp(setup.idmap, "account_id"));
  std::string iframe_ref01_data_up0_markval = std::string("Mark01-iframe_ref01_") + std::to_string(setup.now);
  setp(iframe_ref01_data_up0_up, "currency", Value(iframe_ref01_data_up0_markval));
  Value iframe_ref01_resdata_up0_result = iframe_ref01_ent->update(Struct::clone(iframe_ref01_data_up0_up), Value::undef());
  Value iframe_ref01_resdata_up0 = Helpers::toMapAny(iframe_ref01_resdata_up0_result);
  if (!iframe_ref01_resdata_up0.is_map()) iframe_ref01_resdata_up0 = vmap();
  ASSERT_TRUE(iframe_ref01_resdata_up0.is_map(), "expected update result to be a map");
  ASSERT_EQ_VAL(getp(iframe_ref01_resdata_up0, "id"), getp(iframe_ref01_data_up0_up, "id"), "expected update result id to match");
  ASSERT_EQ_VAL(getp(iframe_ref01_resdata_up0, "currency"), Value(iframe_ref01_data_up0_markval), "expected currency to be updated");

  // LOAD
  Value iframe_ref01_match_dt0 = vmap({{"id", getp(iframe_ref01_data, "id")}});
  Value iframe_ref01_data_dt0_loaded = iframe_ref01_ent->load(Struct::clone(iframe_ref01_match_dt0), Value::undef());
  Value iframe_ref01_data_dt0_load_result = Helpers::toMapAny(iframe_ref01_data_dt0_loaded);
  ASSERT_TRUE(iframe_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(iframe_ref01_data_dt0_load_result, "id"), getp(iframe_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(iframe_entity_instance);
  T_RUN(iframe_entity_stream);
  T_RUN(iframe_entity_basic);
  return sdktest::summary("iframe_entity_test");
}
