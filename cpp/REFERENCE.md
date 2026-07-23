# BluefinPayconex C++ SDK Reference

Complete API reference for the BluefinPayconex C++ SDK.


## BluefinPayconexSDK

### Constructor

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinPayconexSDK>(options);
```

Create a new SDK client instance. `options` is an `sdk::Value` map.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Value` | SDK configuration options (a map). |
| `options["apikey"]` | `std::string` | API key for authentication. |
| `options["base"]` | `std::string` | Base URL for API requests. |
| `options["prefix"]` | `std::string` | URL prefix appended after base. |
| `options["suffix"]` | `std::string` | URL suffix appended after path. |
| `options["headers"]` | `Value` | Custom headers for all requests. |
| `options["feature"]` | `Value` | Feature configuration. |
| `options["system"]` | `Value` | System overrides. |


### Static Methods

#### `BluefinPayconexSDK::testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be
`Value::undef()`; a no-arg overload is also provided.

```cpp
auto client = BluefinPayconexSDK::testSDK();
```


### Instance Methods

#### `account_updater(entopts = Value::undef()) -> std::shared_ptr<AccountUpdaterEntity>`

Create a new `AccountUpdaterEntity` instance bound to this client.

#### `account_updater_schedule(entopts = Value::undef()) -> std::shared_ptr<AccountUpdaterScheduleEntity>`

Create a new `AccountUpdaterScheduleEntity` instance bound to this client.

#### `account_updater_schedule_with_result(entopts = Value::undef()) -> std::shared_ptr<AccountUpdaterScheduleWithResultEntity>`

Create a new `AccountUpdaterScheduleWithResultEntity` instance bound to this client.

#### `account_updater_subscription_with_result(entopts = Value::undef()) -> std::shared_ptr<AccountUpdaterSubscriptionWithResultEntity>`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance bound to this client.

#### `account_updater_update(entopts = Value::undef()) -> std::shared_ptr<AccountUpdaterUpdateEntity>`

Create a new `AccountUpdaterUpdateEntity` instance bound to this client.

#### `api_key(entopts = Value::undef()) -> std::shared_ptr<ApiKeyEntity>`

Create a new `ApiKeyEntity` instance bound to this client.

#### `apple_pay_merchant_detail(entopts = Value::undef()) -> std::shared_ptr<ApplePayMerchantDetailEntity>`

Create a new `ApplePayMerchantDetailEntity` instance bound to this client.

#### `apple_pay_session(entopts = Value::undef()) -> std::shared_ptr<ApplePaySessionEntity>`

Create a new `ApplePaySessionEntity` instance bound to this client.

#### `dynamic_descriptor(entopts = Value::undef()) -> std::shared_ptr<DynamicDescriptorEntity>`

Create a new `DynamicDescriptorEntity` instance bound to this client.

#### `i_frame_create_instance(entopts = Value::undef()) -> std::shared_ptr<IFrameCreateInstanceEntity>`

Create a new `IFrameCreateInstanceEntity` instance bound to this client.

#### `i_frame_instance(entopts = Value::undef()) -> std::shared_ptr<IFrameInstanceEntity>`

Create a new `IFrameInstanceEntity` instance bound to this client.

#### `iframe(entopts = Value::undef()) -> std::shared_ptr<IframeEntity>`

Create a new `IframeEntity` instance bound to this client.

#### `init(entopts = Value::undef()) -> std::shared_ptr<InitEntity>`

Create a new `InitEntity` instance bound to this client.

#### `list_api_key_scopes_entry(entopts = Value::undef()) -> std::shared_ptr<ListApiKeyScopesEntryEntity>`

Create a new `ListApiKeyScopesEntryEntity` instance bound to this client.

#### `payment_iframe(entopts = Value::undef()) -> std::shared_ptr<PaymentIframeEntity>`

Create a new `PaymentIframeEntity` instance bound to this client.

#### `three_d_secure_auth(entopts = Value::undef()) -> std::shared_ptr<ThreeDSecureAuthEntity>`

Create a new `ThreeDSecureAuthEntity` instance bound to this client.

