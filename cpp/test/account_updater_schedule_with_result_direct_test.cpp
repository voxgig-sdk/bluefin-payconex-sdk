// Generated direct-call tests for the account_updater_schedule_with_result entity (unit mode;
// a mock system.fetch records calls). Mirrors the rust/go TestDirect.

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct AccountUpdaterScheduleWithResultDirectSetup {
  std::shared_ptr<BluefinPayconexSDK> client;
  Value calls;
  bool live = false;
};

static AccountUpdaterScheduleWithResultDirectSetup account_updater_schedule_with_result_direct_setup(const Value& mockres) {
  Value calls = vlist();
  Value cshared = calls;

  vs::Injector mock_fetch = [cshared, mockres](vs::Injection&, const Value& args, const std::string&, const Value&) -> Value {
    Value url = vs::getelem(args, Value(int64_t(0)));
    Value init = vs::getelem(args, Value(int64_t(1)));
    cshared.as_list()->push_back(vmap({{"url", url}, {"init", init}}));
    Value data = is_nullish(mockres) ? vmap({{"id", Value("direct01")}}) : mockres;
    Value out = vmap();
    map_put(out, "status", Value(200));
    map_put(out, "statusText", Value("OK"));
    map_put(out, "headers", vmap());
    map_put(out, "json", json_thunk(data));
    return out;
  };

  Value opts = vmap({
    {"base", Value("http://localhost:8080")},
    {"system", vmap({{"fetch", Value(mock_fetch)}})}
  });
  auto client = std::make_shared<BluefinPayconexSDK>(opts);

  AccountUpdaterScheduleWithResultDirectSetup s;
  s.client = client;
  s.calls = calls;
  s.live = false;
  return s;
}

static void account_updater_schedule_with_result_direct_list() {
  auto setup = account_updater_schedule_with_result_direct_setup(vlist({
    vmap({{"id", Value("direct01")}}),
    vmap({{"id", Value("direct02")}})
  }));
  auto sk = is_control_skipped("direct", "direct-list-account_updater_schedule_with_result", "unit");
  if (sk.first) { std::cerr << "skip\n"; return; }
  auto client = setup.client;

  Value params = vmap();
  setp(params, "account_id", Value("direct01"));
  setp(params, "schedule_id", Value("direct02"));

  Value result = client->direct(vmap({
    {"path", Value("api/v4/accounts/{account_id}/account-updater/schedules/{schedule_id}/results")},
    {"method", Value("GET")},
    {"params", params}
  }));

  ASSERT_EQ_VAL(getp(result, "ok"), Value(true), "expected ok true");
  ASSERT_EQ(Helpers::toInt(getp(result, "status")), 200, "expected status 200");
  Value data = getp(result, "data");
  ASSERT_TRUE(data.is_list(), "expected data to be an array");
  ASSERT_EQ((int)Struct::size(data), 2, "expected 2 items");
  ASSERT_EQ((int)setup.calls.as_list()->size(), 1, "expected 1 call");
  {
    Value call = (*setup.calls.as_list())[0];
    ASSERT_EQ_VAL(getp(getp(call, "init"), "method"), Value("GET"), "expected method GET");
    std::string url = as_str(getp(call, "url"));
    ASSERT_TRUE(url.find("direct01") != std::string::npos, "expected url to contain direct01");
    ASSERT_TRUE(url.find("direct02") != std::string::npos, "expected url to contain direct02");
  }
}

int main() {
  T_RUN(account_updater_schedule_with_result_direct_list);
  return sdktest::summary("account_updater_schedule_with_result_direct_test");
}
