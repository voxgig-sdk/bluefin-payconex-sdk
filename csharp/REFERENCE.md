# BluefinPayconex C# SDK Reference

Complete API reference for the BluefinPayconex C# SDK.


## BluefinPayconexSDK

### Constructor

```csharp
using BluefinPayconexSdk;

var client = new BluefinPayconexSDK(options);
```

Create a new SDK client instance. `options` is a
`Dictionary<string, object?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Dictionary` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `Dictionary` | Custom headers for all requests. |
| `options["feature"]` | `Dictionary` | Feature configuration. |
| `options["system"]` | `Dictionary` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK.TestSDK(testopts = null, sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```csharp
var client = BluefinPayconexSDK.TestSDK(null, null);
```


### Instance Methods

#### `AccountUpdater(entopts = null)`

Create a new `AccountUpdater` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `AccountUpdaterSchedule(entopts = null)`

Create a new `AccountUpdaterSchedule` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `AccountUpdaterScheduleWithResult(entopts = null)`

Create a new `AccountUpdaterScheduleWithResult` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `AccountUpdaterSubscriptionWithResult(entopts = null)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `AccountUpdaterUpdate(entopts = null)`

Create a new `AccountUpdaterUpdate` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `ApiKey(entopts = null)`

Create a new `ApiKey` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `ApplePayMerchantDetail(entopts = null)`

Create a new `ApplePayMerchantDetail` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `ApplePaySession(entopts = null)`

Create a new `ApplePaySession` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `DynamicDescriptor(entopts = null)`

Create a new `DynamicDescriptor` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `IFrameCreateInstance(entopts = null)`

Create a new `IFrameCreateInstance` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `IFrameInstance(entopts = null)`

Create a new `IFrameInstance` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `Iframe(entopts = null)`

Create a new `Iframe` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `Init(entopts = null)`

Create a new `Init` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `ListApiKeyScopesEntry(entopts = null)`

Create a new `ListApiKeyScopesEntry` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `PaymentIframe(entopts = null)`

Create a new `PaymentIframe` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `ThreeDSecureAuth(entopts = null)`

Create a new `ThreeDSecureAuth` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `ThreeDSecureBrowserInit(entopts = null)`

Create a new `ThreeDSecureBrowserInit` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `ThreeDSecureStatus(entopts = null)`

Create a new `ThreeDSecureStatus` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `TransactionDetail(entopts = null)`

Create a new `TransactionDetail` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `Webhook(entopts = null)`

Create a new `Webhook` entity instance (returns
`BluefinPayconexEntityBase`). Pass `null` for no initial options.

#### `OptionsMap() -> Dictionary`

Return a deep copy of the current SDK options.

#### `GetUtility() -> Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs = null) -> Dictionary`

Make a direct HTTP request to any API endpoint. Returns a result
`Dictionary<string, object?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Dictionary` | Path parameter values. |
| `fetchargs["query"]` | `Dictionary` | Query string parameters. |
| `fetchargs["headers"]` | `Dictionary` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `object?` | Request body (dictionaries are JSON-serialized). |

**Returns:** `Dictionary<string, object?>`

#### `Prepare(fetchargs = null) -> Dictionary`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AccountUpdater

```csharp
var accountUpdater = client.AccountUpdater();
```

### Operations

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.AccountUpdater().Remove(new Dictionary<string, object?> { ["account_id"] = "account_id", ["subscription_id"] = "subscription_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `AccountUpdater` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## AccountUpdaterSchedule

```csharp
var accountUpdaterSchedule = client.AccountUpdaterSchedule();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `List<object?>` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.AccountUpdaterSchedule().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## AccountUpdaterScheduleWithResult

