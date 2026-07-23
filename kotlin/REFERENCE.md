# BluefinPayconex Kotlin SDK Reference

Complete API reference for the BluefinPayconex Kotlin SDK.


## BluefinPayconexSDK

### Constructor

```kotlin
val client = BluefinPayconexSDK(options)
```

Create a new SDK client instance. `options` is a `MutableMap<String, Any?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Map` | Custom headers for all requests. |
| `options["feature"]` | `Map` | Feature configuration. |
| `options["system"]` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `null`.

```kotlin
val client = BluefinPayconexSDK.testSDK(null, null)
```


### Instance Methods

#### `accountUpdater(entopts)`

Create a new `AccountUpdater` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `accountUpdaterSchedule(entopts)`

Create a new `AccountUpdaterSchedule` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `accountUpdaterScheduleWithResult(entopts)`

Create a new `AccountUpdaterScheduleWithResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `accountUpdaterSubscriptionWithResult(entopts)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `accountUpdaterUpdate(entopts)`

Create a new `AccountUpdaterUpdate` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `apiKey(entopts)`

Create a new `ApiKey` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `applePayMerchantDetail(entopts)`

Create a new `ApplePayMerchantDetail` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `applePaySession(entopts)`

Create a new `ApplePaySession` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `dynamicDescriptor(entopts)`

Create a new `DynamicDescriptor` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `iFrameCreateInstance(entopts)`

Create a new `IFrameCreateInstance` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `iFrameInstance(entopts)`

Create a new `IFrameInstance` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `iframe(entopts)`

Create a new `Iframe` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `init(entopts)`

Create a new `Init` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `listApiKeyScopesEntry(entopts)`

Create a new `ListApiKeyScopesEntry` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `paymentIframe(entopts)`

Create a new `PaymentIframe` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `threeDSecureAuth(entopts)`

Create a new `ThreeDSecureAuth` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `threeDSecureBrowserInit(entopts)`

Create a new `ThreeDSecureBrowserInit` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `threeDSecureStatus(entopts)`

Create a new `ThreeDSecureStatus` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `transactionDetail(entopts)`

Create a new `TransactionDetail` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `webhook(entopts)`

Create a new `Webhook` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `optionsMap() -> MutableMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> MutableMap`

Make a direct HTTP request to any API endpoint. Returns a result
`MutableMap<String, Any?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Any?` | Request body (maps are JSON-serialized). |

**Returns:** `MutableMap<String, Any?>`

#### `prepare(fetchargs) -> MutableMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AccountUpdater

```kotlin
val accountUpdater = client.accountUpdater(null)
```

