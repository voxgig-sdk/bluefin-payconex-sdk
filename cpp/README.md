# BluefinPayconex C++ SDK



The C++ SDK for the BluefinPayconex API — a header-only,
entity-oriented client following idiomatic modern C++ (C++17) conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client->account_updater()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low. Every value flows through a single dynamic
`sdk::Value` type (a JSON-like variant), so there is no schema-driven code to
regenerate when the API changes.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
The C++ SDK is **header-only** — there is no package to install
from a registry. Vendor the `cpp/` directory into your project (or add the
repository as a git submodule) and put it on your compiler's include path.
Releases are cut as the git tag `cpp/vX.Y.Z` (see
[Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)).

```bash
# Add the SDK as a submodule (or copy the cpp/ directory into your tree).
git submodule add <repo-url> third_party/bluefinpayconex-sdk
```

Then include the umbrella header and compile with C++17:

```cpp
#include "core/sdk.hpp"
```

```bash
g++ -std=c++17 -Ithird_party/bluefinpayconex-sdk/cpp your_app.cpp -o your_app
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```cpp
#include <cstdlib>
#include "core/sdk.hpp"

using namespace sdk;

const char* apikey = std::getenv("BLUEFIN_PAYCONEX_APIKEY");
auto client = std::make_shared<BluefinPayconexSDK>(vmap({
    {"apikey", Value(apikey ? apikey : "")},
}));
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record and throws on error.

```cpp
try {
  Value account_updater_subscription_with_result = client->account_updater_subscription_with_result()->load(vmap({{"account_id", Value("example_account_id")}, {"subscription_id", Value("example_subscription_id")}}), Value::undef());
  std::cout << Struct::jsonify(account_updater_subscription_with_result) << std::endl;
} catch (const SdkErrorPtr& err) {
  std::cerr << "load failed: " << err->msg << std::endl;
}
```

### 4. Create, update, and remove

```cpp
// Remove
client->account_updater()->remove(vmap({{"account_id", Value("example_account_id")}, {"subscription_id", Value("example_subscription_id")}}), Value::undef());
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const threedsecurestatus = await client.ThreeDSecureStatus().load({ '3_d_id': "example", account_id: "example" })
  console.log(threedsecurestatus)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```cpp
Value result = client->direct(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("GET")},
    {"params", vmap({{"id", Value("example")}})},
}));

if (getp(result, "ok") == Value(true)) {
  std::cout << Helpers::toInt(getp(result, "status")) << std::endl;  // 200
  std::cout << Struct::jsonify(getp(result, "data")) << std::endl;   // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. Only one is present.
  std::cerr << Helpers::toInt(getp(result, "status")) << " "
            << Struct::jsonify(getp(result, "err")) << std::endl;
}
```

`direct()` is the escape hatch: it never throws — branch on
`getp(result, "ok")`.

### Prepare a request without sending it

```cpp
// prepare() returns the fetch definition and throws on error.
Value fetchdef = client->prepare(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("DELETE")},
    {"params", vmap({{"id", Value("example")}})},
}));

std::cout << Struct::stringify(getp(fetchdef, "url")) << std::endl;
std::cout << Struct::stringify(getp(fetchdef, "method")) << std::endl;
std::cout << Struct::jsonify(getp(fetchdef, "headers")) << std::endl;
```

### Use test mode

Create a mock client for unit testing — no server required. The test
feature installs an in-memory mock transport:

```cpp
auto client = BluefinPayconexSDK::testSDK();

// Entity ops return the bare record and throw on error.
Value three_d_secure_status = client->three_d_secure_status()->load(Value::undef(), Value::undef());
// three_d_secure_status contains the mock response record
std::cout << Struct::jsonify(three_d_secure_status) << std::endl;
```

You can seed the mock store by passing test options — see the generated
`test/` suite for worked examples.

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then build and run the test suite:

```bash
cd cpp && make test
```


## Reference

### BluefinPayconexSDK

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinPayconexSDK>(options);
```

