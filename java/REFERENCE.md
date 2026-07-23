# BluefinPayconex Java SDK Reference

Complete API reference for the BluefinPayconex Java SDK.


## BluefinPayconexSDK

### Constructor

```java
BluefinPayconexSDK client = new BluefinPayconexSDK(options);
```

Create a new SDK client instance. `options` is a `Map<String, Object>`.

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

```java
BluefinPayconexSDK client = BluefinPayconexSDK.testSDK(null, null);
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
`Map<String, Object>` with `ok`, `status`, `headers`, and `data` (or
`err` on failure). This escape hatch never raises — branch on
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

**Returns:** `Map<String, Object>`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AccountUpdater

```java
SdkEntity accountUpdater = client.accountUpdater(null);
```

### Operations

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.accountUpdater(null).remove(Map.of("account_id", "account_id", "subscription_id", "subscription_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdater` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterSchedule

```java
SdkEntity accountUpdaterSchedule = client.accountUpdaterSchedule(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `Boolean` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `List<Object>` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.accountUpdaterSchedule(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterScheduleWithResult

```java
SdkEntity accountUpdaterScheduleWithResult = client.accountUpdaterScheduleWithResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `List<Object>` | Yes |  |
| `created_at` | `String` | Yes |  |
| `enabled` | `Boolean` | No |  |
| `expiry` | `String` | No |  |
| `id` | `String` | Yes |  |
| `most_recent_update` | `Map<String, Object>` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `List<Object>` | Yes |  |
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