#### `three_d_secure_browser_init(entopts = Value::undef()) -> std::shared_ptr<ThreeDSecureBrowserInitEntity>`

Create a new `ThreeDSecureBrowserInitEntity` instance bound to this client.

#### `three_d_secure_status(entopts = Value::undef()) -> std::shared_ptr<ThreeDSecureStatusEntity>`

Create a new `ThreeDSecureStatusEntity` instance bound to this client.

#### `transaction_detail(entopts = Value::undef()) -> std::shared_ptr<TransactionDetailEntity>`

Create a new `TransactionDetailEntity` instance bound to this client.

#### `webhook(entopts = Value::undef()) -> std::shared_ptr<WebhookEntity>`

Create a new `WebhookEntity` instance bound to this client.

#### `optionsMap() -> Value`

Return a deep copy of the current SDK options.

#### `getUtility() -> UtilityPtr`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `getp(result, "ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `std::string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `std::string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Value` | Path parameter values. |
| `fetchargs["query"]` | `Value` | Query string parameters. |
| `fetchargs["headers"]` | `Value` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `Value` (result map)

#### `prepare(fetchargs) -> Value`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## AccountUpdaterEntity

```cpp
auto account_updater = client->account_updater();
```

### Operations

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->account_updater()->remove(vmap({{"account_id", Value("account_id")}, {"subscription_id", Value("subscription_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `AccountUpdaterEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```cpp
auto account_updater_schedule = client->account_updater_schedule();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `std::string` | No |  |
| `period_id` | `std::string` | Yes |  |
| `response_format` | `std::string` | No |  |
| `token` | `std::vector<Value>` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->account_updater_schedule()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `AccountUpdaterScheduleEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```cpp
auto account_updater_schedule_with_result = client->account_updater_schedule_with_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `std::vector<Value>` | Yes |  |
| `created_at` | `std::string` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `std::string` | No |  |
| `id` | `std::string` | Yes |  |
| `most_recent_update` | `std::map<std::string, Value>` | No |  |
| `period_date` | `std::string` | No |  |
| `period_id` | `std::string` | Yes |  |
| `response_format` | `std::string` | No |  |
| `token` | `std::vector<Value>` | Yes |  |
| `type` | `std::string` | Yes |  |
| `updated_at` | `std::string` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `card` | - | - |
| `created_at` | - | - |
| `enabled` | Yes | - |
| `expiry` | - | - |
| `id` | - | - |
| `most_recent_update` | - | - |
| `period_date` | - | - |
| `period_id` | - | - |
| `response_format` | - | - |
| `token` | - | - |
| `type` | - | - |
| `updated_at` | - | - |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->account_updater_schedule_with_result()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->account_updater_schedule_with_result()->list(Value::undef(), Value::undef());
for (const auto& account_updater_schedule_with_result : *results.as_list()) {
  std::cout << Struct::jsonify(account_updater_schedule_with_result) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```cpp
auto account_updater_subscription_with_result = client->account_updater_subscription_with_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `std::string` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `std::string` | No |  |
| `period_date` | `std::string` | No |  |
| `period_id` | `std::string` | No |  |
| `record` | `std::vector<Value>` | No |  |
| `response_format` | `std::string` | No |  |
| `template_ref` | `std::string` | No |  |
| `updated_at` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->account_updater_subscription_with_result()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
    {"subscription_id", Value("example_subscription_id")},  // std::string
}), Value::undef());
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->account_updater_subscription_with_result()->load(vmap({{"account_id", Value("account_id")}, {"subscription_id", Value("subscription_id")}}), Value::undef());
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->account_updater_subscription_with_result()->update(vmap({
    {"account_id", Value("account_id")},
    {"subscription_id", Value("subscription_id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```cpp
auto account_updater_update = client->account_updater_update();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `std::string` | No |  |
| `format` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `new_expiry` | `std::string` | No |  |
| `new_token` | `std::string` | No |  |
| `old_expiry` | `std::string` | No |  |
| `old_token` | `std::string` | No |  |
| `recurring_schedule` | `std::vector<Value>` | No |  |
| `status` | `std::string` | No |  |
| `update_id` | `std::string` | No |  |
| `updated_at` | `std::string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->account_updater_update()->load(vmap({{"id", Value("account_updater_update_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `AccountUpdaterUpdateEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ApiKeyEntity

```cpp
auto api_key = client->api_key();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `std::vector<Value>` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `std::string` | No |  |
| `expires_in` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `label` | `std::string` | No |  |
| `method` | `std::vector<Value>` | No |  |
| `scope` | `std::vector<Value>` | No |  |
| `secret` | `std::string` | No |  |

### Field Usage by Operation

| Field | load | list | create | update | remove |
| --- | --- | --- | --- | --- | --- |
| `account` | - | - | - | - | - |
| `enabled` | - | - | - | - | - |
| `expires_at` | - | - | - | - | - |
| `expires_in` | - | - | - | - | - |
| `id` | - | - | - | - | - |
| `label` | - | - | Yes | - | - |
| `method` | - | - | - | - | - |
| `scope` | - | - | Yes | - | - |
| `secret` | - | - | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->api_key()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->api_key()->list(Value::undef(), Value::undef());
for (const auto& api_key : *results.as_list()) {
  std::cout << Struct::jsonify(api_key) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->api_key()->load(vmap({{"id", Value("api_key_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->api_key()->remove(vmap({{"id", Value("api_key_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->api_key()->update(vmap({
    {"id", Value("api_key_id")},
    {"account_id", Value("account_id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ApiKeyEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```cpp
auto apple_pay_merchant_detail = client->apple_pay_merchant_detail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `std::vector<Value>` | Yes |  |
| `merchant_url` | `std::string` | Yes |  |
| `partner_merchant_name` | `std::string` | No |  |
| `payconex_account_id` | `std::string` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `domain` | - | - |
| `merchant_url` | - | Yes |
| `partner_merchant_name` | - | - |
| `payconex_account_id` | - | - |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->apple_pay_merchant_detail()->create(vmap({
    {"account_id", Value(1)},  // int64_t
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->apple_pay_merchant_detail()->list(Value::undef(), Value::undef());
for (const auto& apple_pay_merchant_detail : *results.as_list()) {
  std::cout << Struct::jsonify(apple_pay_merchant_detail) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ApplePayMerchantDetailEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ApplePaySessionEntity

```cpp
auto apple_pay_session = client->apple_pay_session();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `std::string` | No |  |
| `domain_name` | `std::string` | No |  |
| `epoch_timestamp` | `int64_t` | No |  |
| `expires_at` | `int64_t` | No |  |
| `merchant_identifier` | `std::string` | No |  |
| `merchant_session_identifier` | `std::string` | No |  |
| `nonce` | `int64_t` | No |  |
| `operational_analytics_identifier` | `std::string` | No |  |
| `referrer` | `std::string` | Yes |  |
| `retry` | `int64_t` | No |  |
| `signature` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->apple_pay_session()->create(vmap({
    {"account_id", Value(1)},  // int64_t
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ApplePaySessionEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DynamicDescriptorEntity

```cpp
auto dynamic_descriptor = client->dynamic_descriptor();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `std::string` | No |  |
| `descriptor` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `name` | `std::string` | No |  |
| `state` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->dynamic_descriptor()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->dynamic_descriptor()->list(Value::undef(), Value::undef());
for (const auto& dynamic_descriptor : *results.as_list()) {
  std::cout << Struct::jsonify(dynamic_descriptor) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->dynamic_descriptor()->load(vmap({{"id", Value("dynamic_descriptor_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->dynamic_descriptor()->remove(vmap({{"id", Value("dynamic_descriptor_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->dynamic_descriptor()->update(vmap({
    {"id", Value("dynamic_descriptor_id")},
    {"account_id", Value("account_id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DynamicDescriptorEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## IFrameCreateInstanceEntity

```cpp
auto i_frame_create_instance = client->i_frame_create_instance();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `std::string` | No |  |
| `currency` | `std::string` | No |  |
| `customer` | `std::map<std::string, Value>` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `std::string` | Yes |  |
| `language` | `std::string` | No |  |
| `reference` | `std::string` | No |  |
| `timeout` | `double` | No |  |
| `token` | `std::vector<Value>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->i_frame_create_instance()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
    {"payment_iframe_id", Value("example_payment_iframe_id")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `IFrameCreateInstanceEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## IFrameInstanceEntity

```cpp
auto i_frame_instance = client->i_frame_instance();
```

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->i_frame_instance()->load(vmap({{"id", Value("i_frame_instance_id")}, {"account_id", Value("account_id")}, {"payment_iframe_id", Value("payment_iframe_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `IFrameInstanceEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## IframeEntity

```cpp
auto iframe = client->iframe();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `std::map<std::string, Value>` | No |  |
| `allowed_parent_domain` | `std::vector<Value>` | Yes |  |
| `allowed_payment_method` | `std::vector<Value>` | Yes |  |
| `card_setting` | `std::map<std::string, Value>` | No |  |
| `click_to_pay_setting` | `std::map<std::string, Value>` | No |  |
| `currency` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `label` | `std::string` | Yes |  |
| `language` | `std::string` | No |  |
| `timeout` | `double` | No |  |

### Field Usage by Operation

| Field | load | list | create | update |
| --- | --- | --- | --- | --- |
| `ach_setting` | - | - | - | - |
| `allowed_parent_domain` | - | Yes | - | Yes |
| `allowed_payment_method` | - | Yes | - | Yes |
| `card_setting` | - | - | - | - |
| `click_to_pay_setting` | - | - | - | - |
| `currency` | - | - | - | - |
| `id` | - | - | - | - |
| `label` | - | Yes | - | Yes |
| `language` | - | - | - | - |
| `timeout` | - | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->iframe()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->iframe()->list(Value::undef(), Value::undef());
for (const auto& iframe : *results.as_list()) {
  std::cout << Struct::jsonify(iframe) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->iframe()->load(vmap({{"account_id", Value("account_id")}, {"iframe_id", Value("iframe_id")}}), Value::undef());
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->iframe()->update(vmap({
    {"account_id", Value("account_id")},
    {"iframe_id", Value("iframe_id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `IframeEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## InitEntity

```cpp
auto init = client->init();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `std::map<std::string, Value>` | No |  |
| `description` | `std::string` | No |  |
| `item` | `std::vector<Value>` | No |  |
| `level2` | `std::map<std::string, Value>` | No |  |
| `level3` | `std::map<std::string, Value>` | No |  |
| `shipping_address` | `std::map<std::string, Value>` | Yes |  |
| `trace` | `std::map<std::string, Value>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->init()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `InitEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```cpp
auto list_api_key_scopes_entry = client->list_api_key_scopes_entry();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `std::string` | No |  |
| `description` | `std::string` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `int64_t` | No |  |
| `scope` | `std::string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->list_api_key_scopes_entry()->list(Value::undef(), Value::undef());
for (const auto& list_api_key_scopes_entry : *results.as_list()) {
  std::cout << Struct::jsonify(list_api_key_scopes_entry) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ListApiKeyScopesEntryEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## PaymentIframeEntity

```cpp
auto payment_iframe = client->payment_iframe();
```

### Operations

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->payment_iframe()->remove(vmap({{"account_id", Value("account_id")}, {"id", Value("id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `PaymentIframeEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ThreeDSecureAuthEntity

```cpp
auto three_d_secure_auth = client->three_d_secure_auth();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `std::map<std::string, Value>` | Yes |  |
| `card` | `std::map<std::string, Value>` | Yes |  |
| `challenge` | `std::map<std::string, Value>` | No |  |
| `customer` | `std::map<std::string, Value>` | No |  |
| `purchase` | `std::map<std::string, Value>` | Yes |  |
| `server_transaction_id` | `std::string` | No |  |
| `shipping` | `std::map<std::string, Value>` | Yes |  |
| `status` | `std::string` | No |  |
| `three_d_secure_challenge_indicator` | `std::string` | No |  |
| `three_d_secure_id` | `std::string` | No |  |
| `trace` | `std::map<std::string, Value>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->three_d_secure_auth()->create(vmap({
    {"3_d_id", Value("example_3_d_id")},  // std::string
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ThreeDSecureAuthEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```cpp
auto three_d_secure_browser_init = client->three_d_secure_browser_init();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `std::string` | No |  |
| `acs_url` | `std::string` | No |  |
| `cvv` | `std::string` | No |  |
| `expiry` | `std::string` | Yes |  |
| `pan` | `std::string` | Yes |  |
| `payment_details_reference` | `std::string` | No |  |
| `server_transaction_id` | `std::string` | No |  |
| `status` | `std::string` | No |  |
| `three_d_secure_data` | `std::string` | No |  |
| `three_d_secure_id` | `std::string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->three_d_secure_browser_init()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ThreeDSecureStatusEntity

```cpp
auto three_d_secure_status = client->three_d_secure_status();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `std::map<std::string, Value>` | No |  |
| `info` | `std::map<std::string, Value>` | No |  |
| `server_transaction_id` | `std::string` | No |  |
| `status` | `std::string` | No |  |
| `three_d_secure` | `std::map<std::string, Value>` | No |  |
| `three_d_secure_id` | `std::string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->three_d_secure_status()->load(vmap({{"3_d_id", Value("3_d_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ThreeDSecureStatusEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## TransactionDetailEntity

```cpp
auto transaction_detail = client->transaction_detail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `std::map<std::string, Value>` | Yes |  |
| `auth` | `std::map<std::string, Value>` | Yes |  |
| `card` | `std::map<std::string, Value>` | No |  |
| `customer` | `std::map<std::string, Value>` | No |  |
| `description` | `std::string` | No |  |
| `id` | `std::string` | No |  |
| `item` | `std::vector<Value>` | No |  |
| `level2` | `std::map<std::string, Value>` | No |  |
| `level3` | `std::map<std::string, Value>` | No |  |
| `override` | `std::map<std::string, Value>` | No |  |
| `shipping_address` | `std::map<std::string, Value>` | Yes |  |
| `status` | `std::string` | Yes |  |
| `timestamp` | `std::string` | No |  |
| `trace` | `std::map<std::string, Value>` | No |  |

### Field Usage by Operation

| Field | load | update |
| --- | --- | --- |
| `amount` | - | - |
| `auth` | - | - |
| `card` | - | - |
| `customer` | - | - |
| `description` | - | - |
| `id` | - | - |
| `item` | - | - |
| `level2` | - | - |
| `level3` | - | - |
| `override` | - | - |
| `shipping_address` | - | Yes |
| `status` | - | - |
| `timestamp` | - | - |
| `trace` | - | - |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->transaction_detail()->load(vmap({{"account_id", Value("account_id")}, {"transaction_id", Value("transaction_id")}}), Value::undef());
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->transaction_detail()->update(vmap({
    {"account_id", Value("account_id")},
    {"transaction_id", Value("transaction_id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `TransactionDetailEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## WebhookEntity

```cpp
auto webhook = client->webhook();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `std::string` | Yes |  |
| `id` | `std::string` | No |  |
| `url` | `std::string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->webhook()->create(vmap({
    {"account_id", Value("example_account_id")},  // std::string
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->webhook()->list(Value::undef(), Value::undef());
for (const auto& webhook : *results.as_list()) {
  std::cout << Struct::jsonify(webhook) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->webhook()->load(vmap({{"id", Value("webhook_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->webhook()->remove(vmap({{"id", Value("webhook_id")}, {"account_id", Value("account_id")}}), Value::undef());
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->webhook()->update(vmap({
    {"id", Value("webhook_id")},
    {"account_id", Value("account_id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `WebhookEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```cpp
auto client = std::make_shared<BluefinPayconexSDK>(vmap({
    {"feature", vmap({
        {"test", vmap({{"active", Value(true)}})},
    })},
}));
```