Creates a new SDK client. `options` is an `sdk::Value` map.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `std::string` | API key for authentication. |
| `base` | `std::string` | Base URL of the API server. |
| `prefix` | `std::string` | URL path prefix prepended to all requests. |
| `suffix` | `std::string` | URL path suffix appended to all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides. |

### testSDK

```cpp
auto client = BluefinPayconexSDK::testSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::undef()`; a no-arg `BluefinPayconexSDK::testSDK()` overload is
also provided.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Value` | Deep copy of current SDK options. |
| `getUtility` | `() -> UtilityPtr` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Value` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> Value` | Build and send an HTTP request. Returns a result Value (branch on `ok`). |
| `account_updater` | `(entopts) -> std::shared_ptr<AccountUpdaterEntity>` | Create an AccountUpdater entity instance. |
| `account_updater_schedule` | `(entopts) -> std::shared_ptr<AccountUpdaterScheduleEntity>` | Create an AccountUpdaterSchedule entity instance. |
| `account_updater_schedule_with_result` | `(entopts) -> std::shared_ptr<AccountUpdaterScheduleWithResultEntity>` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `account_updater_subscription_with_result` | `(entopts) -> std::shared_ptr<AccountUpdaterSubscriptionWithResultEntity>` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `account_updater_update` | `(entopts) -> std::shared_ptr<AccountUpdaterUpdateEntity>` | Create an AccountUpdaterUpdate entity instance. |
| `api_key` | `(entopts) -> std::shared_ptr<ApiKeyEntity>` | Create an ApiKey entity instance. |
| `apple_pay_merchant_detail` | `(entopts) -> std::shared_ptr<ApplePayMerchantDetailEntity>` | Create an ApplePayMerchantDetail entity instance. |
| `apple_pay_session` | `(entopts) -> std::shared_ptr<ApplePaySessionEntity>` | Create an ApplePaySession entity instance. |
| `dynamic_descriptor` | `(entopts) -> std::shared_ptr<DynamicDescriptorEntity>` | Create a DynamicDescriptor entity instance. |
| `i_frame_create_instance` | `(entopts) -> std::shared_ptr<IFrameCreateInstanceEntity>` | Create an IFrameCreateInstance entity instance. |
| `i_frame_instance` | `(entopts) -> std::shared_ptr<IFrameInstanceEntity>` | Create an IFrameInstance entity instance. |
| `iframe` | `(entopts) -> std::shared_ptr<IframeEntity>` | Create an Iframe entity instance. |
| `init` | `(entopts) -> std::shared_ptr<InitEntity>` | Create an Init entity instance. |
| `list_api_key_scopes_entry` | `(entopts) -> std::shared_ptr<ListApiKeyScopesEntryEntity>` | Create a ListApiKeyScopesEntry entity instance. |
| `payment_iframe` | `(entopts) -> std::shared_ptr<PaymentIframeEntity>` | Create a PaymentIframe entity instance. |
| `three_d_secure_auth` | `(entopts) -> std::shared_ptr<ThreeDSecureAuthEntity>` | Create a ThreeDSecureAuth entity instance. |
| `three_d_secure_browser_init` | `(entopts) -> std::shared_ptr<ThreeDSecureBrowserInitEntity>` | Create a ThreeDSecureBrowserInit entity instance. |
| `three_d_secure_status` | `(entopts) -> std::shared_ptr<ThreeDSecureStatusEntity>` | Create a ThreeDSecureStatus entity instance. |
| `transaction_detail` | `(entopts) -> std::shared_ptr<TransactionDetailEntity>` | Create a TransactionDetail entity instance. |
| `webhook` | `(entopts) -> std::shared_ptr<WebhookEntity>` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Value` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, ctrl) -> Value` | List entities matching the criteria (a Value list). Throws on error. |
| `create` | `(reqdata, ctrl) -> Value` | Create a new entity. Throws on error. |
| `update` | `(reqdata, ctrl) -> Value` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, ctrl) -> Value` | Remove an entity. Throws on error. |
| `data` | `(arg) -> Value` | Get (no arg) or set (with arg) entity data. |
| `match` | `(arg) -> Value` | Get (no arg) or set (with arg) entity match criteria. |
| `make` | `() -> EntityPtr` | Create a new instance with the same options. |
| `getName` | `() -> std::string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a map `Value` for
single-entity ops, a list `Value` for `list`) and throw
`sdk::SdkErrorPtr` on error. Wrap calls in `try`/`catch` to handle
failures.

The `direct()` escape hatch never throws — it returns a result `Value`
you branch on via `getp(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### AccountUpdater

| Field | Description |
| --- | --- |

Operations: Remove.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}`

#### AccountUpdaterSchedule

| Field | Description |
| --- | --- |
| `enabled` |  |
| `period_date` |  |
| `period_id` |  |
| `response_format` |  |
| `token` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/account-updater/payconex/subscribe`

