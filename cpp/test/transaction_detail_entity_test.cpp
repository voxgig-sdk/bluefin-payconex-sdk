// Generated basic-flow test for the transaction_detail entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct TransactionDetailSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static TransactionDetailSetup transaction_detail_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/transaction_detail/TransactionDetailTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinPayconexSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("transaction_detail01"), Value("transaction_detail02"), Value("transaction_detail03"), Value("account01"), Value("account02"), Value("account03"), Value("payment01"), Value("payment02"), Value("payment03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID", idmap},
    {"BLUEFINPAYCONEX_TEST_LIVE", Value("FALSE")},
    {"BLUEFINPAYCONEX_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINPAYCONEX_TEST_TRANSACTION_DETAIL_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  if (getp(idmap_resolved, "account_id").is_undef()) {
    setp(idmap_resolved, "account_id", getp(idmap_resolved, "account01"));
  }

  bool live = getp(env, "BLUEFINPAYCONEX_TEST_LIVE") == Value("TRUE");

  TransactionDetailSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void transaction_detail_entity_instance() {
  auto testsdk = BluefinPayconexSDK::testSDK();
  auto ent = testsdk->transaction_detail();
  ASSERT_EQ(ent->getName(), std::string("transaction_detail"), "entity name");
}

static void transaction_detail_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"transaction_detail", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinPayconexSDK::testSDK(seed, sdkopts);
  auto se = strsdk->transaction_detail();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinPayconexSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->transaction_detail();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void transaction_detail_entity_basic() {
  auto setup = transaction_detail_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"update", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("transaction_detail.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value transaction_detail_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "transaction_detail"}));
  Value transaction_detail_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(transaction_detail_ref01_data_raw);
    transaction_detail_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!transaction_detail_ref01_data.is_map()) transaction_detail_ref01_data = vmap();
  }
  // UPDATE
  auto transaction_detail_ref01_ent = client->transaction_detail();
  Value transaction_detail_ref01_data_up0_up = vmap();
  setp(transaction_detail_ref01_data_up0_up, "id", getp(transaction_detail_ref01_data, "id"));
  setp(transaction_detail_ref01_data_up0_up, "account_id", getp(setup.idmap, "account_id"));
  std::string transaction_detail_ref01_data_up0_markval = std::string("Mark01-transaction_detail_ref01_") + std::to_string(setup.now);
  setp(transaction_detail_ref01_data_up0_up, "description", Value(transaction_detail_ref01_data_up0_markval));
  Value transaction_detail_ref01_resdata_up0_result = transaction_detail_ref01_ent->update(Struct::clone(transaction_detail_ref01_data_up0_up), Value::undef());
  Value transaction_detail_ref01_resdata_up0 = Helpers::toMapAny(transaction_detail_ref01_resdata_up0_result);
  if (!transaction_detail_ref01_resdata_up0.is_map()) transaction_detail_ref01_resdata_up0 = vmap();
  ASSERT_TRUE(transaction_detail_ref01_resdata_up0.is_map(), "expected update result to be a map");
  ASSERT_EQ_VAL(getp(transaction_detail_ref01_resdata_up0, "id"), getp(transaction_detail_ref01_data_up0_up, "id"), "expected update result id to match");
  ASSERT_EQ_VAL(getp(transaction_detail_ref01_resdata_up0, "description"), Value(transaction_detail_ref01_data_up0_markval), "expected description to be updated");

  // LOAD
  Value transaction_detail_ref01_match_dt0 = vmap({{"id", getp(transaction_detail_ref01_data, "id")}});
  Value transaction_detail_ref01_data_dt0_loaded = transaction_detail_ref01_ent->load(Struct::clone(transaction_detail_ref01_match_dt0), Value::undef());
  Value transaction_detail_ref01_data_dt0_load_result = Helpers::toMapAny(transaction_detail_ref01_data_dt0_loaded);
  ASSERT_TRUE(transaction_detail_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(transaction_detail_ref01_data_dt0_load_result, "id"), getp(transaction_detail_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(transaction_detail_entity_instance);
  T_RUN(transaction_detail_entity_stream);
  T_RUN(transaction_detail_entity_basic);
  return sdktest::summary("transaction_detail_entity_test");
}
