// Generated basic-flow test for the three_d_secure_status entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct ThreeDSecureStatusSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static ThreeDSecureStatusSetup three_d_secure_status_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/three_d_secure_status/ThreeDSecureStatusTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("three_d_secure_status01"), Value("three_d_secure_status02"), Value("three_d_secure_status03"), Value("account01"), Value("account02"), Value("account03"), Value("3_d01"), Value("3_d02"), Value("3_d03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_THREE_D_SECURE_STATUS_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_THREE_D_SECURE_STATUS_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  ThreeDSecureStatusSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void three_d_secure_status_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->three_d_secure_status();
  ASSERT_EQ(ent->getName(), std::string("three_d_secure_status"), "entity name");
}

static void three_d_secure_status_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"three_d_secure_status", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->three_d_secure_status();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->three_d_secure_status();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void three_d_secure_status_entity_basic() {
  auto setup = three_d_secure_status_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"load"}) {
    auto sk = is_control_skipped("entityOp", std::string("three_d_secure_status.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value three_d_secure_status_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "three_d_secure_status"}));
  Value three_d_secure_status_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(three_d_secure_status_ref01_data_raw);
    three_d_secure_status_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!three_d_secure_status_ref01_data.is_map()) three_d_secure_status_ref01_data = vmap();
  }
  // LOAD
  auto three_d_secure_status_ref01_ent = client->three_d_secure_status();
  Value three_d_secure_status_ref01_match_dt0 = vmap();
  Value three_d_secure_status_ref01_data_dt0_loaded = three_d_secure_status_ref01_ent->load(three_d_secure_status_ref01_match_dt0, Value::undef());
  ASSERT_TRUE(!three_d_secure_status_ref01_data_dt0_loaded.is_undef(), "expected load result to be non-nil");

}

int main() {
  T_RUN(three_d_secure_status_entity_instance);
  T_RUN(three_d_secure_status_entity_stream);
  T_RUN(three_d_secure_status_entity_basic);
  return sdktest::summary("three_d_secure_status_entity_test");
}