#### AccountUpdaterScheduleWithResult

| Field | Description |
| --- | --- |
| `card` |  |
| `created_at` |  |
| `enabled` |  |
| `expiry` |  |
| `id` |  |
| `most_recent_update` |  |
| `period_date` |  |
| `period_id` |  |
| `response_format` |  |
| `token` |  |
| `type` |  |
| `updated_at` |  |

Operations: Create, List.

API path: `/api/v4/accounts/{accountId}/account-updater/pan/subscribe`

#### AccountUpdaterSubscriptionWithResult

| Field | Description |
| --- | --- |
| `created_at` |  |
| `enabled` |  |
| `id` |  |
| `period_date` |  |
| `period_id` |  |
| `record` |  |
| `response_format` |  |
| `template_ref` |  |
| `updated_at` |  |

Operations: Create, Load, Update.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan`

#### AccountUpdaterUpdate

| Field | Description |
| --- | --- |
| `account_updater_schedule_record_id` |  |
| `format` |  |
| `id` |  |
| `new_expiry` |  |
| `new_token` |  |
| `old_expiry` |  |
| `old_token` |  |
| `recurring_schedule` |  |
| `status` |  |
| `update_id` |  |
| `updated_at` |  |

Operations: Load.

API path: `/api/v4/accounts/{account}/account-updater/updates/{updateId}`

#### ApiKey

| Field | Description |
| --- | --- |
| `account` |  |
| `enabled` |  |
| `expires_at` |  |
| `expires_in` |  |
| `id` |  |
| `label` |  |
| `method` |  |
| `scope` |  |
| `secret` |  |

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/api-keys`

#### ApplePayMerchantDetail

| Field | Description |
| --- | --- |
| `domain` |  |
| `merchant_url` |  |
| `partner_merchant_name` |  |
| `payconex_account_id` |  |

Operations: Create, List.

API path: `/api/v4/accounts/{accountId}/applePay/enrollment`

#### ApplePaySession

| Field | Description |
| --- | --- |
| `display_name` |  |
| `domain_name` |  |
| `epoch_timestamp` |  |
| `expires_at` |  |
| `merchant_identifier` |  |
| `merchant_session_identifier` |  |
| `nonce` |  |
| `operational_analytics_identifier` |  |
| `referrer` |  |
| `retry` |  |
| `signature` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/applePay/session`

#### DynamicDescriptor

| Field | Description |
| --- | --- |
| `city` |  |
| `descriptor` |  |
| `id` |  |
| `name` |  |
| `state` |  |

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/dynamic_descriptors`

#### IFrameCreateInstance

| Field | Description |
| --- | --- |
| `amount` |  |
| `currency` |  |
| `customer` |  |
| `initialize_transaction` |  |
| `label` |  |
| `language` |  |
| `reference` |  |
| `timeout` |  |
| `token` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init`

#### IFrameInstance

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}`

#### Iframe

