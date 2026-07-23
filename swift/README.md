# BluefinPayconex Swift SDK



The Swift SDK for the BluefinPayconex API — an entity-oriented client following idiomatic Swift conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.AccountUpdater()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to a SwiftPM registry. The generated SDK
is a dependency-free SwiftPM package (Foundation only, plus the vendored
Voxgig Struct port). Depend on it from the GitHub release tag
(`swift/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) by adding it to
your `Package.swift`:

```swift
dependencies: [
    // From the git release tag:
    .package(url: "<repo-url>", exact: "0.0.1"),
],
```

Or build from a source checkout with SwiftPM:

```bash
cd swift && swift build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```swift
import BluefinPayconexSdk

let options = VMap()
options.entries["apikey"] = .string(
    ProcessInfo.processInfo.environment["BLUEFIN_PAYCONEX_APIKEY"] ?? "")
let client = BluefinPayconexSDK(options)
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record (a `Value`) and throws on error.

```swift
do {
    let accountUpdaterSubscriptionWithResult = try client.AccountUpdaterSubscriptionWithResult().load(VMap([("account_id", .string("example_account_id")), ("subscription_id", .string("example_subscription_id"))]), nil)
    print(accountUpdaterSubscriptionWithResult)
}
catch {
    print("load failed: \(error)")
}
```

### 4. Create, update, and remove

```swift
// Remove
_ = try client.AccountUpdater().remove(VMap([("account_id", .string("example_account_id")), ("subscription_id", .string("example_subscription_id"))]), nil)
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

```swift
let result = client.direct(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("GET")),
    ("params", .map([("id", .string("example"))])),
]))

if result.entries["ok"] == .bool(true) {
    print(result.entries["status"] ?? .noval)  // 200
    print(result.entries["data"] ?? .noval)     // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as .noval.
    print(result.entries["status"] ?? .noval, result.entries["err"] ?? .noval)
}
```

### Prepare a request without sending it

```swift
// prepare() returns the fetch definition and throws on error.
let fetchdef = try client.prepare(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("DELETE")),
    ("params", .map([("id", .string("example"))])),
]))

print(fetchdef.entries["url"] ?? .noval)
print(fetchdef.entries["method"] ?? .noval)
print(fetchdef.entries["headers"] ?? .noval)
```

### Use test mode

Create a mock client for unit testing — no server required:

```swift
let client = BluefinPayconexSDK.testSDK(nil, nil)

// Entity ops return the bare record and throw on error.
let threeDSecureStatus = try client.ThreeDSecureStatus().load(nil, nil)
// threeDSecureStatus holds the mock response record
print(threeDSecureStatus)
```

### Use a custom fetch function

Replace the HTTP transport with your own `SystemFetch` closure:

```swift
let fetch: SystemFetch = { url, _ in
    let m = VMap()
    m.entries["status"] = .int(200)
    m.entries["statusText"] = .string("OK")
    m.entries["headers"] = .map(VMap())
    m.entries["json"] = .nat({ () -> Value in .map(VMap([("id", .string("mock01"))])) } as NativeCall0)
    return .map(m)
}

let system = VMap()
system.entries["fetch"] = .nat(fetch)
let options = VMap()
options.entries["base"] = .string("http://localhost:8080")
options.entries["system"] = .map(system)
let client = BluefinPayconexSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd swift && make test
```


## Reference

### BluefinPayconexSDK

```swift
let client = BluefinPayconexSDK(options)
```

Creates a new SDK client. `options` is a `VMap` of `Value`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `VMap` | Feature activation flags. |
| `extend` | `VList` | Additional Feature instances to load. |
| `system` | `VMap` | System overrides (e.g. custom `fetch` function). |

### testSDK

```swift
let client = BluefinPayconexSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> VMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) throws -> VMap` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> VMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `AccountUpdater` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdater entity instance. |
| `AccountUpdaterSchedule` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterSchedule entity instance. |
| `AccountUpdaterScheduleWithResult` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `AccountUpdaterSubscriptionWithResult` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `AccountUpdaterUpdate` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterUpdate entity instance. |
| `ApiKey` | `(entopts) -> BluefinPayconexEntityBase` | Create an ApiKey entity instance. |
| `ApplePayMerchantDetail` | `(entopts) -> BluefinPayconexEntityBase` | Create an ApplePayMerchantDetail entity instance. |
| `ApplePaySession` | `(entopts) -> BluefinPayconexEntityBase` | Create an ApplePaySession entity instance. |
| `DynamicDescriptor` | `(entopts) -> BluefinPayconexEntityBase` | Create a DynamicDescriptor entity instance. |
| `IFrameCreateInstance` | `(entopts) -> BluefinPayconexEntityBase` | Create an IFrameCreateInstance entity instance. |
| `IFrameInstance` | `(entopts) -> BluefinPayconexEntityBase` | Create an IFrameInstance entity instance. |
| `Iframe` | `(entopts) -> BluefinPayconexEntityBase` | Create an Iframe entity instance. |
| `Init` | `(entopts) -> BluefinPayconexEntityBase` | Create an Init entity instance. |
| `ListApiKeyScopesEntry` | `(entopts) -> BluefinPayconexEntityBase` | Create a ListApiKeyScopesEntry entity instance. |
| `PaymentIframe` | `(entopts) -> BluefinPayconexEntityBase` | Create a PaymentIframe entity instance. |
| `ThreeDSecureAuth` | `(entopts) -> BluefinPayconexEntityBase` | Create a ThreeDSecureAuth entity instance. |
| `ThreeDSecureBrowserInit` | `(entopts) -> BluefinPayconexEntityBase` | Create a ThreeDSecureBrowserInit entity instance. |
| `ThreeDSecureStatus` | `(entopts) -> BluefinPayconexEntityBase` | Create a ThreeDSecureStatus entity instance. |
| `TransactionDetail` | `(entopts) -> BluefinPayconexEntityBase` | Create a TransactionDetail entity instance. |
| `Webhook` | `(entopts) -> BluefinPayconexEntityBase` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) throws -> Value` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, ctrl) throws -> Value` | List entities matching the criteria (a Value list). Throws on error. |
| `create` | `(reqdata, ctrl) throws -> Value` | Create a new entity. Throws on error. |
| `update` | `(reqdata, ctrl) throws -> Value` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, ctrl) throws -> Value` | Remove an entity. Throws on error. |
| `data` | `(newdata?) -> Value` | Get or set entity data. |
| `matchv` | `(newmatch?) -> Value` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Value` map for
single-entity ops, a `Value` list for `list`) and throw on error. Wrap
calls in `do`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `VMap` you
branch on via `result.entries["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `VMap` | Response headers. |
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

Create an instance: `let accountUpdater = client.AccountUpdater()`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match, nil)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `let accountUpdaterSchedule = client.AccountUpdaterSchedule()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `Bool` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `[Value]` |  |