```java
Object result = client.accountUpdaterScheduleWithResult(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.accountUpdaterScheduleWithResult(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResult

```java
SdkEntity accountUpdaterSubscriptionWithResult = client.accountUpdaterSubscriptionWithResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String` | No |  |
| `enabled` | `Boolean` | No |  |
| `id` | `String` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | No |  |
| `record` | `List<Object>` | No |  |
| `response_format` | `String` | No |  |
| `template_ref` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.accountUpdaterSubscriptionWithResult(null).create(Map.of(
    "account_id", "example_account_id",  // String
    "subscription_id", "example_subscription_id"  // String
), null);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.accountUpdaterSubscriptionWithResult(null).load(Map.of("account_id", "account_id", "subscription_id", "subscription_id"), null);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.accountUpdaterSubscriptionWithResult(null).update(Map.of(
    "account_id", "account_id",
    "subscription_id", "subscription_id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterUpdate

```java
SdkEntity accountUpdaterUpdate = client.accountUpdaterUpdate(null);
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
| `recurring_schedule` | `List<Object>` | No |  |
| `status` | `String` | No |  |
| `update_id` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.accountUpdaterUpdate(null).load(Map.of("id", "account_updater_update_id", "account_id", "account_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApiKey

```java
SdkEntity apiKey = client.apiKey(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `List<Object>` | No |  |
| `enabled` | `Boolean` | No |  |
| `expires_at` | `String` | No |  |
| `expires_in` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | No |  |
| `method` | `List<Object>` | No |  |
| `scope` | `List<Object>` | No |  |
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

```java
Object result = client.apiKey(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.apiKey(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.apiKey(null).load(Map.of("id", "api_key_id", "account_id", "account_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.apiKey(null).remove(Map.of("id", "api_key_id", "account_id", "account_id"), null);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.apiKey(null).update(Map.of(
    "id", "api_key_id",
    "account_id", "account_id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApiKey` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApplePayMerchantDetail

```java
SdkEntity applePayMerchantDetail = client.applePayMerchantDetail(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `List<Object>` | Yes |  |
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

```java
Object result = client.applePayMerchantDetail(null).create(Map.of(
    "account_id", 1L  // Long
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.applePayMerchantDetail(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApplePaySession

```java
SdkEntity applePaySession = client.applePaySession(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String` | No |  |
| `domain_name` | `String` | No |  |
| `epoch_timestamp` | `Long` | No |  |
| `expires_at` | `Long` | No |  |
| `merchant_identifier` | `String` | No |  |
| `merchant_session_identifier` | `String` | No |  |
| `nonce` | `Long` | No |  |
| `operational_analytics_identifier` | `String` | No |  |
| `referrer` | `String` | Yes |  |
| `retry` | `Long` | No |  |
| `signature` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.applePaySession(null).create(Map.of(
    "account_id", 1L  // Long
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePaySession` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DynamicDescriptor

```java
SdkEntity dynamicDescriptor = client.dynamicDescriptor(null);
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

```java
Object result = client.dynamicDescriptor(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.dynamicDescriptor(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.dynamicDescriptor(null).load(Map.of("id", "dynamic_descriptor_id", "account_id", "account_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.dynamicDescriptor(null).remove(Map.of("id", "dynamic_descriptor_id", "account_id", "account_id"), null);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.dynamicDescriptor(null).update(Map.of(
    "id", "dynamic_descriptor_id",
    "account_id", "account_id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## IFrameCreateInstance

```java
SdkEntity iFrameCreateInstance = client.iFrameCreateInstance(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String` | No |  |
| `currency` | `String` | No |  |
| `customer` | `Map<String, Object>` | No |  |
| `initialize_transaction` | `Boolean` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `reference` | `String` | No |  |
| `timeout` | `Double` | No |  |
| `token` | `List<Object>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.iFrameCreateInstance(null).create(Map.of(
    "account_id", "example_account_id",  // String
    "payment_iframe_id", "example_payment_iframe_id"  // String
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## IFrameInstance

```java
SdkEntity iFrameInstance = client.iFrameInstance(null);
```

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.iFrameInstance(null).load(Map.of("id", "i_frame_instance_id", "account_id", "account_id", "payment_iframe_id", "payment_iframe_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameInstance` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Iframe

```java
SdkEntity iframe = client.iframe(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Map<String, Object>` | No |  |
| `allowed_parent_domain` | `List<Object>` | Yes |  |
| `allowed_payment_method` | `List<Object>` | Yes |  |
| `card_setting` | `Map<String, Object>` | No |  |
| `click_to_pay_setting` | `Map<String, Object>` | No |  |
| `currency` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `timeout` | `Double` | No |  |

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

```java
Object result = client.iframe(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.iframe(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.iframe(null).load(Map.of("account_id", "account_id", "iframe_id", "iframe_id"), null);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.iframe(null).update(Map.of(
    "account_id", "account_id",
    "iframe_id", "iframe_id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Iframe` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Init

```java
SdkEntity init = client.init(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Map<String, Object>` | No |  |
| `description` | `String` | No |  |
| `item` | `List<Object>` | No |  |
| `level2` | `Map<String, Object>` | No |  |
| `level3` | `Map<String, Object>` | No |  |
| `shipping_address` | `Map<String, Object>` | Yes |  |
| `trace` | `Map<String, Object>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.init(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Init` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ListApiKeyScopesEntry

```java
SdkEntity listApiKeyScopesEntry = client.listApiKeyScopesEntry(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `description` | `String` | No |  |
| `enabled` | `Boolean` | No |  |
| `level` | `Long` | No |  |
| `scope` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.listApiKeyScopesEntry(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## PaymentIframe

```java
SdkEntity paymentIframe = client.paymentIframe(null);
```

### Operations

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.paymentIframe(null).remove(Map.of("account_id", "account_id", "id", "id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `PaymentIframe` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureAuth

```java
SdkEntity threeDSecureAuth = client.threeDSecureAuth(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Map<String, Object>` | Yes |  |
| `card` | `Map<String, Object>` | Yes |  |
| `challenge` | `Map<String, Object>` | No |  |
| `customer` | `Map<String, Object>` | No |  |
| `purchase` | `Map<String, Object>` | Yes |  |
| `server_transaction_id` | `String` | No |  |
| `shipping` | `Map<String, Object>` | Yes |  |
| `status` | `String` | No |  |
| `three_d_secure_challenge_indicator` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |
| `trace` | `Map<String, Object>` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.threeDSecureAuth(null).create(Map.of(
    "3_d_id", "example_3_d_id",  // String
    "account_id", "example_account_id"  // String
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureBrowserInit

```java
SdkEntity threeDSecureBrowserInit = client.threeDSecureBrowserInit(null);
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

```java
Object result = client.threeDSecureBrowserInit(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureStatus

```java
SdkEntity threeDSecureStatus = client.threeDSecureStatus(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Map<String, Object>` | No |  |
| `info` | `Map<String, Object>` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure` | `Map<String, Object>` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.threeDSecureStatus(null).load(Map.of("3_d_id", "3_d_id", "account_id", "account_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## TransactionDetail

```java
SdkEntity transactionDetail = client.transactionDetail(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Map<String, Object>` | Yes |  |
| `auth` | `Map<String, Object>` | Yes |  |
| `card` | `Map<String, Object>` | No |  |
| `customer` | `Map<String, Object>` | No |  |
| `description` | `String` | No |  |
| `id` | `String` | No |  |
| `item` | `List<Object>` | No |  |
| `level2` | `Map<String, Object>` | No |  |
| `level3` | `Map<String, Object>` | No |  |
| `override` | `Map<String, Object>` | No |  |
| `shipping_address` | `Map<String, Object>` | Yes |  |
| `status` | `String` | Yes |  |
| `timestamp` | `String` | No |  |
| `trace` | `Map<String, Object>` | No |  |

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

```java
Object result = client.transactionDetail(null).load(Map.of("account_id", "account_id", "transaction_id", "transaction_id"), null);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.transactionDetail(null).update(Map.of(
    "account_id", "account_id",
    "transaction_id", "transaction_id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Webhook

```java
SdkEntity webhook = client.webhook(null);
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

```java
Object result = client.webhook(null).create(Map.of(
    "account_id", "example_account_id"  // String
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.webhook(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.webhook(null).load(Map.of("id", "webhook_id", "account_id", "account_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.webhook(null).remove(Map.of("id", "webhook_id", "account_id", "account_id"), null);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.webhook(null).update(Map.of(
    "id", "webhook_id",
    "account_id", "account_id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

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

```java
Map<String, Object> feature = new java.util.LinkedHashMap<>();
feature.put("test", Map.of("active", true));
Map<String, Object> options = new java.util.LinkedHashMap<>();
options.put("feature", feature);
BluefinPayconexSDK client = new BluefinPayconexSDK(options);
```