| Field | Description |
| --- | --- |
| `ach_setting` |  |
| `allowed_parent_domain` |  |
| `allowed_payment_method` |  |
| `card_setting` |  |
| `click_to_pay_setting` |  |
| `currency` |  |
| `id` |  |
| `label` |  |
| `language` |  |
| `timeout` |  |

Operations: Create, List, Load, Update.

API path: `/api/v4/accounts/{accountId}/payment-iframe`

#### Init

| Field | Description |
| --- | --- |
| `customer` |  |
| `description` |  |
| `item` |  |
| `level2` |  |
| `level3` |  |
| `shipping_address` |  |
| `trace` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/payments/init`

#### ListApiKeyScopesEntry

| Field | Description |
| --- | --- |
| `category` |  |
| `description` |  |
| `enabled` |  |
| `level` |  |
| `scope` |  |

Operations: List.

API path: `/api/v4/api-key-scopes`

#### PaymentIframe

| Field | Description |
| --- | --- |

Operations: Remove.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}`

#### ThreeDSecureAuth

| Field | Description |
| --- | --- |
| `browser` |  |
| `card` |  |
| `challenge` |  |
| `customer` |  |
| `purchase` |  |
| `server_transaction_id` |  |
| `shipping` |  |
| `status` |  |
| `three_d_secure_challenge_indicator` |  |
| `three_d_secure_id` |  |
| `trace` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate`

#### ThreeDSecureBrowserInit

| Field | Description |
| --- | --- |
| `acs_result_url` |  |
| `acs_url` |  |
| `cvv` |  |
| `expiry` |  |
| `pan` |  |
| `payment_details_reference` |  |
| `server_transaction_id` |  |
| `status` |  |
| `three_d_secure_data` |  |
| `three_d_secure_id` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/3DS/init-card-details`

#### ThreeDSecureStatus

| Field | Description |
| --- | --- |
| `error` |  |
| `info` |  |
| `server_transaction_id` |  |
| `status` |  |
| `three_d_secure` |  |
| `three_d_secure_id` |  |

Operations: Load.

API path: `/api/v4/accounts/{accountId}/3DS/{resourceId}/status`

#### TransactionDetail

| Field | Description |
| --- | --- |
| `amount` |  |
| `auth` |  |
| `card` |  |
| `customer` |  |
| `description` |  |
| `id` |  |
| `item` |  |
| `level2` |  |
| `level3` |  |
| `override` |  |
| `shipping_address` |  |
| `status` |  |
| `timestamp` |  |
| `trace` |  |

Operations: Load, Update.

API path: `/api/v4/accounts/{accountId}/payments/{transactionId}`

#### Webhook

| Field | Description |
| --- | --- |
| `event` |  |
| `id` |  |
| `url` |  |

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/webhooks`



## Entities


### AccountUpdater

Create an instance: `auto account_updater = client->account_updater();`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match, ctrl)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `auto account_updater_schedule = client->account_updater_schedule();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `std::string` |  |
| `period_id` | `std::string` |  |
| `response_format` | `std::string` |  |
| `token` | `std::vector<Value>` |  |

#### Example: Create

```cpp
Value account_updater_schedule = client->account_updater_schedule()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### AccountUpdaterScheduleWithResult

Create an instance: `auto account_updater_schedule_with_result = client->account_updater_schedule_with_result();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `std::vector<Value>` |  |
| `created_at` | `std::string` |  |
| `enabled` | `bool` |  |
| `expiry` | `std::string` |  |
| `id` | `std::string` |  |
| `most_recent_update` | `std::map<std::string, Value>` |  |
| `period_date` | `std::string` |  |
| `period_id` | `std::string` |  |
| `response_format` | `std::string` |  |
| `token` | `std::vector<Value>` |  |
| `type` | `std::string` |  |
| `updated_at` | `std::string` |  |

#### Example: List

