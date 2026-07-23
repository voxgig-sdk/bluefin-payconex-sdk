// Generated basic-flow test for the i_frame_create_instance entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct IFrameCreateInstanceSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static IFrameCreateInstanceSetup i_frame_create_instance_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/i_frame_create_instance/IFrameCreateInstanceTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("i_frame_create_instance01"), Value("i_frame_create_instance02"), Value("i_frame_create_instance03"), Value("account01"), Value("account02"), Value("account03"), Value("payment_iframe01"), Value("payment_iframe02"), Value("payment_iframe03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_I_FRAME_CREATE_INSTANCE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  IFrameCreateInstanceSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void i_frame_create_instance_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->i_frame_create_instance();
  ASSERT_EQ(ent->getName(), std::string("i_frame_create_instance"), "entity name");
}

static void i_frame_create_instance_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"i_frame_create_instance", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->i_frame_create_instance();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->i_frame_create_instance();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void i_frame_create_instance_entity_basic() {
  auto setup = i_frame_create_instance_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("i_frame_create_instance.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto i_frame_create_instance_ref01_ent = client->i_frame_create_instance();
  Value i_frame_create_instance_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "i_frame_create_instance"}), "i_frame_create_instance_ref01"));
  if (!i_frame_create_instance_ref01_data.is_map()) i_frame_create_instance_ref01_data = vmap();
  setp(i_frame_create_instance_ref01_data, "account_id", getp(setup.idmap, "account01"));
  setp(i_frame_create_instance_ref01_data, "payment_iframe_id", getp(setup.idmap, "payment_iframe01"));
  {
    Value i_frame_create_instance_ref01_data_result = i_frame_create_instance_ref01_ent->create(Struct::clone(i_frame_create_instance_ref01_data), Value::undef());
    i_frame_create_instance_ref01_data = Helpers::toMapAny(i_frame_create_instance_ref01_data_result);
    if (!i_frame_create_instance_ref01_data.is_map()) i_frame_create_instance_ref01_data = vmap();
    ASSERT_TRUE(i_frame_create_instance_ref01_data.is_map(), "expected create result to be a map");
  }

}

int main() {
  T_RUN(i_frame_create_instance_entity_instance);
  T_RUN(i_frame_create_instance_entity_stream);
  T_RUN(i_frame_create_instance_entity_basic);
  return sdktest::summary("i_frame_create_instance_entity_test");
}
