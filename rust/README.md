# BluefinPayconex Rust SDK



The Rust SDK for the BluefinPayconex API — an entity-oriented client following idiomatic Rust conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.account_updater(Value::Noval)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This crate is not yet published to crates.io. Depend on it from the GitHub
release tag (`rust/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) or
from a source checkout by adding it to your `Cargo.toml`:

```toml
[dependencies]
# From a source checkout:
voxgig-bluefin-payconex-sdk = { path = "../rust" }

# Or from the git release tag:
# voxgig-bluefin-payconex-sdk = { git = "<repo-url>", tag = "rust/vX.Y.Z" }
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```rust
use bluefin_payconex_sdk::{getp, jo, BluefinPayconexSDK, Value};

let client = BluefinPayconexSDK::new(jo(vec![
    ("apikey", Value::str(std::env::var("BLUEFIN_PAYCONEX_APIKEY").unwrap_or_default())),
]));
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record and returns `Err` on failure.

```rust
match client.account_updater_subscription_with_result(Value::Noval).load(jo(vec![("account_id", Value::str("example_account_id")), ("subscription_id", Value::str("example_subscription_id"))]), Value::Noval) {
    Ok(account_updater_subscription_with_result) => println!("{:?}", account_updater_subscription_with_result),
    Err(err) => eprintln!("load failed: {}", err),
}
```

### 4. Create, update, and remove

```rust
// Remove
client.account_updater(Value::Noval).remove(jo(vec![("account_id", Value::str("example_account_id")), ("subscription_id", Value::str("example_subscription_id"))]), Value::Noval).unwrap();
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

```rust
let result = client.direct(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("GET")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

if getp(&result, "ok") == Value::Bool(true) {
    println!("{:?}", getp(&result, "status"));  // 200
    println!("{:?}", getp(&result, "data"));    // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    println!("{:?} {:?}", getp(&result, "status"), getp(&result, "err"));
}
```

### Prepare a request without sending it

```rust
// prepare() returns the fetch definition on Ok and Err on failure.
let fetchdef = client.prepare(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("DELETE")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

println!("{:?}", getp(&fetchdef, "url"));
println!("{:?}", getp(&fetchdef, "method"));
println!("{:?}", getp(&fetchdef, "headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```rust
let client = test_sdk(Value::Noval, Value::Noval);

// Entity ops return the bare record on Ok and Err on failure.
let three_d_secure_status = client.three_d_secure_status(Value::Noval).load(Value::Noval, Value::Noval).unwrap();
// three_d_secure_status contains the mock response record
```

### Point at a different server

Override the base URL to reach a local or staging server:

```rust
let client = BluefinPayconexSDK::new(jo(vec![
    ("base", Value::str("http://localhost:8080")),
]));
```

### Run live tests

Create a `.env.local` file at the crate root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd rust && cargo test
```


## Reference

### BluefinPayconexSDK

```rust
use bluefin_payconex_sdk::{BluefinPayconexSDK, Value};

let client = BluefinPayconexSDK::new(options);
```

Creates a new SDK client. `options` is a `Value` map (`Value::Noval` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```rust
use bluefin_payconex_sdk::{test_sdk, Value};

let client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::Noval`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Value` | Deep copy of the current SDK options. |
| `get_utility` | `() -> Rc<Utility>` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) -> Result<Value, BluefinPayconexError>` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) -> Result<Value, BluefinPayconexError>` | Build and send an HTTP request. `Ok` is a result map (branch on `ok`). |
| `account_updater` | `(entopts: Value) -> Rc<AccountUpdaterEntity>` | Create an AccountUpdater entity instance. |
| `account_updater_schedule` | `(entopts: Value) -> Rc<AccountUpdaterScheduleEntity>` | Create an AccountUpdaterSchedule entity instance. |
| `account_updater_schedule_with_result` | `(entopts: Value) -> Rc<AccountUpdaterScheduleWithResultEntity>` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `account_updater_subscription_with_result` | `(entopts: Value) -> Rc<AccountUpdaterSubscriptionWithResultEntity>` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `account_updater_update` | `(entopts: Value) -> Rc<AccountUpdaterUpdateEntity>` | Create an AccountUpdaterUpdate entity instance. |
| `api_key` | `(entopts: Value) -> Rc<ApiKeyEntity>` | Create an ApiKey entity instance. |
| `apple_pay_merchant_detail` | `(entopts: Value) -> Rc<ApplePayMerchantDetailEntity>` | Create an ApplePayMerchantDetail entity instance. |
| `apple_pay_session` | `(entopts: Value) -> Rc<ApplePaySessionEntity>` | Create an ApplePaySession entity instance. |
| `dynamic_descriptor` | `(entopts: Value) -> Rc<DynamicDescriptorEntity>` | Create a DynamicDescriptor entity instance. |
| `i_frame_create_instance` | `(entopts: Value) -> Rc<IFrameCreateInstanceEntity>` | Create an IFrameCreateInstance entity instance. |
| `i_frame_instance` | `(entopts: Value) -> Rc<IFrameInstanceEntity>` | Create an IFrameInstance entity instance. |
| `iframe` | `(entopts: Value) -> Rc<IframeEntity>` | Create an Iframe entity instance. |
| `init` | `(entopts: Value) -> Rc<InitEntity>` | Create an Init entity instance. |
| `list_api_key_scopes_entry` | `(entopts: Value) -> Rc<ListApiKeyScopesEntryEntity>` | Create a ListApiKeyScopesEntry entity instance. |
| `payment_iframe` | `(entopts: Value) -> Rc<PaymentIframeEntity>` | Create a PaymentIframe entity instance. |
| `three_d_secure_auth` | `(entopts: Value) -> Rc<ThreeDSecureAuthEntity>` | Create a ThreeDSecureAuth entity instance. |
| `three_d_secure_browser_init` | `(entopts: Value) -> Rc<ThreeDSecureBrowserInitEntity>` | Create a ThreeDSecureBrowserInit entity instance. |
| `three_d_secure_status` | `(entopts: Value) -> Rc<ThreeDSecureStatusEntity>` | Create a ThreeDSecureStatus entity instance. |
| `transaction_detail` | `(entopts: Value) -> Rc<TransactionDetailEntity>` | Create a TransactionDetail entity instance. |
| `webhook` | `(entopts: Value) -> Rc<WebhookEntity>` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>` | List entities matching the criteria (Ok is a `Value::List`). |
| `create` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinPayconexError>` | Remove an entity. |
| `data` | `(args: Option<&Value>) -> Value` | Get entity data (pass `Some(&map)` to set). |
| `matchv` | `(args: Option<&Value>) -> Value` | Get entity match criteria (pass `Some(&map)` to set). |
| `make` | `() -> Rc<dyn Entity>` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `Result<Value, BluefinPayconexError>` — the
bare result data on `Ok` (a `Value::Map` for single-entity ops, a
`Value::List` for `list`) and the branded error on `Err`.

The `direct()` escape hatch resolves to `Ok` even on a non-2xx response —
it returns a result `Value::Map` you branch on via `getp(&result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Create an instance: `let account_updater = client.account_updater(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `let account_updater_schedule = client.account_updater_schedule(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `Vec<Value>` |  |

#### Example: Create

```rust
let account_updater_schedule = client.account_updater_schedule(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### AccountUpdaterScheduleWithResult

Create an instance: `let account_updater_schedule_with_result = client.account_updater_schedule_with_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `Vec<Value>` |  |
| `created_at` | `String` |  |
| `enabled` | `bool` |  |
| `expiry` | `String` |  |
| `id` | `String` |  |
| `most_recent_update` | `std::collections::HashMap<String, Value>` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `Vec<Value>` |  |
| `type` | `String` |  |
| `updated_at` | `String` |  |

#### Example: List

```rust
let account_updater_schedule_with_results = client.account_updater_schedule_with_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let account_updater_schedule_with_result = client.account_updater_schedule_with_result(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `let account_updater_subscription_with_result = client.account_updater_subscription_with_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `String` |  |
| `enabled` | `bool` |  |
| `id` | `String` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `record` | `Vec<Value>` |  |
| `response_format` | `String` |  |
| `template_ref` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```rust
let account_updater_subscription_with_result = client.account_updater_subscription_with_result(Value::Noval).load(jo(vec![("account_id", Value::str("account_id")), ("subscription_id", Value::str("subscription_id"))]), Value::Noval).unwrap();
```

#### Example: Create

```rust
let account_updater_subscription_with_result = client.account_updater_subscription_with_result(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
    ("subscription_id", Value::str("example_subscription_id")),  // String
]), Value::Noval).unwrap();
```


### AccountUpdaterUpdate

Create an instance: `let account_updater_update = client.account_updater_update(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `String` |  |
| `format` | `String` |  |
| `id` | `String` |  |
| `new_expiry` | `String` |  |
| `new_token` | `String` |  |
| `old_expiry` | `String` |  |
| `old_token` | `String` |  |
| `recurring_schedule` | `Vec<Value>` |  |
| `status` | `String` |  |
| `update_id` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```rust
let account_updater_update = client.account_updater_update(Value::Noval).load(jo(vec![("id", Value::str("account_updater_update_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```


### ApiKey

Create an instance: `let api_key = client.api_key(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `Vec<Value>` |  |
| `enabled` | `bool` |  |
| `expires_at` | `String` |  |
| `expires_in` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `method` | `Vec<Value>` |  |
| `scope` | `Vec<Value>` |  |
| `secret` | `String` |  |

#### Example: Load

```rust
let api_key = client.api_key(Value::Noval).load(jo(vec![("id", Value::str("api_key_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let api_keys = client.api_key(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let api_key = client.api_key(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### ApplePayMerchantDetail

Create an instance: `let apple_pay_merchant_detail = client.apple_pay_merchant_detail(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `Vec<Value>` |  |
| `merchant_url` | `String` |  |
| `partner_merchant_name` | `String` |  |
| `payconex_account_id` | `String` |  |

#### Example: List

```rust
let apple_pay_merchant_details = client.apple_pay_merchant_detail(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let apple_pay_merchant_detail = client.apple_pay_merchant_detail(Value::Noval).create(jo(vec![
    ("account_id", Value::Num(1.0)),  // i64
]), Value::Noval).unwrap();
```


### ApplePaySession

Create an instance: `let apple_pay_session = client.apple_pay_session(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `String` |  |
| `domain_name` | `String` |  |
| `epoch_timestamp` | `i64` |  |
| `expires_at` | `i64` |  |
| `merchant_identifier` | `String` |  |
| `merchant_session_identifier` | `String` |  |
| `nonce` | `i64` |  |
| `operational_analytics_identifier` | `String` |  |
| `referrer` | `String` |  |
| `retry` | `i64` |  |
| `signature` | `String` |  |

#### Example: Create

```rust
let apple_pay_session = client.apple_pay_session(Value::Noval).create(jo(vec![
    ("account_id", Value::Num(1.0)),  // i64
]), Value::Noval).unwrap();
```


### DynamicDescriptor

Create an instance: `let dynamic_descriptor = client.dynamic_descriptor(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `String` |  |
| `descriptor` | `String` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `state` | `String` |  |

#### Example: Load

```rust
let dynamic_descriptor = client.dynamic_descriptor(Value::Noval).load(jo(vec![("id", Value::str("dynamic_descriptor_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let dynamic_descriptors = client.dynamic_descriptor(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let dynamic_descriptor = client.dynamic_descriptor(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### IFrameCreateInstance

Create an instance: `let i_frame_create_instance = client.i_frame_create_instance(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `String` |  |
| `currency` | `String` |  |
| `customer` | `std::collections::HashMap<String, Value>` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `reference` | `String` |  |
| `timeout` | `f64` |  |
| `token` | `Vec<Value>` |  |

#### Example: Create

```rust
let i_frame_create_instance = client.i_frame_create_instance(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
    ("payment_iframe_id", Value::str("example_payment_iframe_id")),  // String
]), Value::Noval).unwrap();
```


### IFrameInstance

Create an instance: `let i_frame_instance = client.i_frame_instance(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```rust
let i_frame_instance = client.i_frame_instance(Value::Noval).load(jo(vec![("id", Value::str("i_frame_instance_id")), ("account_id", Value::str("account_id")), ("payment_iframe_id", Value::str("payment_iframe_id"))]), Value::Noval).unwrap();
```


### Iframe

Create an instance: `let iframe = client.iframe(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `std::collections::HashMap<String, Value>` |  |
| `allowed_parent_domain` | `Vec<Value>` |  |
| `allowed_payment_method` | `Vec<Value>` |  |
| `card_setting` | `std::collections::HashMap<String, Value>` |  |
| `click_to_pay_setting` | `std::collections::HashMap<String, Value>` |  |
| `currency` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `timeout` | `f64` |  |

#### Example: Load

```rust
let iframe = client.iframe(Value::Noval).load(jo(vec![("account_id", Value::str("account_id")), ("iframe_id", Value::str("iframe_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let iframes = client.iframe(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let iframe = client.iframe(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### Init

Create an instance: `let init = client.init(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `std::collections::HashMap<String, Value>` |  |
| `description` | `String` |  |
| `item` | `Vec<Value>` |  |
| `level2` | `std::collections::HashMap<String, Value>` |  |
| `level3` | `std::collections::HashMap<String, Value>` |  |
| `shipping_address` | `std::collections::HashMap<String, Value>` |  |
| `trace` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let init = client.init(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### ListApiKeyScopesEntry

Create an instance: `let list_api_key_scopes_entry = client.list_api_key_scopes_entry(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `String` |  |
| `description` | `String` |  |
| `enabled` | `bool` |  |
| `level` | `i64` |  |
| `scope` | `String` |  |

#### Example: List

```rust
let list_api_key_scopes_entrys = client.list_api_key_scopes_entry(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### PaymentIframe

Create an instance: `let payment_iframe = client.payment_iframe(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `let three_d_secure_auth = client.three_d_secure_auth(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `std::collections::HashMap<String, Value>` |  |
| `card` | `std::collections::HashMap<String, Value>` |  |
| `challenge` | `std::collections::HashMap<String, Value>` |  |
| `customer` | `std::collections::HashMap<String, Value>` |  |
| `purchase` | `std::collections::HashMap<String, Value>` |  |
| `server_transaction_id` | `String` |  |
| `shipping` | `std::collections::HashMap<String, Value>` |  |
| `status` | `String` |  |
| `three_d_secure_challenge_indicator` | `String` |  |
| `three_d_secure_id` | `String` |  |
| `trace` | `std::collections::HashMap<String, Value>` |  |

#### Example: Create

```rust
let three_d_secure_auth = client.three_d_secure_auth(Value::Noval).create(jo(vec![
    ("3_d_id", Value::str("example_3_d_id")),  // String
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### ThreeDSecureBrowserInit

Create an instance: `let three_d_secure_browser_init = client.three_d_secure_browser_init(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `String` |  |
| `acs_url` | `String` |  |
| `cvv` | `String` |  |
| `expiry` | `String` |  |
| `pan` | `String` |  |
| `payment_details_reference` | `String` |  |
| `server_transaction_id` | `String` |  |
| `status` | `String` |  |
| `three_d_secure_data` | `String` |  |
| `three_d_secure_id` | `String` |  |

#### Example: Create

```rust
let three_d_secure_browser_init = client.three_d_secure_browser_init(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
```


### ThreeDSecureStatus

Create an instance: `let three_d_secure_status = client.three_d_secure_status(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `std::collections::HashMap<String, Value>` |  |
| `info` | `std::collections::HashMap<String, Value>` |  |
| `server_transaction_id` | `String` |  |
| `status` | `String` |  |
| `three_d_secure` | `std::collections::HashMap<String, Value>` |  |
| `three_d_secure_id` | `String` |  |

#### Example: Load

```rust
let three_d_secure_status = client.three_d_secure_status(Value::Noval).load(jo(vec![("3_d_id", Value::str("3_d_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```


### TransactionDetail

Create an instance: `let transaction_detail = client.transaction_detail(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `std::collections::HashMap<String, Value>` |  |
| `auth` | `std::collections::HashMap<String, Value>` |  |
| `card` | `std::collections::HashMap<String, Value>` |  |
| `customer` | `std::collections::HashMap<String, Value>` |  |
| `description` | `String` |  |
| `id` | `String` |  |
| `item` | `Vec<Value>` |  |
| `level2` | `std::collections::HashMap<String, Value>` |  |
| `level3` | `std::collections::HashMap<String, Value>` |  |
| `override` | `std::collections::HashMap<String, Value>` |  |
| `shipping_address` | `std::collections::HashMap<String, Value>` |  |
| `status` | `String` |  |
| `timestamp` | `String` |  |
| `trace` | `std::collections::HashMap<String, Value>` |  |

#### Example: Load

```rust
let transaction_detail = client.transaction_detail(Value::Noval).load(jo(vec![("account_id", Value::str("account_id")), ("transaction_id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```


### Webhook

Create an instance: `let webhook = client.webhook(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `String` |  |
| `id` | `String` |  |
| `url` | `String` |  |

#### Example: Load

```rust
let webhook = client.webhook(Value::Noval).load(jo(vec![("id", Value::str("webhook_id")), ("account_id", Value::str("account_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let webhooks = client.webhook(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let webhook = client.webhook(Value::Noval).create(jo(vec![
    ("account_id", Value::str("example_account_id")),  // String
]), Value::Noval).unwrap();
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

The Rust SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port (a
JSON-shaped enum: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Crate structure

```
rust/
├── lib.rs                       -- Crate root (module decls + re-exports)
├── core/                        -- Pipeline types, config, client (sdk.rs)
├── entity/                      -- Per-entity clients (one module each)
├── feature/                     -- Built-in features (base, test, log)
└── utility/                     -- Utilities + the vendored voxgig struct port
```

The public API is re-exported from the crate root, so `use bluefin_payconex_sdk::{...}`
reaches the SDK client, `Value`, and the `jo` / `ja` / `getp` helpers
directly. Import entity or utility modules only when needed.

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