#### Example: Create

```swift
let accountUpdaterSchedule = try client.AccountUpdaterSchedule().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### AccountUpdaterScheduleWithResult

Create an instance: `let accountUpdaterScheduleWithResult = client.AccountUpdaterScheduleWithResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `[Value]` |  |
| `created_at` | `String` |  |
| `enabled` | `Bool` |  |
| `expiry` | `String` |  |
| `id` | `String` |  |
| `most_recent_update` | `VMap` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `[Value]` |  |
| `type` | `String` |  |
| `updated_at` | `String` |  |

#### Example: List

```swift
let accountUpdaterScheduleWithResultList = try client.AccountUpdaterScheduleWithResult().list(nil, nil)
```

#### Example: Create

```swift
let accountUpdaterScheduleWithResult = try client.AccountUpdaterScheduleWithResult().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `let accountUpdaterSubscriptionWithResult = client.AccountUpdaterSubscriptionWithResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `String` |  |
| `enabled` | `Bool` |  |
| `id` | `String` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `record` | `[Value]` |  |
| `response_format` | `String` |  |
| `template_ref` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```swift
let accountUpdaterSubscriptionWithResult = try client.AccountUpdaterSubscriptionWithResult().load(VMap([("account_id", .string("account_id")), ("subscription_id", .string("subscription_id"))]), nil)
```

#### Example: Create

```swift
let accountUpdaterSubscriptionWithResult = try client.AccountUpdaterSubscriptionWithResult().create(VMap([
    ("account_id", .string("example_account_id")),  // String
    ("subscription_id", .string("example_subscription_id"))  // String
]), nil)
```


### AccountUpdaterUpdate

Create an instance: `let accountUpdaterUpdate = client.AccountUpdaterUpdate()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

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
| `recurring_schedule` | `[Value]` |  |
| `status` | `String` |  |
| `update_id` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```swift
let accountUpdaterUpdate = try client.AccountUpdaterUpdate().load(VMap([("id", .string("account_updater_update_id")), ("account_id", .string("account_id"))]), nil)
```


### ApiKey

Create an instance: `let apiKey = client.ApiKey()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `[Value]` |  |
| `enabled` | `Bool` |  |
| `expires_at` | `String` |  |
| `expires_in` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `method` | `[Value]` |  |
| `scope` | `[Value]` |  |
| `secret` | `String` |  |