```csharp
var accountUpdaterScheduleWithResult = client.AccountUpdaterScheduleWithResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `List<object?>` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `Dictionary<string, object?>` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `List<object?>` | Yes |  |
| `type` | `string` | Yes |  |
| `updated_at` | `string` | Yes |  |

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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.AccountUpdaterScheduleWithResult().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.AccountUpdaterScheduleWithResult().List(null);
Console.WriteLine(results);
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResult

```csharp
var accountUpdaterSubscriptionWithResult = client.AccountUpdaterSubscriptionWithResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `List<object?>` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.AccountUpdaterSubscriptionWithResult().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
    ["subscription_id"] = "example_subscription_id",  // string
});
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.AccountUpdaterSubscriptionWithResult().Load(new Dictionary<string, object?> { ["account_id"] = "account_id", ["subscription_id"] = "subscription_id" });
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.AccountUpdaterSubscriptionWithResult().Update(new Dictionary<string, object?>
{
    ["account_id"] = "account_id",
    ["subscription_id"] = "subscription_id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## AccountUpdaterUpdate

```csharp
var accountUpdaterUpdate = client.AccountUpdaterUpdate();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `string` | No |  |
| `format` | `string` | No |  |
| `id` | `string` | No |  |
| `new_expiry` | `string` | No |  |
| `new_token` | `string` | No |  |
| `old_expiry` | `string` | No |  |
| `old_token` | `string` | No |  |
| `recurring_schedule` | `List<object?>` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.AccountUpdaterUpdate().Load(new Dictionary<string, object?> { ["id"] = "account_updater_update_id", ["account_id"] = "account_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## ApiKey

```csharp
var apiKey = client.ApiKey();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `List<object?>` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `List<object?>` | No |  |
| `scope` | `List<object?>` | No |  |
| `secret` | `string` | No |  |

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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.ApiKey().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.ApiKey().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.ApiKey().Load(new Dictionary<string, object?> { ["id"] = "api_key_id", ["account_id"] = "account_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.ApiKey().Remove(new Dictionary<string, object?> { ["id"] = "api_key_id", ["account_id"] = "account_id" });
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.ApiKey().Update(new Dictionary<string, object?>
{
    ["id"] = "api_key_id",
    ["account_id"] = "account_id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `ApiKey` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## ApplePayMerchantDetail

```csharp
var applePayMerchantDetail = client.ApplePayMerchantDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `List<object?>` | Yes |  |
| `merchant_url` | `string` | Yes |  |
| `partner_merchant_name` | `string` | No |  |
| `payconex_account_id` | `string` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `domain` | - | - |
| `merchant_url` | - | Yes |
| `partner_merchant_name` | - | - |
| `payconex_account_id` | - | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.ApplePayMerchantDetail().Create(new Dictionary<string, object?>
{
    ["account_id"] = 1L,  // long
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.ApplePayMerchantDetail().List(null);
Console.WriteLine(results);
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## ApplePaySession

```csharp
var applePaySession = client.ApplePaySession();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `string` | No |  |
| `domain_name` | `string` | No |  |
| `epoch_timestamp` | `long` | No |  |
| `expires_at` | `long` | No |  |
| `merchant_identifier` | `string` | No |  |
| `merchant_session_identifier` | `string` | No |  |
| `nonce` | `long` | No |  |
| `operational_analytics_identifier` | `string` | No |  |
| `referrer` | `string` | Yes |  |
| `retry` | `long` | No |  |
| `signature` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.ApplePaySession().Create(new Dictionary<string, object?>
{
    ["account_id"] = 1L,  // long
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `ApplePaySession` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DynamicDescriptor

```csharp
var dynamicDescriptor = client.DynamicDescriptor();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `string` | No |  |
| `descriptor` | `string` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `state` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.DynamicDescriptor().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.DynamicDescriptor().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.DynamicDescriptor().Load(new Dictionary<string, object?> { ["id"] = "dynamic_descriptor_id", ["account_id"] = "account_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.DynamicDescriptor().Remove(new Dictionary<string, object?> { ["id"] = "dynamic_descriptor_id", ["account_id"] = "account_id" });
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.DynamicDescriptor().Update(new Dictionary<string, object?>
{
    ["id"] = "dynamic_descriptor_id",
    ["account_id"] = "account_id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## IFrameCreateInstance

```csharp
var iFrameCreateInstance = client.IFrameCreateInstance();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `Dictionary<string, object?>` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `double` | No |  |
| `token` | `List<object?>` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.IFrameCreateInstance().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
    ["payment_iframe_id"] = "example_payment_iframe_id",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## IFrameInstance

```csharp
var iFrameInstance = client.IFrameInstance();
```

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.IFrameInstance().Load(new Dictionary<string, object?> { ["id"] = "i_frame_instance_id", ["account_id"] = "account_id", ["payment_iframe_id"] = "payment_iframe_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `IFrameInstance` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Iframe

```csharp
var iframe = client.Iframe();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Dictionary<string, object?>` | No |  |
| `allowed_parent_domain` | `List<object?>` | Yes |  |
| `allowed_payment_method` | `List<object?>` | Yes |  |
| `card_setting` | `Dictionary<string, object?>` | No |  |
| `click_to_pay_setting` | `Dictionary<string, object?>` | No |  |
| `currency` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
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

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Iframe().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Iframe().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Iframe().Load(new Dictionary<string, object?> { ["account_id"] = "account_id", ["iframe_id"] = "iframe_id" });
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.Iframe().Update(new Dictionary<string, object?>
{
    ["account_id"] = "account_id",
    ["iframe_id"] = "iframe_id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Iframe` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Init

```csharp
var init = client.Init();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Dictionary<string, object?>` | No |  |
| `description` | `string` | No |  |
| `item` | `List<object?>` | No |  |
| `level2` | `Dictionary<string, object?>` | No |  |
| `level3` | `Dictionary<string, object?>` | No |  |
| `shipping_address` | `Dictionary<string, object?>` | Yes |  |
| `trace` | `Dictionary<string, object?>` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Init().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Init` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## ListApiKeyScopesEntry

```csharp
var listApiKeyScopesEntry = client.ListApiKeyScopesEntry();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `description` | `string` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `long` | No |  |
| `scope` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.ListApiKeyScopesEntry().List(null);
Console.WriteLine(results);
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## PaymentIframe

```csharp
var paymentIframe = client.PaymentIframe();
```

### Operations

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.PaymentIframe().Remove(new Dictionary<string, object?> { ["account_id"] = "account_id", ["id"] = "id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `PaymentIframe` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## ThreeDSecureAuth

```csharp
var threeDSecureAuth = client.ThreeDSecureAuth();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Dictionary<string, object?>` | Yes |  |
| `card` | `Dictionary<string, object?>` | Yes |  |
| `challenge` | `Dictionary<string, object?>` | No |  |
| `customer` | `Dictionary<string, object?>` | No |  |
| `purchase` | `Dictionary<string, object?>` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `Dictionary<string, object?>` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `Dictionary<string, object?>` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.ThreeDSecureAuth().Create(new Dictionary<string, object?>
{
    ["3_d_id"] = "example_3_d_id",  // string
    ["account_id"] = "example_account_id",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## ThreeDSecureBrowserInit

```csharp
var threeDSecureBrowserInit = client.ThreeDSecureBrowserInit();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `string` | No |  |
| `acs_url` | `string` | No |  |
| `cvv` | `string` | No |  |
| `expiry` | `string` | Yes |  |
| `pan` | `string` | Yes |  |
| `payment_details_reference` | `string` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure_data` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.ThreeDSecureBrowserInit().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## ThreeDSecureStatus

```csharp
var threeDSecureStatus = client.ThreeDSecureStatus();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Dictionary<string, object?>` | No |  |
| `info` | `Dictionary<string, object?>` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `Dictionary<string, object?>` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.ThreeDSecureStatus().Load(new Dictionary<string, object?> { ["3_d_id"] = "3_d_id", ["account_id"] = "account_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## TransactionDetail

```csharp
var transactionDetail = client.TransactionDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Dictionary<string, object?>` | Yes |  |
| `auth` | `Dictionary<string, object?>` | Yes |  |
| `card` | `Dictionary<string, object?>` | No |  |
| `customer` | `Dictionary<string, object?>` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `List<object?>` | No |  |
| `level2` | `Dictionary<string, object?>` | No |  |
| `level3` | `Dictionary<string, object?>` | No |  |
| `override` | `Dictionary<string, object?>` | No |  |
| `shipping_address` | `Dictionary<string, object?>` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `Dictionary<string, object?>` | No |  |

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

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.TransactionDetail().Load(new Dictionary<string, object?> { ["account_id"] = "account_id", ["transaction_id"] = "transaction_id" });
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.TransactionDetail().Update(new Dictionary<string, object?>
{
    ["account_id"] = "account_id",
    ["transaction_id"] = "transaction_id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `TransactionDetail` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Webhook

```csharp
var webhook = client.Webhook();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Webhook().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Webhook().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Webhook().Load(new Dictionary<string, object?> { ["id"] = "webhook_id", ["account_id"] = "account_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.Webhook().Remove(new Dictionary<string, object?> { ["id"] = "webhook_id", ["account_id"] = "account_id" });
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.Webhook().Update(new Dictionary<string, object?>
{
    ["id"] = "webhook_id",
    ["account_id"] = "account_id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Webhook` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```csharp
var client = new BluefinPayconexSDK(new Dictionary<string, object?>
{
    ["feature"] = new Dictionary<string, object?>
    {
        ["test"] = new Dictionary<string, object?> { ["active"] = true },
    },
});
```

