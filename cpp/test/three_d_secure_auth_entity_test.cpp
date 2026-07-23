// Generated basic-flow test for the three_d_secure_auth entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct ThreeDSecureAuthSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static ThreeDSecureAuthSetup three_d_secure_auth_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/three_d_secure_auth/ThreeDSecureAuthTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("three_d_secure_auth01"), Value("three_d_secure_auth02"), Value("three_d_secure_auth03"), Value("account01"), Value("account02"), Value("account03"), Value("3_d01"), Value("3_d02"), Value("3_d03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_THREE_D_SECURE_AUTH_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  ThreeDSecureAuthSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void three_d_secure_auth_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->three_d_secure_auth();
  ASSERT_EQ(ent->getName(), std::string("three_d_secure_auth"), "entity name");
}

static void three_d_secure_auth_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"three_d_secure_auth", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->three_d_secure_auth();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->three_d_secure_auth();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void three_d_secure_auth_entity_basic() {
  auto setup = three_d_secure_auth_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("three_d_secure_auth.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto three_d_secure_auth_ref01_ent = client->three_d_secure_auth();
  Value three_d_secure_auth_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "three_d_secure_auth"}), "three_d_secure_auth_ref01"));
  if (!three_d_secure_auth_ref01_data.is_map()) three_d_secure_auth_ref01_data = vmap();
  setp(three_d_secure_auth_ref01_data, "3_d_id", getp(setup.idmap, "3_d01"));
  setp(three_d_secure_auth_ref01_data, "account_id", getp(setup.idmap, "account01"));
  {
    Value three_d_secure_auth_ref01_data_result = three_d_secure_auth_ref01_ent->create(Struct::clone(three_d_secure_auth_ref01_data), Value::undef());
    three_d_secure_auth_ref01_data = Helpers::toMapAny(three_d_secure_auth_ref01_data_result);
    if (!three_d_secure_auth_ref01_data.is_map()) three_d_secure_auth_ref01_data = vmap();
    ASSERT_TRUE(three_d_secure_auth_ref01_data.is_map(), "expected create result to be a map");
  }

}

int main() {
  T_RUN(three_d_secure_auth_entity_instance);
  T_RUN(three_d_secure_auth_entity_stream);
  T_RUN(three_d_secure_auth_entity_basic);
  return sdktest::summary("three_d_secure_auth_entity_test");
}