#### Example: Load

```swift
let apiKey = try client.ApiKey().load(VMap([("id", .string("api_key_id")), ("account_id", .string("account_id"))]), nil)
```

#### Example: List

```swift
let apiKeyList = try client.ApiKey().list(nil, nil)
```

#### Example: Create

```swift
let apiKey = try client.ApiKey().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### ApplePayMerchantDetail

Create an instance: `let applePayMerchantDetail = client.ApplePayMerchantDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `[Value]` |  |
| `merchant_url` | `String` |  |
| `partner_merchant_name` | `String` |  |
| `payconex_account_id` | `String` |  |

#### Example: List

```swift
let applePayMerchantDetailList = try client.ApplePayMerchantDetail().list(nil, nil)
```

#### Example: Create

```swift
let applePayMerchantDetail = try client.ApplePayMerchantDetail().create(VMap([
    ("account_id", .int(1))  // Int
]), nil)
```


### ApplePaySession

Create an instance: `let applePaySession = client.ApplePaySession()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `String` |  |
| `domain_name` | `String` |  |
| `epoch_timestamp` | `Int` |  |
| `expires_at` | `Int` |  |
| `merchant_identifier` | `String` |  |
| `merchant_session_identifier` | `String` |  |
| `nonce` | `Int` |  |
| `operational_analytics_identifier` | `String` |  |
| `referrer` | `String` |  |
| `retry` | `Int` |  |
| `signature` | `String` |  |

#### Example: Create

```swift
let applePaySession = try client.ApplePaySession().create(VMap([
    ("account_id", .int(1))  // Int
]), nil)
```


### DynamicDescriptor

Create an instance: `let dynamicDescriptor = client.DynamicDescriptor()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `String` |  |
| `descriptor` | `String` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `state` | `String` |  |

#### Example: Load

```swift
let dynamicDescriptor = try client.DynamicDescriptor().load(VMap([("id", .string("dynamic_descriptor_id")), ("account_id", .string("account_id"))]), nil)
```

#### Example: List

```swift
let dynamicDescriptorList = try client.DynamicDescriptor().list(nil, nil)
```

#### Example: Create

```swift
let dynamicDescriptor = try client.DynamicDescriptor().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### IFrameCreateInstance

Create an instance: `let iFrameCreateInstance = client.IFrameCreateInstance()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `String` |  |
| `currency` | `String` |  |
| `customer` | `VMap` |  |
| `initialize_transaction` | `Bool` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `reference` | `String` |  |
| `timeout` | `Double` |  |
| `token` | `[Value]` |  |

#### Example: Create

```swift
let iFrameCreateInstance = try client.IFrameCreateInstance().create(VMap([
    ("account_id", .string("example_account_id")),  // String
    ("payment_iframe_id", .string("example_payment_iframe_id"))  // String
]), nil)
```


### IFrameInstance

Create an instance: `let iFrameInstance = client.IFrameInstance()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Example: Load

```swift
let iFrameInstance = try client.IFrameInstance().load(VMap([("id", .string("i_frame_instance_id")), ("account_id", .string("account_id")), ("payment_iframe_id", .string("payment_iframe_id"))]), nil)
```


### Iframe

Create an instance: `let iframe = client.Iframe()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `VMap` |  |
| `allowed_parent_domain` | `[Value]` |  |
| `allowed_payment_method` | `[Value]` |  |
| `card_setting` | `VMap` |  |
| `click_to_pay_setting` | `VMap` |  |
| `currency` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `timeout` | `Double` |  |

#### Example: Load

```swift
let iframe = try client.Iframe().load(VMap([("account_id", .string("account_id")), ("iframe_id", .string("iframe_id"))]), nil)
```

#### Example: List

```swift
let iframeList = try client.Iframe().list(nil, nil)
```

#### Example: Create

```swift
let iframe = try client.Iframe().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### Init

Create an instance: `let init_ = client.Init()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `VMap` |  |
| `description` | `String` |  |
| `item` | `[Value]` |  |
| `level2` | `VMap` |  |
| `level3` | `VMap` |  |
| `shipping_address` | `VMap` |  |
| `trace` | `VMap` |  |

#### Example: Create

