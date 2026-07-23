# BluefinPayconex Scala SDK Reference

Complete API reference for the BluefinPayconex Scala SDK.


## BluefinPayconexSDK

### Constructor

```scala
val client = new BluefinPayconexSDK(options)
```

Create a new SDK client instance. `options` is a `java.util.Map[String, Object]`.

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

```scala
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

#### `optionsMap() -> Map`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Map`

Make a direct HTTP request to any API endpoint. Returns a result
`java.util.Map[String, Object]` with `ok`, `status`, `headers`, and
`data` (or `err` on failure). This escape hatch never raises — branch on
`result.get("ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Object` | Request body (maps are JSON-serialized). |

**Returns:** `java.util.Map[String, Object]`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AccountUpdater

```scala
val accountUpdater = client.accountUpdater(null)
```

### Operations

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.accountUpdater(null).remove(java.util.Map.of("account_id", "account_id", "subscription_id", "subscription_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdater` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterSchedule

```scala
val accountUpdaterSchedule = client.accountUpdaterSchedule(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `java.lang.Boolean` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `java.util.List[Object]` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.accountUpdaterSchedule(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterScheduleWithResult

```scala
val accountUpdaterScheduleWithResult = client.accountUpdaterScheduleWithResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `java.util.List[Object]` | Yes |  |
| `created_at` | `String` | Yes |  |
| `enabled` | `java.lang.Boolean` | No |  |
| `expiry` | `String` | No |  |
| `id` | `String` | Yes |  |
| `most_recent_update` | `java.util.Map[String, Object]` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `java.util.List[Object]` | Yes |  |
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.accountUpdaterScheduleWithResult(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.accountUpdaterScheduleWithResult(null).list(null, null)
println(results)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResult

```scala
val accountUpdaterSubscriptionWithResult = client.accountUpdaterSubscriptionWithResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String` | No |  |
| `enabled` | `java.lang.Boolean` | No |  |
| `id` | `String` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | No |  |
| `record` | `java.util.List[Object]` | No |  |
| `response_format` | `String` | No |  |
| `template_ref` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.accountUpdaterSubscriptionWithResult(null).create(java.util.Map.of(
    "account_id", "example_account_id",  // String
    "subscription_id", "example_subscription_id"  // String
), null)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.accountUpdaterSubscriptionWithResult(null).load(java.util.Map.of("account_id", "account_id", "subscription_id", "subscription_id"), null)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.accountUpdaterSubscriptionWithResult(null).update(java.util.Map.of(
    "account_id", "account_id",
    "subscription_id", "subscription_id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterUpdate

```scala
val accountUpdaterUpdate = client.accountUpdaterUpdate(null)
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
| `recurring_schedule` | `java.util.List[Object]` | No |  |
| `status` | `String` | No |  |
| `update_id` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.accountUpdaterUpdate(null).load(java.util.Map.of("id", "account_updater_update_id", "account_id", "account_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApiKey

```scala
val apiKey = client.apiKey(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `java.util.List[Object]` | No |  |
| `enabled` | `java.lang.Boolean` | No |  |
| `expires_at` | `String` | No |  |
| `expires_in` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | No |  |
| `method` | `java.util.List[Object]` | No |  |
| `scope` | `java.util.List[Object]` | No |  |
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.apiKey(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.apiKey(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.apiKey(null).load(java.util.Map.of("id", "api_key_id", "account_id", "account_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.apiKey(null).remove(java.util.Map.of("id", "api_key_id", "account_id", "account_id"), null)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.apiKey(null).update(java.util.Map.of(
    "id", "api_key_id",
    "account_id", "account_id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApiKey` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApplePayMerchantDetail

```scala
val applePayMerchantDetail = client.applePayMerchantDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `java.util.List[Object]` | Yes |  |
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.applePayMerchantDetail(null).create(java.util.Map.of(
    "account_id", 1L  // java.lang.Long
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.applePayMerchantDetail(null).list(null, null)
println(results)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApplePaySession

```scala
val applePaySession = client.applePaySession(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String` | No |  |
| `domain_name` | `String` | No |  |
| `epoch_timestamp` | `java.lang.Long` | No |  |
| `expires_at` | `java.lang.Long` | No |  |
| `merchant_identifier` | `String` | No |  |
| `merchant_session_identifier` | `String` | No |  |
| `nonce` | `java.lang.Long` | No |  |
| `operational_analytics_identifier` | `String` | No |  |
| `referrer` | `String` | Yes |  |
| `retry` | `java.lang.Long` | No |  |
| `signature` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.applePaySession(null).create(java.util.Map.of(
    "account_id", 1L  // java.lang.Long
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePaySession` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DynamicDescriptor

```scala
val dynamicDescriptor = client.dynamicDescriptor(null)
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.dynamicDescriptor(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.dynamicDescriptor(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.dynamicDescriptor(null).load(java.util.Map.of("id", "dynamic_descriptor_id", "account_id", "account_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.dynamicDescriptor(null).remove(java.util.Map.of("id", "dynamic_descriptor_id", "account_id", "account_id"), null)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.dynamicDescriptor(null).update(java.util.Map.of(
    "id", "dynamic_descriptor_id",
    "account_id", "account_id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## IFrameCreateInstance

```scala
val iFrameCreateInstance = client.iFrameCreateInstance(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String` | No |  |
| `currency` | `String` | No |  |
| `customer` | `java.util.Map[String, Object]` | No |  |
| `initialize_transaction` | `java.lang.Boolean` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `reference` | `String` | No |  |
| `timeout` | `java.lang.Double` | No |  |
| `token` | `java.util.List[Object]` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.iFrameCreateInstance(null).create(java.util.Map.of(
    "account_id", "example_account_id",  // String
    "payment_iframe_id", "example_payment_iframe_id"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## IFrameInstance

```scala
val iFrameInstance = client.iFrameInstance(null)
```

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.iFrameInstance(null).load(java.util.Map.of("id", "i_frame_instance_id", "account_id", "account_id", "payment_iframe_id", "payment_iframe_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameInstance` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Iframe

```scala
val iframe = client.iframe(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `java.util.Map[String, Object]` | No |  |
| `allowed_parent_domain` | `java.util.List[Object]` | Yes |  |
| `allowed_payment_method` | `java.util.List[Object]` | Yes |  |
| `card_setting` | `java.util.Map[String, Object]` | No |  |
| `click_to_pay_setting` | `java.util.Map[String, Object]` | No |  |
| `currency` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `timeout` | `java.lang.Double` | No |  |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.iframe(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.iframe(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.iframe(null).load(java.util.Map.of("account_id", "account_id", "iframe_id", "iframe_id"), null)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.iframe(null).update(java.util.Map.of(
    "account_id", "account_id",
    "iframe_id", "iframe_id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Iframe` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Init

```scala
val init = client.init(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `java.util.Map[String, Object]` | No |  |
| `description` | `String` | No |  |
| `item` | `java.util.List[Object]` | No |  |
| `level2` | `java.util.Map[String, Object]` | No |  |
| `level3` | `java.util.Map[String, Object]` | No |  |
| `shipping_address` | `java.util.Map[String, Object]` | Yes |  |
| `trace` | `java.util.Map[String, Object]` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.init(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Init` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ListApiKeyScopesEntry

```scala
val listApiKeyScopesEntry = client.listApiKeyScopesEntry(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `description` | `String` | No |  |
| `enabled` | `java.lang.Boolean` | No |  |
| `level` | `java.lang.Long` | No |  |
| `scope` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.listApiKeyScopesEntry(null).list(null, null)
println(results)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## PaymentIframe

```scala
val paymentIframe = client.paymentIframe(null)
```

### Operations

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.paymentIframe(null).remove(java.util.Map.of("account_id", "account_id", "id", "id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `PaymentIframe` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureAuth

```scala
val threeDSecureAuth = client.threeDSecureAuth(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `java.util.Map[String, Object]` | Yes |  |
| `card` | `java.util.Map[String, Object]` | Yes |  |
| `challenge` | `java.util.Map[String, Object]` | No |  |
| `customer` | `java.util.Map[String, Object]` | No |  |
| `purchase` | `java.util.Map[String, Object]` | Yes |  |
| `server_transaction_id` | `String` | No |  |
| `shipping` | `java.util.Map[String, Object]` | Yes |  |
| `status` | `String` | No |  |
| `three_d_secure_challenge_indicator` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |
| `trace` | `java.util.Map[String, Object]` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.threeDSecureAuth(null).create(java.util.Map.of(
    "3_d_id", "example_3_d_id",  // String
    "account_id", "example_account_id"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureBrowserInit

```scala
val threeDSecureBrowserInit = client.threeDSecureBrowserInit(null)
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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.threeDSecureBrowserInit(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureStatus

```scala
val threeDSecureStatus = client.threeDSecureStatus(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `java.util.Map[String, Object]` | No |  |
| `info` | `java.util.Map[String, Object]` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure` | `java.util.Map[String, Object]` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.threeDSecureStatus(null).load(java.util.Map.of("3_d_id", "3_d_id", "account_id", "account_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## TransactionDetail

```scala
val transactionDetail = client.transactionDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `java.util.Map[String, Object]` | Yes |  |
| `auth` | `java.util.Map[String, Object]` | Yes |  |
| `card` | `java.util.Map[String, Object]` | No |  |
| `customer` | `java.util.Map[String, Object]` | No |  |
| `description` | `String` | No |  |
| `id` | `String` | No |  |
| `item` | `java.util.List[Object]` | No |  |
| `level2` | `java.util.Map[String, Object]` | No |  |
| `level3` | `java.util.Map[String, Object]` | No |  |
| `override` | `java.util.Map[String, Object]` | No |  |
| `shipping_address` | `java.util.Map[String, Object]` | Yes |  |
| `status` | `String` | Yes |  |
| `timestamp` | `String` | No |  |
| `trace` | `java.util.Map[String, Object]` | No |  |

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

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.transactionDetail(null).load(java.util.Map.of("account_id", "account_id", "transaction_id", "transaction_id"), null)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.transactionDetail(null).update(java.util.Map.of(
    "account_id", "account_id",
    "transaction_id", "transaction_id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Webhook

```scala
val webhook = client.webhook(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String` | Yes |  |
| `id` | `String` | No |  |
| `url` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.webhook(null).create(java.util.Map.of(
    "account_id", "example_account_id"  // String
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.webhook(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.webhook(null).load(java.util.Map.of("id", "webhook_id", "account_id", "account_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.webhook(null).remove(java.util.Map.of("id", "webhook_id", "account_id", "account_id"), null)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.webhook(null).update(java.util.Map.of(
    "id", "webhook_id",
    "account_id", "account_id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Webhook` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```scala
val feature = new java.util.LinkedHashMap[String, Object]()
feature.put("test", java.util.Map.of("active", true))
val options = new java.util.LinkedHashMap[String, Object]()
options.put("feature", feature)
val client = new BluefinPayconexSDK(options)
```

