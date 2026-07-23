# BluefinPayconex Rust SDK Reference

Complete API reference for the BluefinPayconex Rust SDK.


## BluefinPayconexSDK

### Constructor

```rust
use bluefin_payconex_sdk::{BluefinPayconexSDK, Value};

let client = BluefinPayconexSDK::new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`Value::Noval` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinPayconexSDK>`

Create a test client with mock features active. Both arguments may be
`Value::Noval`.

```rust
use bluefin_payconex_sdk::{test_sdk, Value};

let client = test_sdk(Value::Noval, Value::Noval);
```


### Instance Methods

#### `account_updater(entopts: Value) -> Rc<AccountUpdaterEntity>`

Create a new `AccountUpdaterEntity` instance. Pass `Value::Noval` for no
initial options.

#### `account_updater_schedule(entopts: Value) -> Rc<AccountUpdaterScheduleEntity>`

Create a new `AccountUpdaterScheduleEntity` instance. Pass `Value::Noval` for no
initial options.

#### `account_updater_schedule_with_result(entopts: Value) -> Rc<AccountUpdaterScheduleWithResultEntity>`

Create a new `AccountUpdaterScheduleWithResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `account_updater_subscription_with_result(entopts: Value) -> Rc<AccountUpdaterSubscriptionWithResultEntity>`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `account_updater_update(entopts: Value) -> Rc<AccountUpdaterUpdateEntity>`

Create a new `AccountUpdaterUpdateEntity` instance. Pass `Value::Noval` for no
initial options.

#### `api_key(entopts: Value) -> Rc<ApiKeyEntity>`

Create a new `ApiKeyEntity` instance. Pass `Value::Noval` for no
initial options.

#### `apple_pay_merchant_detail(entopts: Value) -> Rc<ApplePayMerchantDetailEntity>`

Create a new `ApplePayMerchantDetailEntity` instance. Pass `Value::Noval` for no
initial options.

#### `apple_pay_session(entopts: Value) -> Rc<ApplePaySessionEntity>`

Create a new `ApplePaySessionEntity` instance. Pass `Value::Noval` for no
initial options.

#### `dynamic_descriptor(entopts: Value) -> Rc<DynamicDescriptorEntity>`

Create a new `DynamicDescriptorEntity` instance. Pass `Value::Noval` for no
initial options.

#### `i_frame_create_instance(entopts: Value) -> Rc<IFrameCreateInstanceEntity>`

Create a new `IFrameCreateInstanceEntity` instance. Pass `Value::Noval` for no
initial options.

#### `i_frame_instance(entopts: Value) -> Rc<IFrameInstanceEntity>`

Create a new `IFrameInstanceEntity` instance. Pass `Value::Noval` for no
initial options.

#### `iframe(entopts: Value) -> Rc<IframeEntity>`

Create a new `IframeEntity` instance. Pass `Value::Noval` for no
initial options.

#### `init(entopts: Value) -> Rc<InitEntity>`

Create a new `InitEntity` instance. Pass `Value::Noval` for no
initial options.

#### `list_api_key_scopes_entry(entopts: Value) -> Rc<ListApiKeyScopesEntryEntity>`

Create a new `ListApiKeyScopesEntryEntity` instance. Pass `Value::Noval` for no
initial options.

#### `payment_iframe(entopts: Value) -> Rc<PaymentIframeEntity>`

Create a new `PaymentIframeEntity` instance. Pass `Value::Noval` for no
initial options.

#### `three_d_secure_auth(entopts: Value) -> Rc<ThreeDSecureAuthEntity>`

Create a new `ThreeDSecureAuthEntity` instance. Pass `Value::Noval` for no
initial options.

#### `three_d_secure_browser_init(entopts: Value) -> Rc<ThreeDSecureBrowserInitEntity>`

Create a new `ThreeDSecureBrowserInitEntity` instance. Pass `Value::Noval` for no
initial options.

#### `three_d_secure_status(entopts: Value) -> Rc<ThreeDSecureStatusEntity>`

Create a new `ThreeDSecureStatusEntity` instance. Pass `Value::Noval` for no
initial options.

#### `transaction_detail(entopts: Value) -> Rc<TransactionDetailEntity>`

Create a new `TransactionDetailEntity` instance. Pass `Value::Noval` for no
initial options.

#### `webhook(entopts: Value) -> Rc<WebhookEntity>`

Create a new `WebhookEntity` instance. Pass `Value::Noval` for no
initial options.

#### `options_map() -> Value`

Return a deep copy of the current SDK options.

#### `get_utility() -> Rc<Utility>`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) -> Result<Value, BluefinPayconexError>`