```cpp
Value account_updater_schedule_with_results = client->account_updater_schedule_with_result()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value account_updater_schedule_with_result = client->account_updater_schedule_with_result()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `auto account_updater_subscription_with_result = client->account_updater_subscription_with_result();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `std::string` |  |
| `enabled` | `bool` |  |
| `id` | `std::string` |  |
| `period_date` | `std::string` |  |
| `period_id` | `std::string` |  |
| `record` | `std::vector<Value>` |  |
| `response_format` | `std::string` |  |
| `template_ref` | `std::string` |  |
| `updated_at` | `std::string` |  |

#### Example: Load

```cpp
Value account_updater_subscription_with_result = client->account_updater_subscription_with_result()->load(vmap({{"account_id", Value("account_id")}, {"subscription_id", Value("subscription_id")}}), Value::undef());
```

#### Example: Create

```cpp
Value account_updater_subscription_with_result = client->account_updater_subscription_with_result()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
    {"subscription_id", Value("example_subscription_id")},  // std::string
}), Value::undef());
```


### AccountUpdaterUpdate

Create an instance: `auto account_updater_update = client->account_updater_update();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `std::string` |  |
| `format` | `std::string` |  |
| `id` | `std::string` |  |
| `new_expiry` | `std::string` |  |
| `new_token` | `std::string` |  |
| `old_expiry` | `std::string` |  |
| `old_token` | `std::string` |  |
| `recurring_schedule` | `std::vector<Value>` |  |
| `status` | `std::string` |  |
| `update_id` | `std::string` |  |
| `updated_at` | `std::string` |  |

#### Example: Load

```cpp
Value account_updater_update = client->account_updater_update()->load(vmap({{"id", Value("account_updater_update_id")}, {"account_id", Value("account_id")}}), Value::undef());
```


### ApiKey

Create an instance: `auto api_key = client->api_key();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `std::vector<Value>` |  |
| `enabled` | `bool` |  |
| `expires_at` | `std::string` |  |
| `expires_in` | `std::string` |  |
| `id` | `std::string` |  |
| `label` | `std::string` |  |
| `method` | `std::vector<Value>` |  |
| `scope` | `std::vector<Value>` |  |
| `secret` | `std::string` |  |

#### Example: Load

```cpp
Value api_key = client->api_key()->load(vmap({{"id", Value("api_key_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### Example: List

```cpp
Value api_keys = client->api_key()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value api_key = client->api_key()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### ApplePayMerchantDetail

Create an instance: `auto apple_pay_merchant_detail = client->apple_pay_merchant_detail();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `std::vector<Value>` |  |
| `merchant_url` | `std::string` |  |
| `partner_merchant_name` | `std::string` |  |
| `payconex_account_id` | `std::string` |  |

#### Example: List

```cpp
Value apple_pay_merchant_details = client->apple_pay_merchant_detail()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value apple_pay_merchant_detail = client->apple_pay_merchant_detail()->create(vmap({
    {"account_id", Value(1)},  // int64_t
}), Value::undef());
```


### ApplePaySession

Create an instance: `auto apple_pay_session = client->apple_pay_session();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `std::string` |  |
| `domain_name` | `std::string` |  |
| `epoch_timestamp` | `int64_t` |  |
| `expires_at` | `int64_t` |  |
| `merchant_identifier` | `std::string` |  |
| `merchant_session_identifier` | `std::string` |  |
| `nonce` | `int64_t` |  |
| `operational_analytics_identifier` | `std::string` |  |
| `referrer` | `std::string` |  |
| `retry` | `int64_t` |  |
| `signature` | `std::string` |  |

#### Example: Create

```cpp
Value apple_pay_session = client->apple_pay_session()->create(vmap({
    {"account_id", Value(1)},  // int64_t
}), Value::undef());
```


### DynamicDescriptor

