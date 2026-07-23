// Generated basic-flow test for the apple_pay_merchant_detail entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct ApplePayMerchantDetailSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static ApplePayMerchantDetailSetup apple_pay_merchant_detail_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/apple_pay_merchant_detail/ApplePayMerchantDetailTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("apple_pay_merchant_detail01"), Value("apple_pay_merchant_detail02"), Value("apple_pay_merchant_detail03"), Value("account01"), Value("account02"), Value("account03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_APPLE_PAY_MERCHANT_DETAIL_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  ApplePayMerchantDetailSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void apple_pay_merchant_detail_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->apple_pay_merchant_detail();
  ASSERT_EQ(ent->getName(), std::string("apple_pay_merchant_detail"), "entity name");
}

static void apple_pay_merchant_detail_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"apple_pay_merchant_detail", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->apple_pay_merchant_detail();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->apple_pay_merchant_detail();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void apple_pay_merchant_detail_entity_basic() {
  auto setup = apple_pay_merchant_detail_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list"}) {
    auto sk = is_control_skipped("entityOp", std::string("apple_pay_merchant_detail.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto apple_pay_merchant_detail_ref01_ent = client->apple_pay_merchant_detail();
  Value apple_pay_merchant_detail_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "apple_pay_merchant_detail"}), "apple_pay_merchant_detail_ref01"));
  if (!apple_pay_merchant_detail_ref01_data.is_map()) apple_pay_merchant_detail_ref01_data = vmap();
  setp(apple_pay_merchant_detail_ref01_data, "account_id", getp(setup.idmap, "account01"));
  {
    Value apple_pay_merchant_detail_ref01_data_result = apple_pay_merchant_detail_ref01_ent->create(Struct::clone(apple_pay_merchant_detail_ref01_data), Value::undef());
    apple_pay_merchant_detail_ref01_data = Helpers::toMapAny(apple_pay_merchant_detail_ref01_data_result);
    if (!apple_pay_merchant_detail_ref01_data.is_map()) apple_pay_merchant_detail_ref01_data = vmap();
    ASSERT_TRUE(apple_pay_merchant_detail_ref01_data.is_map(), "expected create result to be a map");
  }

  // LIST
  Value apple_pay_merchant_detail_ref01_match = vmap();
  setp(apple_pay_merchant_detail_ref01_match, "account_id", getp(setup.idmap, "account01"));
  Value apple_pay_merchant_detail_ref01_list = apple_pay_merchant_detail_ref01_ent->list(Struct::clone(apple_pay_merchant_detail_ref01_match), Value::undef());
  ASSERT_TRUE(apple_pay_merchant_detail_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(apple_pay_merchant_detail_ref01_list), vmap({{"id", getp(apple_pay_merchant_detail_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

}

int main() {
  T_RUN(apple_pay_merchant_detail_entity_instance);
  T_RUN(apple_pay_merchant_detail_entity_stream);
  T_RUN(apple_pay_merchant_detail_entity_basic);
  return sdktest::summary("apple_pay_merchant_detail_entity_test");
}