Make a direct HTTP request to any API endpoint. `Ok` is a result `Value::Map`
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch resolves to `Ok` even on a non-2xx response — branch on
`getp(&result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) -> Result<Value, BluefinPayconexError>`

Prepare a fetch definition without sending. Returns the fetchdef on `Ok`.


---

## AccountUpdaterEntity

```rust
let account_updater = client.account_updater(Value::Noval);
```

### Operations

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.account_updater(Value::Noval).remove(jo(vec![("account_id", Value::str("account_id")), ("subscription_id", Value::str("subscription_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `AccountUpdaterEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```rust
let account_updater_schedule = client.account_updater_schedule(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `Vec<Value>` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.account_updater_schedule(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `AccountUpdaterScheduleEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```rust
let account_updater_schedule_with_result = client.account_updater_schedule_with_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Vec<Value>` | Yes |  |
| `created_at` | `String` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `String` | No |  |
| `id` | `String` | Yes |  |
| `most_recent_update` | `std::collections::HashMap<String, Value>` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `Vec<Value>` | Yes |  |
| `type` | `String` | Yes |  |
| `updated_at` | `String` | Yes |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.account_updater_schedule_with_result(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.account_updater_schedule_with_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for account_updater_schedule_with_result in items.borrow().iter() {
        println!("{:?}", account_updater_schedule_with_result);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```rust
let account_updater_subscription_with_result = client.account_updater_subscription_with_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `String` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | No |  |
| `record` | `Vec<Value>` | No |  |
| `response_format` | `String` | No |  |
| `template_ref` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.account_updater_subscription_with_result(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
    ("subscription_id", Value::str("example_subscription_id")),  // String
]), Value::Noval).unwrap();
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.account_updater_subscription_with_result(Value::Noval).load(jo(vec![("account_id", Value::str("account_id")), ("subscription_id", Value::str("subscription_id"))]), Value::Noval).unwrap();
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.account_updater_subscription_with_result(Value::Noval).update(jo(vec![
    ("account_id", Value::str("account_id")),
    ("subscription_id", Value::str("subscription_id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```rust
let account_updater_update = client.account_updater_update(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `String` | No |  |
| `format` | `String` | No |  |
| `id` | `String` | No |  |
| `new_expiry` | `String` | No |  |
| `new_token` | `String` | No |  |
| `old_expiry` | `String` | No |  |
| `old_token` | `String` | No |  |
| `recurring_schedule` | `Vec<Value>` | No |  |
| `status` | `String` | No |  |
| `update_id` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.account_updater_update(Value::Noval).load(jo(vec![("id", Value::str("account_updater_update_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `AccountUpdaterUpdateEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ApiKeyEntity

```rust
let api_key = client.api_key(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `Vec<Value>` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `String` | No |  |
| `expires_in` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | No |  |
| `method` | `Vec<Value>` | No |  |
| `scope` | `Vec<Value>` | No |  |
| `secret` | `String` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.api_key(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.api_key(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for api_key in items.borrow().iter() {
        println!("{:?}", api_key);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.api_key(Value::Noval).load(jo(vec![("id", Value::str("api_key_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.api_key(Value::Noval).remove(jo(vec![("id", Value::str("api_key_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.api_key(Value::Noval).update(jo(vec![
    ("id", Value::str("api_key_id")),
    ("account_id", Value::str("account_id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ApiKeyEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```rust
let apple_pay_merchant_detail = client.apple_pay_merchant_detail(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `Vec<Value>` | Yes |  |
| `merchant_url` | `String` | Yes |  |
| `partner_merchant_name` | `String` | No |  |
| `payconex_account_id` | `String` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `domain` | - | - |
| `merchant_url` | - | Yes |
| `partner_merchant_name` | - | - |
| `payconex_account_id` | - | - |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.apple_pay_merchant_detail(Value::Noval).create(jo(vec![
    ("account_id", Value::Num(1.0)),  // i64
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.apple_pay_merchant_detail(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for apple_pay_merchant_detail in items.borrow().iter() {
        println!("{:?}", apple_pay_merchant_detail);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ApplePayMerchantDetailEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ApplePaySessionEntity

```rust
let apple_pay_session = client.apple_pay_session(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String` | No |  |
| `domain_name` | `String` | No |  |
| `epoch_timestamp` | `i64` | No |  |
| `expires_at` | `i64` | No |  |
| `merchant_identifier` | `String` | No |  |
| `merchant_session_identifier` | `String` | No |  |
| `nonce` | `i64` | No |  |
| `operational_analytics_identifier` | `String` | No |  |
| `referrer` | `String` | Yes |  |
| `retry` | `i64` | No |  |
| `signature` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.apple_pay_session(Value::Noval).create(jo(vec![
    ("account_id", Value::Num(1.0)),  // i64
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ApplePaySessionEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DynamicDescriptorEntity

```rust
let dynamic_descriptor = client.dynamic_descriptor(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `String` | No |  |
| `descriptor` | `String` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `state` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.dynamic_descriptor(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.dynamic_descriptor(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for dynamic_descriptor in items.borrow().iter() {
        println!("{:?}", dynamic_descriptor);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.dynamic_descriptor(Value::Noval).load(jo(vec![("id", Value::str("dynamic_descriptor_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.dynamic_descriptor(Value::Noval).remove(jo(vec![("id", Value::str("dynamic_descriptor_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.dynamic_descriptor(Value::Noval).update(jo(vec![
    ("id", Value::str("dynamic_descriptor_id")),
    ("account_id", Value::str("account_id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DynamicDescriptorEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## IFrameCreateInstanceEntity

```rust
let i_frame_create_instance = client.i_frame_create_instance(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String` | No |  |
| `currency` | `String` | No |  |
| `customer` | `std::collections::HashMap<String, Value>` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `reference` | `String` | No |  |
| `timeout` | `f64` | No |  |
| `token` | `Vec<Value>` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.i_frame_create_instance(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
    ("payment_iframe_id", Value::str("example_payment_iframe_id")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `IFrameCreateInstanceEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## IFrameInstanceEntity

```rust
let i_frame_instance = client.i_frame_instance(Value::Noval);
```

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.i_frame_instance(Value::Noval).load(jo(vec![("id", Value::str("i_frame_instance_id")), ("account_id", Value::str("account_id")), ("payment_iframe_id", Value::str("payment_iframe_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `IFrameInstanceEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## IframeEntity

```rust
let iframe = client.iframe(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `std::collections::HashMap<String, Value>` | No |  |
| `allowed_parent_domain` | `Vec<Value>` | Yes |  |
| `allowed_payment_method` | `Vec<Value>` | Yes |  |
| `card_setting` | `std::collections::HashMap<String, Value>` | No |  |
| `click_to_pay_setting` | `std::collections::HashMap<String, Value>` | No |  |
| `currency` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `timeout` | `f64` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.iframe(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.iframe(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for iframe in items.borrow().iter() {
        println!("{:?}", iframe);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.iframe(Value::Noval).load(jo(vec![("account_id", Value::str("account_id")), ("iframe_id", Value::str("iframe_id"))]), Value::Noval).unwrap();
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.iframe(Value::Noval).update(jo(vec![
    ("account_id", Value::str("account_id")),
    ("iframe_id", Value::str("iframe_id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `IframeEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## InitEntity

```rust
let init = client.init(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `std::collections::HashMap<String, Value>` | No |  |
| `description` | `String` | No |  |
| `item` | `Vec<Value>` | No |  |
| `level2` | `std::collections::HashMap<String, Value>` | No |  |
| `level3` | `std::collections::HashMap<String, Value>` | No |  |
| `shipping_address` | `std::collections::HashMap<String, Value>` | Yes |  |
| `trace` | `std::collections::HashMap<String, Value>` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.init(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `InitEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```rust
let list_api_key_scopes_entry = client.list_api_key_scopes_entry(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `description` | `String` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `i64` | No |  |
| `scope` | `String` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.list_api_key_scopes_entry(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for list_api_key_scopes_entry in items.borrow().iter() {
        println!("{:?}", list_api_key_scopes_entry);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ListApiKeyScopesEntryEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## PaymentIframeEntity

```rust
let payment_iframe = client.payment_iframe(Value::Noval);
```

### Operations

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.payment_iframe(Value::Noval).remove(jo(vec![("account_id", Value::str("account_id")), ("id", Value::str("id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `PaymentIframeEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ThreeDSecureAuthEntity

```rust
let three_d_secure_auth = client.three_d_secure_auth(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `std::collections::HashMap<String, Value>` | Yes |  |
| `card` | `std::collections::HashMap<String, Value>` | Yes |  |
| `challenge` | `std::collections::HashMap<String, Value>` | No |  |
| `customer` | `std::collections::HashMap<String, Value>` | No |  |
| `purchase` | `std::collections::HashMap<String, Value>` | Yes |  |
| `server_transaction_id` | `String` | No |  |
| `shipping` | `std::collections::HashMap<String, Value>` | Yes |  |
| `status` | `String` | No |  |
| `three_d_secure_challenge_indicator` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |
| `trace` | `std::collections::HashMap<String, Value>` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.three_d_secure_auth(Value::Noval).create(jo(vec![
    ("3_d_id", Value::str("example_3_d_id")),  // String
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ThreeDSecureAuthEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```rust
let three_d_secure_browser_init = client.three_d_secure_browser_init(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `String` | No |  |
| `acs_url` | `String` | No |  |
| `cvv` | `String` | No |  |
| `expiry` | `String` | Yes |  |
| `pan` | `String` | Yes |  |
| `payment_details_reference` | `String` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure_data` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.three_d_secure_browser_init(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ThreeDSecureStatusEntity

```rust
let three_d_secure_status = client.three_d_secure_status(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `std::collections::HashMap<String, Value>` | No |  |
| `info` | `std::collections::HashMap<String, Value>` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure` | `std::collections::HashMap<String, Value>` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.three_d_secure_status(Value::Noval).load(jo(vec![("3_d_id", Value::str("3_d_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ThreeDSecureStatusEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## TransactionDetailEntity

```rust
let transaction_detail = client.transaction_detail(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `std::collections::HashMap<String, Value>` | Yes |  |
| `auth` | `std::collections::HashMap<String, Value>` | Yes |  |
| `card` | `std::collections::HashMap<String, Value>` | No |  |
| `customer` | `std::collections::HashMap<String, Value>` | No |  |
| `description` | `String` | No |  |
| `id` | `String` | No |  |
| `item` | `Vec<Value>` | No |  |
| `level2` | `std::collections::HashMap<String, Value>` | No |  |
| `level3` | `std::collections::HashMap<String, Value>` | No |  |
| `override` | `std::collections::HashMap<String, Value>` | No |  |
| `shipping_address` | `std::collections::HashMap<String, Value>` | Yes |  |
| `status` | `String` | Yes |  |
| `timestamp` | `String` | No |  |
| `trace` | `std::collections::HashMap<String, Value>` | No |  |

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

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.transaction_detail(Value::Noval).load(jo(vec![("account_id", Value::str("account_id")), ("transaction_id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.transaction_detail(Value::Noval).update(jo(vec![
    ("account_id", Value::str("account_id")),
    ("transaction_id", Value::str("transaction_id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `TransactionDetailEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## WebhookEntity

```rust
let webhook = client.webhook(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String` | Yes |  |
| `id` | `String` | No |  |
| `url` | `String` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.webhook(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.webhook(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for webhook in items.borrow().iter() {
        println!("{:?}", webhook);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.webhook(Value::Noval).load(jo(vec![("id", Value::str("webhook_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.webhook(Value::Noval).remove(jo(vec![("id", Value::str("webhook_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.webhook(Value::Noval).update(jo(vec![
    ("id", Value::str("webhook_id")),
    ("account_id", Value::str("account_id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `WebhookEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```rust
let client = BluefinPayconexSDK::new(jo(vec![
    ("feature", jo(vec![
        ("test", jo(vec![("active", Value::Bool(true))])),
    ])),
]));
```