```swift
let init_ = try client.Init().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### ListApiKeyScopesEntry

Create an instance: `let listApiKeyScopesEntry = client.ListApiKeyScopesEntry()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `String` |  |
| `description` | `String` |  |
| `enabled` | `Bool` |  |
| `level` | `Int` |  |
| `scope` | `String` |  |

#### Example: List

```swift
let listApiKeyScopesEntryList = try client.ListApiKeyScopesEntry().list(nil, nil)
```


### PaymentIframe

Create an instance: `let paymentIframe = client.PaymentIframe()`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match, nil)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `let threeDSecureAuth = client.ThreeDSecureAuth()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `VMap` |  |
| `card` | `VMap` |  |
| `challenge` | `VMap` |  |
| `customer` | `VMap` |  |
| `purchase` | `VMap` |  |
| `server_transaction_id` | `String` |  |
| `shipping` | `VMap` |  |
| `status` | `String` |  |
| `three_d_secure_challenge_indicator` | `String` |  |
| `three_d_secure_id` | `String` |  |
| `trace` | `VMap` |  |

#### Example: Create

```swift
let threeDSecureAuth = try client.ThreeDSecureAuth().create(VMap([
    ("3_d_id", .string("example_3_d_id")),  // String
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### ThreeDSecureBrowserInit

Create an instance: `let threeDSecureBrowserInit = client.ThreeDSecureBrowserInit()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

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

```swift
let threeDSecureBrowserInit = try client.ThreeDSecureBrowserInit().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```


### ThreeDSecureStatus

Create an instance: `let threeDSecureStatus = client.ThreeDSecureStatus()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `VMap` |  |
| `info` | `VMap` |  |
| `server_transaction_id` | `String` |  |
| `status` | `String` |  |
| `three_d_secure` | `VMap` |  |
| `three_d_secure_id` | `String` |  |

#### Example: Load

```swift
let threeDSecureStatus = try client.ThreeDSecureStatus().load(VMap([("3_d_id", .string("3_d_id")), ("account_id", .string("account_id"))]), nil)
```


### TransactionDetail

Create an instance: `let transactionDetail = client.TransactionDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `VMap` |  |
| `auth` | `VMap` |  |
| `card` | `VMap` |  |
| `customer` | `VMap` |  |
| `description` | `String` |  |
| `id` | `String` |  |
| `item` | `[Value]` |  |
| `level2` | `VMap` |  |
| `level3` | `VMap` |  |
| `override` | `VMap` |  |
| `shipping_address` | `VMap` |  |
| `status` | `String` |  |
| `timestamp` | `String` |  |
| `trace` | `VMap` |  |

#### Example: Load

```swift
let transactionDetail = try client.TransactionDetail().load(VMap([("account_id", .string("account_id")), ("transaction_id", .string("transaction_id"))]), nil)
```


### Webhook

Create an instance: `let webhook = client.Webhook()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `String` |  |
| `id` | `String` |  |
| `url` | `String` |  |

#### Example: Load

```swift
let webhook = try client.Webhook().load(VMap([("id", .string("webhook_id")), ("account_id", .string("account_id"))]), nil)
```

#### Example: List

```swift
let webhookList = try client.Webhook().list(nil, nil)
```

#### Example: Create

```swift
let webhook = try client.Webhook().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
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

### Data as loose values

The Swift SDK uses a loose object model — the vendored `Value` enum
(with `VMap` / `VList` wrappers) throughout — rather than a bespoke typed
struct per endpoint. This mirrors the dynamic nature of the API and keeps the
SDK flexible: no regeneration is needed when the API schema changes.

Use the `.asMap` / `.asList` / `.asString` accessors to safely coerce a
`Value` to a concrete Swift type (each returns `nil` on a type mismatch).
A `BluefinPayconexTypes.swift` file of reference `struct` types is also
generated for editor documentation.

### Project structure

```
swift/
├── Package.swift                     -- SwiftPM manifest (zero runtime deps)
├── Sources/ProjectNameSDK/
│   ├── core/                         -- Main client, config, entity base, error type
│   ├── entity/                       -- Generated entity clients
│   ├── feature/                      -- Built-in features (Base, Test, Log, ...)
│   ├── utility/                      -- Utility functions
│   └── Struct/                       -- Vendored Voxgig Struct port
└── Tests/ProjectNameSDKTests/        -- Test suites (XCTest)
```

The main client class (`BluefinPayconexSDK`, under `Sources/ProjectNameSDK/core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is dependency-free: JSON parsing is the vendored
`Struct/JSON.swift`, HTTP transport is Foundation's `URLSession`, and the
struct library is inlined under `Struct/`.

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
