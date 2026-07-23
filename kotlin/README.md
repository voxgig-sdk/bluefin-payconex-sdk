# BluefinPayconex Kotlin SDK



The Kotlin SDK for the BluefinPayconex API — an entity-oriented client following idiomatic Kotlin conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.accountUpdater(null)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. Install it from the GitHub
release tag (`kotlin/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) or
from a source checkout — build the library with Gradle:

```bash
cd kotlin && gradle build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```kotlin
import voxgig.bluefinpayconexsdk.core.BluefinPayconexSDK

val client = BluefinPayconexSDK(mutableMapOf<String, Any?>(
    "apikey" to System.getenv("BLUEFIN_PAYCONEX_APIKEY"),
))
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record (as `Any?`) and raises on error.

```kotlin
try {
    val accountUpdaterSubscriptionWithResult = client.accountUpdaterSubscriptionWithResult(null).load(mutableMapOf<String, Any?>("account_id" to "example_account_id", "subscription_id" to "example_subscription_id"), null)
    println(accountUpdaterSubscriptionWithResult)
}
catch (err: RuntimeException) {
    println("load failed: " + err.message)
}
```

### 4. Create, update, and remove

```kotlin
// Remove
client.accountUpdater(null).remove(mutableMapOf<String, Any?>("account_id" to "example_account_id", "subscription_id" to "example_subscription_id"), null)
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

```kotlin
val result = client.direct(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "GET",
    "params" to mapOf("id" to "example")))

if (result["ok"] == true) {
    println(result["status"])  // 200
    println(result["data"])    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as null.
    println("" + result["status"] + " " + result["err"])
}
```

### Prepare a request without sending it

```kotlin
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "DELETE",
    "params" to mapOf("id" to "example")))

println(fetchdef["url"])
println(fetchdef["method"])
println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```kotlin
val client = BluefinPayconexSDK.testSDK(null, null)

// Entity ops return the bare record and raise on error.
val threeDSecureStatus = client.threeDSecureStatus(null).load(null, null)
// threeDSecureStatus holds the mock response record
println(threeDSecureStatus)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```kotlin
val mockFetch = java.util.function.BiFunction<String, MutableMap<String, Any?>, Any?> { url, init ->
    mutableMapOf<String, Any?>(
        "status" to 200,
        "statusText" to "OK",
        "headers" to mutableMapOf<String, Any?>(),
        "json" to java.util.function.Supplier<Any?> { mapOf("id" to "mock01") },
    )
}

val client = BluefinPayconexSDK(mutableMapOf<String, Any?>(
    "base" to "http://localhost:8080",
    "system" to mapOf("fetch" to mockFetch),
))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd kotlin && gradle test
```


## Reference

### BluefinPayconexSDK

```kotlin
val client = BluefinPayconexSDK(options)
```

Creates a new SDK client. `options` is a `MutableMap<String, Any?>`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### testSDK

```kotlin
val client = BluefinPayconexSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> MutableMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> MutableMap` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> MutableMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `accountUpdater` | `(entopts) -> SdkEntity` | Create an AccountUpdater entity instance. |
| `accountUpdaterSchedule` | `(entopts) -> SdkEntity` | Create an AccountUpdaterSchedule entity instance. |
| `accountUpdaterScheduleWithResult` | `(entopts) -> SdkEntity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `accountUpdaterSubscriptionWithResult` | `(entopts) -> SdkEntity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `accountUpdaterUpdate` | `(entopts) -> SdkEntity` | Create an AccountUpdaterUpdate entity instance. |
| `apiKey` | `(entopts) -> SdkEntity` | Create an ApiKey entity instance. |
| `applePayMerchantDetail` | `(entopts) -> SdkEntity` | Create an ApplePayMerchantDetail entity instance. |
| `applePaySession` | `(entopts) -> SdkEntity` | Create an ApplePaySession entity instance. |
| `dynamicDescriptor` | `(entopts) -> SdkEntity` | Create a DynamicDescriptor entity instance. |
| `iFrameCreateInstance` | `(entopts) -> SdkEntity` | Create an IFrameCreateInstance entity instance. |
| `iFrameInstance` | `(entopts) -> SdkEntity` | Create an IFrameInstance entity instance. |
| `iframe` | `(entopts) -> SdkEntity` | Create an Iframe entity instance. |
| `init` | `(entopts) -> SdkEntity` | Create an Init entity instance. |
| `listApiKeyScopesEntry` | `(entopts) -> SdkEntity` | Create a ListApiKeyScopesEntry entity instance. |
| `paymentIframe` | `(entopts) -> SdkEntity` | Create a PaymentIframe entity instance. |
| `threeDSecureAuth` | `(entopts) -> SdkEntity` | Create a ThreeDSecureAuth entity instance. |
| `threeDSecureBrowserInit` | `(entopts) -> SdkEntity` | Create a ThreeDSecureBrowserInit entity instance. |
| `threeDSecureStatus` | `(entopts) -> SdkEntity` | Create a ThreeDSecureStatus entity instance. |
| `transactionDetail` | `(entopts) -> SdkEntity` | Create a TransactionDetail entity instance. |
| `webhook` | `(entopts) -> SdkEntity` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Any?` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Any?` | List entities matching the criteria (an aggregate list). Raises on error. |
| `create` | `(reqdata, ctrl) -> Any?` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> Any?` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> Any?` | Remove an entity. Raises on error. |
| `data` | `(vararg newdata) -> Any?` | Get or set entity data. |
| `match` | `(vararg newmatch) -> Any?` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `name` | `val: String` | The entity name. |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Any?` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`MutableMap<String, Any?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Any?` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### AccountUpdater

| Field | Description |
| --- | --- |

Operations: remove.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}`

#### AccountUpdaterSchedule

| Field | Description |
| --- | --- |
| `enabled` |  |
| `period_date` |  |
| `period_id` |  |
| `response_format` |  |
| `token` |  |

Operations: create.

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

Operations: create, list.

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

Operations: create, load, update.

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

Operations: load.

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

Operations: create, list, load, remove, update.

API path: `/api/v4/accounts/{accountId}/api-keys`

#### ApplePayMerchantDetail

| Field | Description |
| --- | --- |
| `domain` |  |
| `merchant_url` |  |
| `partner_merchant_name` |  |
| `payconex_account_id` |  |

Operations: create, list.

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

Operations: create.

API path: `/api/v4/accounts/{accountId}/applePay/session`

#### DynamicDescriptor

| Field | Description |
| --- | --- |
| `city` |  |
| `descriptor` |  |
| `id` |  |
| `name` |  |
| `state` |  |

Operations: create, list, load, remove, update.

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

Operations: create.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init`

#### IFrameInstance

| Field | Description |
| --- | --- |

Operations: load.

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

Operations: create, list, load, update.

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

Operations: create.

API path: `/api/v4/accounts/{accountId}/payments/init`

#### ListApiKeyScopesEntry

| Field | Description |
| --- | --- |
| `category` |  |
| `description` |  |
| `enabled` |  |
| `level` |  |
| `scope` |  |

Operations: list.

API path: `/api/v4/api-key-scopes`

#### PaymentIframe

| Field | Description |
| --- | --- |

Operations: remove.

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

Operations: create.

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

Operations: create.

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

Operations: load.

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

Operations: load, update.

API path: `/api/v4/accounts/{accountId}/payments/{transactionId}`

#### Webhook

| Field | Description |
| --- | --- |
| `event` |  |
| `id` |  |
| `url` |  |

Operations: create, list, load, remove, update.

API path: `/api/v4/accounts/{accountId}/webhooks`



## Entities


### AccountUpdater

Create an instance: `val accountUpdater = client.accountUpdater(null)`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match, null)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `val accountUpdaterSchedule = client.accountUpdaterSchedule(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `Boolean?` |  |
| `period_date` | `String?` |  |
| `period_id` | `String?` |  |
| `response_format` | `String?` |  |
| `token` | `List<Any?>?` |  |

#### Example: Create

```kotlin
val accountUpdaterSchedule = client.accountUpdaterSchedule(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```


### AccountUpdaterScheduleWithResult

Create an instance: `val accountUpdaterScheduleWithResult = client.accountUpdaterScheduleWithResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `List<Any?>?` |  |
| `created_at` | `String?` |  |
| `enabled` | `Boolean?` |  |
| `expiry` | `String?` |  |
| `id` | `String?` |  |
| `most_recent_update` | `Map<String, Any?>?` |  |
| `period_date` | `String?` |  |
| `period_id` | `String?` |  |
| `response_format` | `String?` |  |
| `token` | `List<Any?>?` |  |
| `type` | `String?` |  |
| `updated_at` | `String?` |  |

#### Example: List

```kotlin
val accountUpdaterScheduleWithResultList = client.accountUpdaterScheduleWithResult(null).list(null, null)
```

#### Example: Create

```kotlin
val accountUpdaterScheduleWithResult = client.accountUpdaterScheduleWithResult(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `val accountUpdaterSubscriptionWithResult = client.accountUpdaterSubscriptionWithResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `load(match, null)` | Load a single entity by match criteria. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `String?` |  |
| `enabled` | `Boolean?` |  |
| `id` | `String?` |  |
| `period_date` | `String?` |  |
| `period_id` | `String?` |  |
| `record` | `List<Any?>?` |  |
| `response_format` | `String?` |  |
| `template_ref` | `String?` |  |
| `updated_at` | `String?` |  |

#### Example: Load

```kotlin
val accountUpdaterSubscriptionWithResult = client.accountUpdaterSubscriptionWithResult(null).load(mutableMapOf<String, Any?>("account_id" to "account_id", "subscription_id" to "subscription_id"), null)
```

#### Example: Create

```kotlin
val accountUpdaterSubscriptionWithResult = client.accountUpdaterSubscriptionWithResult(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id",  // String?
    "subscription_id" to "example_subscription_id"  // String?
), null)
```


### AccountUpdaterUpdate

Create an instance: `val accountUpdaterUpdate = client.accountUpdaterUpdate(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `String?` |  |
| `format` | `String?` |  |
| `id` | `String?` |  |
| `new_expiry` | `String?` |  |
| `new_token` | `String?` |  |
| `old_expiry` | `String?` |  |
| `old_token` | `String?` |  |
| `recurring_schedule` | `List<Any?>?` |  |
| `status` | `String?` |  |
| `update_id` | `String?` |  |
| `updated_at` | `String?` |  |

#### Example: Load

```kotlin
val accountUpdaterUpdate = client.accountUpdaterUpdate(null).load(mutableMapOf<String, Any?>("id" to "account_updater_update_id", "account_id" to "account_id"), null)
```


### ApiKey

Create an instance: `val apiKey = client.apiKey(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `List<Any?>?` |  |
| `enabled` | `Boolean?` |  |
| `expires_at` | `String?` |  |
| `expires_in` | `String?` |  |
| `id` | `String?` |  |
| `label` | `String?` |  |
| `method` | `List<Any?>?` |  |
| `scope` | `List<Any?>?` |  |
| `secret` | `String?` |  |

#### Example: Load

```kotlin
val apiKey = client.apiKey(null).load(mutableMapOf<String, Any?>("id" to "api_key_id", "account_id" to "account_id"), null)
```

#### Example: List

```kotlin
val apiKeyList = client.apiKey(null).list(null, null)
```

#### Example: Create

```kotlin
val apiKey = client.apiKey(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```


### ApplePayMerchantDetail

Create an instance: `val applePayMerchantDetail = client.applePayMerchantDetail(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `List<Any?>?` |  |
| `merchant_url` | `String?` |  |
| `partner_merchant_name` | `String?` |  |
| `payconex_account_id` | `String?` |  |

#### Example: List

```kotlin
val applePayMerchantDetailList = client.applePayMerchantDetail(null).list(null, null)
```

#### Example: Create

```kotlin
val applePayMerchantDetail = client.applePayMerchantDetail(null).create(mutableMapOf<String, Any?>(
    "account_id" to 1L  // Long?
), null)
```


### ApplePaySession

Create an instance: `val applePaySession = client.applePaySession(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `String?` |  |
| `domain_name` | `String?` |  |
| `epoch_timestamp` | `Long?` |  |
| `expires_at` | `Long?` |  |
| `merchant_identifier` | `String?` |  |
| `merchant_session_identifier` | `String?` |  |
| `nonce` | `Long?` |  |
| `operational_analytics_identifier` | `String?` |  |
| `referrer` | `String?` |  |
| `retry` | `Long?` |  |
| `signature` | `String?` |  |

#### Example: Create

```kotlin
val applePaySession = client.applePaySession(null).create(mutableMapOf<String, Any?>(
    "account_id" to 1L  // Long?
), null)
```


### DynamicDescriptor

Create an instance: `val dynamicDescriptor = client.dynamicDescriptor(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `String?` |  |
| `descriptor` | `String?` |  |
| `id` | `String?` |  |
| `name` | `String?` |  |
| `state` | `String?` |  |

#### Example: Load

```kotlin
val dynamicDescriptor = client.dynamicDescriptor(null).load(mutableMapOf<String, Any?>("id" to "dynamic_descriptor_id", "account_id" to "account_id"), null)
```

#### Example: List

```kotlin
val dynamicDescriptorList = client.dynamicDescriptor(null).list(null, null)
```

#### Example: Create

```kotlin
val dynamicDescriptor = client.dynamicDescriptor(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```


### IFrameCreateInstance

Create an instance: `val iFrameCreateInstance = client.iFrameCreateInstance(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `String?` |  |
| `currency` | `String?` |  |
| `customer` | `Map<String, Any?>?` |  |
| `initialize_transaction` | `Boolean?` |  |
| `label` | `String?` |  |
| `language` | `String?` |  |
| `reference` | `String?` |  |
| `timeout` | `Double?` |  |
| `token` | `List<Any?>?` |  |

#### Example: Create

```kotlin
val iFrameCreateInstance = client.iFrameCreateInstance(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id",  // String?
    "payment_iframe_id" to "example_payment_iframe_id"  // String?
), null)
```


### IFrameInstance

Create an instance: `val iFrameInstance = client.iFrameInstance(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Example: Load

```kotlin
val iFrameInstance = client.iFrameInstance(null).load(mutableMapOf<String, Any?>("id" to "i_frame_instance_id", "account_id" to "account_id", "payment_iframe_id" to "payment_iframe_id"), null)
```


### Iframe

Create an instance: `val iframe = client.iframe(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `Map<String, Any?>?` |  |
| `allowed_parent_domain` | `List<Any?>?` |  |
| `allowed_payment_method` | `List<Any?>?` |  |
| `card_setting` | `Map<String, Any?>?` |  |
| `click_to_pay_setting` | `Map<String, Any?>?` |  |
| `currency` | `String?` |  |
| `id` | `String?` |  |
| `label` | `String?` |  |
| `language` | `String?` |  |
| `timeout` | `Double?` |  |

#### Example: Load

```kotlin
val iframe = client.iframe(null).load(mutableMapOf<String, Any?>("account_id" to "account_id", "iframe_id" to "iframe_id"), null)
```

#### Example: List

```kotlin
val iframeList = client.iframe(null).list(null, null)
```

#### Example: Create

```kotlin
val iframe = client.iframe(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```


### Init

Create an instance: `val init = client.init(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `Map<String, Any?>?` |  |
| `description` | `String?` |  |
| `item` | `List<Any?>?` |  |
| `level2` | `Map<String, Any?>?` |  |
| `level3` | `Map<String, Any?>?` |  |
| `shipping_address` | `Map<String, Any?>?` |  |
| `trace` | `Map<String, Any?>?` |  |

#### Example: Create

```kotlin
val init = client.init(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```


### ListApiKeyScopesEntry

Create an instance: `val listApiKeyScopesEntry = client.listApiKeyScopesEntry(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `String?` |  |
| `description` | `String?` |  |
| `enabled` | `Boolean?` |  |
| `level` | `Long?` |  |
| `scope` | `String?` |  |

#### Example: List

```kotlin
val listApiKeyScopesEntryList = client.listApiKeyScopesEntry(null).list(null, null)
```


### PaymentIframe

Create an instance: `val paymentIframe = client.paymentIframe(null)`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match, null)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `val threeDSecureAuth = client.threeDSecureAuth(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `Map<String, Any?>?` |  |
| `card` | `Map<String, Any?>?` |  |
| `challenge` | `Map<String, Any?>?` |  |
| `customer` | `Map<String, Any?>?` |  |
| `purchase` | `Map<String, Any?>?` |  |
| `server_transaction_id` | `String?` |  |
| `shipping` | `Map<String, Any?>?` |  |
| `status` | `String?` |  |
| `three_d_secure_challenge_indicator` | `String?` |  |
| `three_d_secure_id` | `String?` |  |
| `trace` | `Map<String, Any?>?` |  |

#### Example: Create

```kotlin
val threeDSecureAuth = client.threeDSecureAuth(null).create(mutableMapOf<String, Any?>(
    "3_d_id" to "example_3_d_id",  // String?
    "account_id" to "example_account_id"  // String?
), null)
```


### ThreeDSecureBrowserInit

Create an instance: `val threeDSecureBrowserInit = client.threeDSecureBrowserInit(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `String?` |  |
| `acs_url` | `String?` |  |
| `cvv` | `String?` |  |
| `expiry` | `String?` |  |
| `pan` | `String?` |  |
| `payment_details_reference` | `String?` |  |
| `server_transaction_id` | `String?` |  |
| `status` | `String?` |  |
| `three_d_secure_data` | `String?` |  |
| `three_d_secure_id` | `String?` |  |

#### Example: Create

```kotlin
val threeDSecureBrowserInit = client.threeDSecureBrowserInit(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```


### ThreeDSecureStatus

Create an instance: `val threeDSecureStatus = client.threeDSecureStatus(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `Map<String, Any?>?` |  |
| `info` | `Map<String, Any?>?` |  |
| `server_transaction_id` | `String?` |  |
| `status` | `String?` |  |
| `three_d_secure` | `Map<String, Any?>?` |  |
| `three_d_secure_id` | `String?` |  |

#### Example: Load

```kotlin
val threeDSecureStatus = client.threeDSecureStatus(null).load(mutableMapOf<String, Any?>("3_d_id" to "3_d_id", "account_id" to "account_id"), null)
```


### TransactionDetail

Create an instance: `val transactionDetail = client.transactionDetail(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `Map<String, Any?>?` |  |
| `auth` | `Map<String, Any?>?` |  |
| `card` | `Map<String, Any?>?` |  |
| `customer` | `Map<String, Any?>?` |  |
| `description` | `String?` |  |
| `id` | `String?` |  |
| `item` | `List<Any?>?` |  |
| `level2` | `Map<String, Any?>?` |  |
| `level3` | `Map<String, Any?>?` |  |
| `override` | `Map<String, Any?>?` |  |
| `shipping_address` | `Map<String, Any?>?` |  |
| `status` | `String?` |  |
| `timestamp` | `String?` |  |
| `trace` | `Map<String, Any?>?` |  |

#### Example: Load

```kotlin
val transactionDetail = client.transactionDetail(null).load(mutableMapOf<String, Any?>("account_id" to "account_id", "transaction_id" to "transaction_id"), null)
```


### Webhook

Create an instance: `val webhook = client.webhook(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `String?` |  |
| `id` | `String?` |  |
| `url` | `String?` |  |

#### Example: Load

```kotlin
val webhook = client.webhook(null).load(mutableMapOf<String, Any?>("id" to "webhook_id", "account_id" to "account_id"), null)
```

#### Example: List

```kotlin
val webhookList = client.webhook(null).list(null, null)
```

#### Example: Create

```kotlin
val webhook = client.webhook(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
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

### Data as maps

The Kotlin SDK uses a loose object model — `MutableMap<String, Any?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`MutableMap<String, Any?>`. A `BluefinPayconexTypes.kt` module of
reference `data class` types is also generated for editor documentation.

### Project structure

```
kotlin/
├── build.gradle.kts            -- Gradle build (compiles core/, utility/, feature/, entity/)
├── settings.gradle.kts         -- Gradle project settings
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- JUnit test suites
```

The main client class (`BluefinPayconexSDK`, package `voxgig.bluefinpayconexsdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed.

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