Create an instance: `auto dynamic_descriptor = client->dynamic_descriptor();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `std::string` |  |
| `descriptor` | `std::string` |  |
| `id` | `std::string` |  |
| `name` | `std::string` |  |
| `state` | `std::string` |  |

#### Example: Load

```cpp
Value dynamic_descriptor = client->dynamic_descriptor()->load(vmap({{"id", Value("dynamic_descriptor_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### Example: List

```cpp
Value dynamic_descriptors = client->dynamic_descriptor()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value dynamic_descriptor = client->dynamic_descriptor()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### IFrameCreateInstance

Create an instance: `auto i_frame_create_instance = client->i_frame_create_instance();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `std::string` |  |
| `currency` | `std::string` |  |
| `customer` | `std::map<std::string, Value>` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `std::string` |  |
| `language` | `std::string` |  |
| `reference` | `std::string` |  |
| `timeout` | `double` |  |
| `token` | `std::vector<Value>` |  |

#### Example: Create

```cpp
Value i_frame_create_instance = client->i_frame_create_instance()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
    {"payment_iframe_id", Value("example_payment_iframe_id")},  // std::string
}), Value::undef());
```


### IFrameInstance

Create an instance: `auto i_frame_instance = client->i_frame_instance();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```cpp
Value i_frame_instance = client->i_frame_instance()->load(vmap({{"id", Value("i_frame_instance_id")}, {"account_id", Value("account_id")}, {"payment_iframe_id", Value("payment_iframe_id")}}), Value::undef());
```


### Iframe

Create an instance: `auto iframe = client->iframe();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `std::map<std::string, Value>` |  |
| `allowed_parent_domain` | `std::vector<Value>` |  |
| `allowed_payment_method` | `std::vector<Value>` |  |
| `card_setting` | `std::map<std::string, Value>` |  |
| `click_to_pay_setting` | `std::map<std::string, Value>` |  |
| `currency` | `std::string` |  |
| `id` | `std::string` |  |
| `label` | `std::string` |  |
| `language` | `std::string` |  |
| `timeout` | `double` |  |

#### Example: Load

```cpp
Value iframe = client->iframe()->load(vmap({{"account_id", Value("account_id")}, {"iframe_id", Value("iframe_id")}}), Value::undef());
```

#### Example: List

```cpp
Value iframes = client->iframe()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value iframe = client->iframe()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### Init

Create an instance: `auto init = client->init();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `std::map<std::string, Value>` |  |
| `description` | `std::string` |  |
| `item` | `std::vector<Value>` |  |
| `level2` | `std::map<std::string, Value>` |  |
| `level3` | `std::map<std::string, Value>` |  |
| `shipping_address` | `std::map<std::string, Value>` |  |
| `trace` | `std::map<std::string, Value>` |  |

#### Example: Create

```cpp
Value init = client->init()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### ListApiKeyScopesEntry

Create an instance: `auto list_api_key_scopes_entry = client->list_api_key_scopes_entry();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `std::string` |  |
| `description` | `std::string` |  |
| `enabled` | `bool` |  |
| `level` | `int64_t` |  |
| `scope` | `std::string` |  |

#### Example: List

```cpp
Value list_api_key_scopes_entrys = client->list_api_key_scopes_entry()->list(Value::undef(), Value::undef());
```


### PaymentIframe

Create an instance: `auto payment_iframe = client->payment_iframe();`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match, ctrl)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `auto three_d_secure_auth = client->three_d_secure_auth();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `std::map<std::string, Value>` |  |
| `card` | `std::map<std::string, Value>` |  |
| `challenge` | `std::map<std::string, Value>` |  |
| `customer` | `std::map<std::string, Value>` |  |
| `purchase` | `std::map<std::string, Value>` |  |
| `server_transaction_id` | `std::string` |  |
| `shipping` | `std::map<std::string, Value>` |  |
| `status` | `std::string` |  |
| `three_d_secure_challenge_indicator` | `std::string` |  |
| `three_d_secure_id` | `std::string` |  |
| `trace` | `std::map<std::string, Value>` |  |

#### Example: Create

```cpp
Value three_d_secure_auth = client->three_d_secure_auth()->create(vmap({
    {"3_d_id", Value("example_3_d_id")},  // std::string
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### ThreeDSecureBrowserInit

Create an instance: `auto three_d_secure_browser_init = client->three_d_secure_browser_init();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `std::string` |  |
| `acs_url` | `std::string` |  |
| `cvv` | `std::string` |  |
| `expiry` | `std::string` |  |
| `pan` | `std::string` |  |
| `payment_details_reference` | `std::string` |  |
| `server_transaction_id` | `std::string` |  |
| `status` | `std::string` |  |
| `three_d_secure_data` | `std::string` |  |
| `three_d_secure_id` | `std::string` |  |

#### Example: Create

```cpp
Value three_d_secure_browser_init = client->three_d_secure_browser_init()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


### ThreeDSecureStatus

Create an instance: `auto three_d_secure_status = client->three_d_secure_status();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `std::map<std::string, Value>` |  |
| `info` | `std::map<std::string, Value>` |  |
| `server_transaction_id` | `std::string` |  |
| `status` | `std::string` |  |
| `three_d_secure` | `std::map<std::string, Value>` |  |
| `three_d_secure_id` | `std::string` |  |

#### Example: Load

```cpp
Value three_d_secure_status = client->three_d_secure_status()->load(vmap({{"3_d_id", Value("3_d_id")}, {"account_id", Value("account_id")}}), Value::undef());
```


### TransactionDetail

Create an instance: `auto transaction_detail = client->transaction_detail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `std::map<std::string, Value>` |  |
| `auth` | `std::map<std::string, Value>` |  |
| `card` | `std::map<std::string, Value>` |  |
| `customer` | `std::map<std::string, Value>` |  |
| `description` | `std::string` |  |
| `id` | `std::string` |  |
| `item` | `std::vector<Value>` |  |
| `level2` | `std::map<std::string, Value>` |  |
| `level3` | `std::map<std::string, Value>` |  |
| `override` | `std::map<std::string, Value>` |  |
| `shipping_address` | `std::map<std::string, Value>` |  |
| `status` | `std::string` |  |
| `timestamp` | `std::string` |  |
| `trace` | `std::map<std::string, Value>` |  |

#### Example: Load

```cpp
Value transaction_detail = client->transaction_detail()->load(vmap({{"account_id", Value("account_id")}, {"transaction_id", Value("transaction_id")}}), Value::undef());
```


### Webhook

Create an instance: `auto webhook = client->webhook();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `std::string` |  |
| `id` | `std::string` |  |
| `url` | `std::string` |  |

#### Example: Load

```cpp
Value webhook = client->webhook()->load(vmap({{"id", Value("webhook_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### Example: List

```cpp
Value webhooks = client->webhook()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value webhook = client->webhook()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `Value`

The C++ SDK uses a single dynamic `sdk::Value` type (a JSON-like variant
over string / number / bool / list / map) throughout rather than generated
typed structs. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema changes.

Build maps with `sdk::vmap({{"key", sdk::Value("v")}})` and lists with
`sdk::vlist({...})`; read fields back with `sdk::getp(value, "key")`. Use
`sdk::to_map()` to safely coerce a value that should be a map, and
`sdk::Struct::jsonify(value)` to render it as JSON.

### Directory structure

```
cpp/
├── core/                        -- Runtime type graph, config, generated client
├── entity/                      -- Per-entity client headers
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Operation pipeline + vendored struct library
├── test/                        -- Test suites
├── Makefile                     -- Build & run the tests (C++17)
└── VERSION                      -- SDK version
```

Include the umbrella header `core/sdk.hpp` to pull in the whole SDK: the
runtime types, the pipeline utilities, the vendored struct, the generated
config, the per-entity clients and the generated `BluefinPayconexSDK`
client class. Everything lives in the `sdk` namespace.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const threedsecurestatus = client.ThreeDSecureStatus()
await threedsecurestatus.load({ '3_d_id': "example", account_id: "example" })

// threedsecurestatus.data() now returns the threedsecurestatus data from the last `load`
// threedsecurestatus.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
