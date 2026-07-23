# BluefinPayconex Swift SDK Reference

Complete API reference for the BluefinPayconex Swift SDK.


## BluefinPayconexSDK

### Constructor

```swift
let client = BluefinPayconexSDK(options)
```

Create a new SDK client instance. `options` is a `VMap` of `Value`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `VMap` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `VMap` | Custom headers for all requests. |
| `options["feature"]` | `VMap` | Feature configuration. |
| `options["system"]` | `VMap` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```swift
let client = BluefinPayconexSDK.testSDK(nil, nil)
```


### Instance Methods

#### `AccountUpdater(entopts)`

Create a new `AccountUpdater` entity instance. Pass `nil` for no initial
options.

#### `AccountUpdaterSchedule(entopts)`

Create a new `AccountUpdaterSchedule` entity instance. Pass `nil` for no initial
options.

#### `AccountUpdaterScheduleWithResult(entopts)`

Create a new `AccountUpdaterScheduleWithResult` entity instance. Pass `nil` for no initial
options.

#### `AccountUpdaterSubscriptionWithResult(entopts)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance. Pass `nil` for no initial
options.

#### `AccountUpdaterUpdate(entopts)`

Create a new `AccountUpdaterUpdate` entity instance. Pass `nil` for no initial
options.

#### `ApiKey(entopts)`

Create a new `ApiKey` entity instance. Pass `nil` for no initial
options.

#### `ApplePayMerchantDetail(entopts)`

Create a new `ApplePayMerchantDetail` entity instance. Pass `nil` for no initial
options.

#### `ApplePaySession(entopts)`

Create a new `ApplePaySession` entity instance. Pass `nil` for no initial
options.

#### `DynamicDescriptor(entopts)`

Create a new `DynamicDescriptor` entity instance. Pass `nil` for no initial
options.

#### `IFrameCreateInstance(entopts)`

Create a new `IFrameCreateInstance` entity instance. Pass `nil` for no initial
options.

#### `IFrameInstance(entopts)`

Create a new `IFrameInstance` entity instance. Pass `nil` for no initial
options.

#### `Iframe(entopts)`

Create a new `Iframe` entity instance. Pass `nil` for no initial
options.

#### `Init(entopts)`

Create a new `Init` entity instance. Pass `nil` for no initial
options.

#### `ListApiKeyScopesEntry(entopts)`

Create a new `ListApiKeyScopesEntry` entity instance. Pass `nil` for no initial
options.

#### `PaymentIframe(entopts)`

Create a new `PaymentIframe` entity instance. Pass `nil` for no initial
options.

#### `ThreeDSecureAuth(entopts)`

Create a new `ThreeDSecureAuth` entity instance. Pass `nil` for no initial
options.

#### `ThreeDSecureBrowserInit(entopts)`

Create a new `ThreeDSecureBrowserInit` entity instance. Pass `nil` for no initial
options.

#### `ThreeDSecureStatus(entopts)`

Create a new `ThreeDSecureStatus` entity instance. Pass `nil` for no initial
options.

#### `TransactionDetail(entopts)`

Create a new `TransactionDetail` entity instance. Pass `nil` for no initial
options.

#### `Webhook(entopts)`

Create a new `Webhook` entity instance. Pass `nil` for no initial
options.

#### `optionsMap() -> VMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> VMap`

Make a direct HTTP request to any API endpoint. Returns a result `VMap`
with `ok`, `status`, `headers`, and `data` (or `err` on failure).
This escape hatch never throws — branch on `result.entries["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `VMap` | Path parameter values. |
| `fetchargs["query"]` | `VMap` | Query string parameters. |
| `fetchargs["headers"]` | `VMap` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `VMap`

#### `prepare(fetchargs) throws -> VMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## AccountUpdater

```swift
let accountUpdater = client.AccountUpdater()
```