### Operations

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.accountUpdater(null).remove(mutableMapOf<String, Any?>("account_id" to "account_id", "subscription_id" to "subscription_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdater` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## AccountUpdaterSchedule

```kotlin
val accountUpdaterSchedule = client.accountUpdaterSchedule(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `Boolean?` | No |  |
| `period_date` | `String?` | No |  |
| `period_id` | `String?` | Yes |  |
| `response_format` | `String?` | No |  |
| `token` | `List<Any?>?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.accountUpdaterSchedule(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## AccountUpdaterScheduleWithResult

```kotlin
val accountUpdaterScheduleWithResult = client.accountUpdaterScheduleWithResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `List<Any?>?` | Yes |  |
| `created_at` | `String?` | Yes |  |
| `enabled` | `Boolean?` | No |  |
| `expiry` | `String?` | No |  |
| `id` | `String?` | Yes |  |
| `most_recent_update` | `Map<String, Any?>?` | No |  |
| `period_date` | `String?` | No |  |
| `period_id` | `String?` | Yes |  |
| `response_format` | `String?` | No |  |
| `token` | `List<Any?>?` | Yes |  |
| `type` | `String?` | Yes |  |
| `updated_at` | `String?` | Yes |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.accountUpdaterScheduleWithResult(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.accountUpdaterScheduleWithResult(null).list(null, null)
println(results)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## AccountUpdaterSubscriptionWithResult

```kotlin
val accountUpdaterSubscriptionWithResult = client.accountUpdaterSubscriptionWithResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String?` | No |  |
| `enabled` | `Boolean?` | No |  |
| `id` | `String?` | No |  |
| `period_date` | `String?` | No |  |
| `period_id` | `String?` | No |  |
| `record` | `List<Any?>?` | No |  |
| `response_format` | `String?` | No |  |
| `template_ref` | `String?` | No |  |
| `updated_at` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.accountUpdaterSubscriptionWithResult(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id",  // String?
    "subscription_id" to "example_subscription_id"  // String?
), null)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.accountUpdaterSubscriptionWithResult(null).load(mutableMapOf<String, Any?>("account_id" to "account_id", "subscription_id" to "subscription_id"), null)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.accountUpdaterSubscriptionWithResult(null).update(mutableMapOf<String, Any?>(
    "account_id" to "account_id",
    "subscription_id" to "subscription_id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## AccountUpdaterUpdate

```kotlin
val accountUpdaterUpdate = client.accountUpdaterUpdate(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `String?` | No |  |
| `format` | `String?` | No |  |
| `id` | `String?` | No |  |
| `new_expiry` | `String?` | No |  |
| `new_token` | `String?` | No |  |
| `old_expiry` | `String?` | No |  |
| `old_token` | `String?` | No |  |
| `recurring_schedule` | `List<Any?>?` | No |  |
| `status` | `String?` | No |  |
| `update_id` | `String?` | No |  |
| `updated_at` | `String?` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.accountUpdaterUpdate(null).load(mutableMapOf<String, Any?>("id" to "account_updater_update_id", "account_id" to "account_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## ApiKey

```kotlin
val apiKey = client.apiKey(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `List<Any?>?` | No |  |
| `enabled` | `Boolean?` | No |  |
| `expires_at` | `String?` | No |  |
| `expires_in` | `String?` | No |  |
| `id` | `String?` | No |  |
| `label` | `String?` | No |  |
| `method` | `List<Any?>?` | No |  |
| `scope` | `List<Any?>?` | No |  |
| `secret` | `String?` | No |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.apiKey(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.apiKey(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.apiKey(null).load(mutableMapOf<String, Any?>("id" to "api_key_id", "account_id" to "account_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.apiKey(null).remove(mutableMapOf<String, Any?>("id" to "api_key_id", "account_id" to "account_id"), null)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.apiKey(null).update(mutableMapOf<String, Any?>(
    "id" to "api_key_id",
    "account_id" to "account_id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApiKey` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## ApplePayMerchantDetail

```kotlin
val applePayMerchantDetail = client.applePayMerchantDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `List<Any?>?` | Yes |  |
| `merchant_url` | `String?` | Yes |  |
| `partner_merchant_name` | `String?` | No |  |
| `payconex_account_id` | `String?` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `domain` | - | - |
| `merchant_url` | - | Yes |
| `partner_merchant_name` | - | - |
| `payconex_account_id` | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.applePayMerchantDetail(null).create(mutableMapOf<String, Any?>(
    "account_id" to 1L  // Long?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.applePayMerchantDetail(null).list(null, null)
println(results)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## ApplePaySession

```kotlin
val applePaySession = client.applePaySession(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String?` | No |  |
| `domain_name` | `String?` | No |  |
| `epoch_timestamp` | `Long?` | No |  |
| `expires_at` | `Long?` | No |  |
| `merchant_identifier` | `String?` | No |  |
| `merchant_session_identifier` | `String?` | No |  |
| `nonce` | `Long?` | No |  |
| `operational_analytics_identifier` | `String?` | No |  |
| `referrer` | `String?` | Yes |  |
| `retry` | `Long?` | No |  |
| `signature` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.applePaySession(null).create(mutableMapOf<String, Any?>(
    "account_id" to 1L  // Long?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePaySession` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DynamicDescriptor

```kotlin
val dynamicDescriptor = client.dynamicDescriptor(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `String?` | No |  |
| `descriptor` | `String?` | No |  |
| `id` | `String?` | No |  |
| `name` | `String?` | No |  |
| `state` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.dynamicDescriptor(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.dynamicDescriptor(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.dynamicDescriptor(null).load(mutableMapOf<String, Any?>("id" to "dynamic_descriptor_id", "account_id" to "account_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.dynamicDescriptor(null).remove(mutableMapOf<String, Any?>("id" to "dynamic_descriptor_id", "account_id" to "account_id"), null)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.dynamicDescriptor(null).update(mutableMapOf<String, Any?>(
    "id" to "dynamic_descriptor_id",
    "account_id" to "account_id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## IFrameCreateInstance

```kotlin
val iFrameCreateInstance = client.iFrameCreateInstance(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String?` | No |  |
| `currency` | `String?` | No |  |
| `customer` | `Map<String, Any?>?` | No |  |
| `initialize_transaction` | `Boolean?` | No |  |
| `label` | `String?` | Yes |  |
| `language` | `String?` | No |  |
| `reference` | `String?` | No |  |
| `timeout` | `Double?` | No |  |
| `token` | `List<Any?>?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.iFrameCreateInstance(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id",  // String?
    "payment_iframe_id" to "example_payment_iframe_id"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## IFrameInstance

```kotlin
val iFrameInstance = client.iFrameInstance(null)
```

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.iFrameInstance(null).load(mutableMapOf<String, Any?>("id" to "i_frame_instance_id", "account_id" to "account_id", "payment_iframe_id" to "payment_iframe_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameInstance` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Iframe

```kotlin
val iframe = client.iframe(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Map<String, Any?>?` | No |  |
| `allowed_parent_domain` | `List<Any?>?` | Yes |  |
| `allowed_payment_method` | `List<Any?>?` | Yes |  |
| `card_setting` | `Map<String, Any?>?` | No |  |
| `click_to_pay_setting` | `Map<String, Any?>?` | No |  |
| `currency` | `String?` | No |  |
| `id` | `String?` | No |  |
| `label` | `String?` | Yes |  |
| `language` | `String?` | No |  |
| `timeout` | `Double?` | No |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.iframe(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.iframe(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.iframe(null).load(mutableMapOf<String, Any?>("account_id" to "account_id", "iframe_id" to "iframe_id"), null)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.iframe(null).update(mutableMapOf<String, Any?>(
    "account_id" to "account_id",
    "iframe_id" to "iframe_id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Iframe` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Init

```kotlin
val init = client.init(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Map<String, Any?>?` | No |  |
| `description` | `String?` | No |  |
| `item` | `List<Any?>?` | No |  |
| `level2` | `Map<String, Any?>?` | No |  |
| `level3` | `Map<String, Any?>?` | No |  |
| `shipping_address` | `Map<String, Any?>?` | Yes |  |
| `trace` | `Map<String, Any?>?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.init(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Init` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## ListApiKeyScopesEntry

```kotlin
val listApiKeyScopesEntry = client.listApiKeyScopesEntry(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String?` | No |  |
| `description` | `String?` | No |  |
| `enabled` | `Boolean?` | No |  |
| `level` | `Long?` | No |  |
| `scope` | `String?` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.listApiKeyScopesEntry(null).list(null, null)
println(results)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## PaymentIframe

```kotlin
val paymentIframe = client.paymentIframe(null)
```

### Operations

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.paymentIframe(null).remove(mutableMapOf<String, Any?>("account_id" to "account_id", "id" to "id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `PaymentIframe` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## ThreeDSecureAuth

```kotlin
val threeDSecureAuth = client.threeDSecureAuth(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Map<String, Any?>?` | Yes |  |
| `card` | `Map<String, Any?>?` | Yes |  |
| `challenge` | `Map<String, Any?>?` | No |  |
| `customer` | `Map<String, Any?>?` | No |  |
| `purchase` | `Map<String, Any?>?` | Yes |  |
| `server_transaction_id` | `String?` | No |  |
| `shipping` | `Map<String, Any?>?` | Yes |  |
| `status` | `String?` | No |  |
| `three_d_secure_challenge_indicator` | `String?` | No |  |
| `three_d_secure_id` | `String?` | No |  |
| `trace` | `Map<String, Any?>?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.threeDSecureAuth(null).create(mutableMapOf<String, Any?>(
    "3_d_id" to "example_3_d_id",  // String?
    "account_id" to "example_account_id"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## ThreeDSecureBrowserInit

```kotlin
val threeDSecureBrowserInit = client.threeDSecureBrowserInit(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `String?` | No |  |
| `acs_url` | `String?` | No |  |
| `cvv` | `String?` | No |  |
| `expiry` | `String?` | Yes |  |
| `pan` | `String?` | Yes |  |
| `payment_details_reference` | `String?` | No |  |
| `server_transaction_id` | `String?` | No |  |
| `status` | `String?` | No |  |
| `three_d_secure_data` | `String?` | No |  |
| `three_d_secure_id` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.threeDSecureBrowserInit(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## ThreeDSecureStatus

```kotlin
val threeDSecureStatus = client.threeDSecureStatus(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Map<String, Any?>?` | No |  |
| `info` | `Map<String, Any?>?` | No |  |
| `server_transaction_id` | `String?` | No |  |
| `status` | `String?` | No |  |
| `three_d_secure` | `Map<String, Any?>?` | No |  |
| `three_d_secure_id` | `String?` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.threeDSecureStatus(null).load(mutableMapOf<String, Any?>("3_d_id" to "3_d_id", "account_id" to "account_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## TransactionDetail

```kotlin
val transactionDetail = client.transactionDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Map<String, Any?>?` | Yes |  |
| `auth` | `Map<String, Any?>?` | Yes |  |
| `card` | `Map<String, Any?>?` | No |  |
| `customer` | `Map<String, Any?>?` | No |  |
| `description` | `String?` | No |  |
| `id` | `String?` | No |  |
| `item` | `List<Any?>?` | No |  |
| `level2` | `Map<String, Any?>?` | No |  |
| `level3` | `Map<String, Any?>?` | No |  |
| `override` | `Map<String, Any?>?` | No |  |
| `shipping_address` | `Map<String, Any?>?` | Yes |  |
| `status` | `String?` | Yes |  |
| `timestamp` | `String?` | No |  |
| `trace` | `Map<String, Any?>?` | No |  |

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

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.transactionDetail(null).load(mutableMapOf<String, Any?>("account_id" to "account_id", "transaction_id" to "transaction_id"), null)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.transactionDetail(null).update(mutableMapOf<String, Any?>(
    "account_id" to "account_id",
    "transaction_id" to "transaction_id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionDetail` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Webhook

```kotlin
val webhook = client.webhook(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String?` | Yes |  |
| `id` | `String?` | No |  |
| `url` | `String?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.webhook(null).create(mutableMapOf<String, Any?>(
    "account_id" to "example_account_id"  // String?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.webhook(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.webhook(null).load(mutableMapOf<String, Any?>("id" to "webhook_id", "account_id" to "account_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.webhook(null).remove(mutableMapOf<String, Any?>("id" to "webhook_id", "account_id" to "account_id"), null)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.webhook(null).update(mutableMapOf<String, Any?>(
    "id" to "webhook_id",
    "account_id" to "account_id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Webhook` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```kotlin
val feature = mutableMapOf<String, Any?>(
    "test" to mapOf("active" to true),
)
val client = BluefinPayconexSDK(mutableMapOf<String, Any?>("feature" to feature))
```