### Operations

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.AccountUpdater().remove(VMap([("account_id", .string("account_id")), ("subscription_id", .string("subscription_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdater` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterSchedule

```swift
let accountUpdaterSchedule = client.AccountUpdaterSchedule()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `Bool` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `[Value]` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.AccountUpdaterSchedule().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterScheduleWithResult

```swift
let accountUpdaterScheduleWithResult = client.AccountUpdaterScheduleWithResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `[Value]` | Yes |  |
| `created_at` | `String` | Yes |  |
| `enabled` | `Bool` | No |  |
| `expiry` | `String` | No |  |
| `id` | `String` | Yes |  |
| `most_recent_update` | `VMap` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `[Value]` | Yes |  |
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.AccountUpdaterScheduleWithResult().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.AccountUpdaterScheduleWithResult().list(nil, nil)
print(results)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResult

```swift
let accountUpdaterSubscriptionWithResult = client.AccountUpdaterSubscriptionWithResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String` | No |  |
| `enabled` | `Bool` | No |  |
| `id` | `String` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | No |  |
| `record` | `[Value]` | No |  |
| `response_format` | `String` | No |  |
| `template_ref` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.AccountUpdaterSubscriptionWithResult().create(VMap([
    ("account_id", .string("example_account_id")),  // String
    ("subscription_id", .string("example_subscription_id"))  // String
]), nil)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.AccountUpdaterSubscriptionWithResult().load(VMap([("account_id", .string("account_id")), ("subscription_id", .string("subscription_id"))]), nil)
```

#### `update(reqdata, ctrl) throws -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```swift
let result = try client.AccountUpdaterSubscriptionWithResult().update(VMap([
    ("account_id", .string("account_id")),
    ("subscription_id", .string("subscription_id"))
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## AccountUpdaterUpdate

```swift
let accountUpdaterUpdate = client.AccountUpdaterUpdate()
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
| `recurring_schedule` | `[Value]` | No |  |
| `status` | `String` | No |  |
| `update_id` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.AccountUpdaterUpdate().load(VMap([("id", .string("account_updater_update_id")), ("account_id", .string("account_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApiKey

```swift
let apiKey = client.ApiKey()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `[Value]` | No |  |
| `enabled` | `Bool` | No |  |
| `expires_at` | `String` | No |  |
| `expires_in` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | No |  |
| `method` | `[Value]` | No |  |
| `scope` | `[Value]` | No |  |
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.ApiKey().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.ApiKey().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.ApiKey().load(VMap([("id", .string("api_key_id")), ("account_id", .string("account_id"))]), nil)
```

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.ApiKey().remove(VMap([("id", .string("api_key_id")), ("account_id", .string("account_id"))]), nil)
```

#### `update(reqdata, ctrl) throws -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```swift
let result = try client.ApiKey().update(VMap([
    ("id", .string("api_key_id")),
    ("account_id", .string("account_id"))
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApiKey` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApplePayMerchantDetail

```swift
let applePayMerchantDetail = client.ApplePayMerchantDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `[Value]` | Yes |  |
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.ApplePayMerchantDetail().create(VMap([
    ("account_id", .int(1))  // Int
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.ApplePayMerchantDetail().list(nil, nil)
print(results)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ApplePaySession

```swift
let applePaySession = client.ApplePaySession()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String` | No |  |
| `domain_name` | `String` | No |  |
| `epoch_timestamp` | `Int` | No |  |
| `expires_at` | `Int` | No |  |
| `merchant_identifier` | `String` | No |  |
| `merchant_session_identifier` | `String` | No |  |
| `nonce` | `Int` | No |  |
| `operational_analytics_identifier` | `String` | No |  |
| `referrer` | `String` | Yes |  |
| `retry` | `Int` | No |  |
| `signature` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.ApplePaySession().create(VMap([
    ("account_id", .int(1))  // Int
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePaySession` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DynamicDescriptor

```swift
let dynamicDescriptor = client.DynamicDescriptor()
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.DynamicDescriptor().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.DynamicDescriptor().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.DynamicDescriptor().load(VMap([("id", .string("dynamic_descriptor_id")), ("account_id", .string("account_id"))]), nil)
```

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.DynamicDescriptor().remove(VMap([("id", .string("dynamic_descriptor_id")), ("account_id", .string("account_id"))]), nil)
```

#### `update(reqdata, ctrl) throws -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```swift
let result = try client.DynamicDescriptor().update(VMap([
    ("id", .string("dynamic_descriptor_id")),
    ("account_id", .string("account_id"))
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## IFrameCreateInstance

```swift
let iFrameCreateInstance = client.IFrameCreateInstance()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String` | No |  |
| `currency` | `String` | No |  |
| `customer` | `VMap` | No |  |
| `initialize_transaction` | `Bool` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `reference` | `String` | No |  |
| `timeout` | `Double` | No |  |
| `token` | `[Value]` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.IFrameCreateInstance().create(VMap([
    ("account_id", .string("example_account_id")),  // String
    ("payment_iframe_id", .string("example_payment_iframe_id"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## IFrameInstance

```swift
let iFrameInstance = client.IFrameInstance()
```

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.IFrameInstance().load(VMap([("id", .string("i_frame_instance_id")), ("account_id", .string("account_id")), ("payment_iframe_id", .string("payment_iframe_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameInstance` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Iframe

```swift
let iframe = client.Iframe()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `VMap` | No |  |
| `allowed_parent_domain` | `[Value]` | Yes |  |
| `allowed_payment_method` | `[Value]` | Yes |  |
| `card_setting` | `VMap` | No |  |
| `click_to_pay_setting` | `VMap` | No |  |
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Iframe().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Iframe().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Iframe().load(VMap([("account_id", .string("account_id")), ("iframe_id", .string("iframe_id"))]), nil)
```

#### `update(reqdata, ctrl) throws -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```swift
let result = try client.Iframe().update(VMap([
    ("account_id", .string("account_id")),
    ("iframe_id", .string("iframe_id"))
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Iframe` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Init

```swift
let init_ = client.Init()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `VMap` | No |  |
| `description` | `String` | No |  |
| `item` | `[Value]` | No |  |
| `level2` | `VMap` | No |  |
| `level3` | `VMap` | No |  |
| `shipping_address` | `VMap` | Yes |  |
| `trace` | `VMap` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Init().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Init` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ListApiKeyScopesEntry

```swift
let listApiKeyScopesEntry = client.ListApiKeyScopesEntry()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `description` | `String` | No |  |
| `enabled` | `Bool` | No |  |
| `level` | `Int` | No |  |
| `scope` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.ListApiKeyScopesEntry().list(nil, nil)
print(results)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## PaymentIframe

```swift
let paymentIframe = client.PaymentIframe()
```

### Operations

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.PaymentIframe().remove(VMap([("account_id", .string("account_id")), ("id", .string("id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `PaymentIframe` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureAuth

```swift
let threeDSecureAuth = client.ThreeDSecureAuth()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `VMap` | Yes |  |
| `card` | `VMap` | Yes |  |
| `challenge` | `VMap` | No |  |
| `customer` | `VMap` | No |  |
| `purchase` | `VMap` | Yes |  |
| `server_transaction_id` | `String` | No |  |
| `shipping` | `VMap` | Yes |  |
| `status` | `String` | No |  |
| `three_d_secure_challenge_indicator` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |
| `trace` | `VMap` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.ThreeDSecureAuth().create(VMap([
    ("3_d_id", .string("example_3_d_id")),  // String
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureBrowserInit

```swift
let threeDSecureBrowserInit = client.ThreeDSecureBrowserInit()
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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.ThreeDSecureBrowserInit().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## ThreeDSecureStatus

```swift
let threeDSecureStatus = client.ThreeDSecureStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `VMap` | No |  |
| `info` | `VMap` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure` | `VMap` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.ThreeDSecureStatus().load(VMap([("3_d_id", .string("3_d_id")), ("account_id", .string("account_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## TransactionDetail

```swift
let transactionDetail = client.TransactionDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `VMap` | Yes |  |
| `auth` | `VMap` | Yes |  |
| `card` | `VMap` | No |  |
| `customer` | `VMap` | No |  |
| `description` | `String` | No |  |
| `id` | `String` | No |  |
| `item` | `[Value]` | No |  |
| `level2` | `VMap` | No |  |
| `level3` | `VMap` | No |  |
| `override` | `VMap` | No |  |
| `shipping_address` | `VMap` | Yes |  |
| `status` | `String` | Yes |  |
| `timestamp` | `String` | No |  |
| `trace` | `VMap` | No |  |

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

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.TransactionDetail().load(VMap([("account_id", .string("account_id")), ("transaction_id", .string("transaction_id"))]), nil)
```

#### `update(reqdata, ctrl) throws -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```swift
let result = try client.TransactionDetail().update(VMap([
    ("account_id", .string("account_id")),
    ("transaction_id", .string("transaction_id"))
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Webhook

```swift
let webhook = client.Webhook()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String` | Yes |  |
| `id` | `String` | No |  |
| `url` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Webhook().create(VMap([
    ("account_id", .string("example_account_id"))  // String
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Webhook().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Webhook().load(VMap([("id", .string("webhook_id")), ("account_id", .string("account_id"))]), nil)
```

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.Webhook().remove(VMap([("id", .string("webhook_id")), ("account_id", .string("account_id"))]), nil)
```

#### `update(reqdata, ctrl) throws -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```swift
let result = try client.Webhook().update(VMap([
    ("id", .string("webhook_id")),
    ("account_id", .string("account_id"))
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

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

```swift
let feature = VMap()
feature.entries["test"] = .map([("active", .bool(true))])
let options = VMap()
options.entries["feature"] = .map(feature)
let client = BluefinPayconexSDK(options)
```

