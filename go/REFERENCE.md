# BluefinPayconex Golang SDK Reference

Complete API reference for the BluefinPayconex Golang SDK.


## BluefinPayconexSDK

### Constructor

```go
func NewBluefinPayconexSDK(options map[string]any) *BluefinPayconexSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *BluefinPayconexSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *BluefinPayconexSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `AccountUpdater(data map[string]any) BluefinPayconexEntity`

Create a new `AccountUpdater` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterSchedule(data map[string]any) BluefinPayconexEntity`

Create a new `AccountUpdaterSchedule` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterScheduleWithResult(data map[string]any) BluefinPayconexEntity`

Create a new `AccountUpdaterScheduleWithResult` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterSubscriptionWithResult(data map[string]any) BluefinPayconexEntity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterUpdate(data map[string]any) BluefinPayconexEntity`

Create a new `AccountUpdaterUpdate` entity instance. Pass `nil` for no initial data.

#### `ApiKey(data map[string]any) BluefinPayconexEntity`

Create a new `ApiKey` entity instance. Pass `nil` for no initial data.

#### `ApplePayMerchantDetail(data map[string]any) BluefinPayconexEntity`

Create a new `ApplePayMerchantDetail` entity instance. Pass `nil` for no initial data.

#### `ApplePaySession(data map[string]any) BluefinPayconexEntity`

Create a new `ApplePaySession` entity instance. Pass `nil` for no initial data.

#### `DynamicDescriptor(data map[string]any) BluefinPayconexEntity`

Create a new `DynamicDescriptor` entity instance. Pass `nil` for no initial data.

#### `IFrameCreateInstance(data map[string]any) BluefinPayconexEntity`

Create a new `IFrameCreateInstance` entity instance. Pass `nil` for no initial data.

#### `IFrameInstance(data map[string]any) BluefinPayconexEntity`

Create a new `IFrameInstance` entity instance. Pass `nil` for no initial data.

#### `Iframe(data map[string]any) BluefinPayconexEntity`

Create a new `Iframe` entity instance. Pass `nil` for no initial data.

#### `Init(data map[string]any) BluefinPayconexEntity`

Create a new `Init` entity instance. Pass `nil` for no initial data.

#### `ListApiKeyScopesEntry(data map[string]any) BluefinPayconexEntity`

Create a new `ListApiKeyScopesEntry` entity instance. Pass `nil` for no initial data.

#### `PaymentIframe(data map[string]any) BluefinPayconexEntity`

Create a new `PaymentIframe` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureAuth(data map[string]any) BluefinPayconexEntity`

Create a new `ThreeDSecureAuth` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureBrowserInit(data map[string]any) BluefinPayconexEntity`

Create a new `ThreeDSecureBrowserInit` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureStatus(data map[string]any) BluefinPayconexEntity`

Create a new `ThreeDSecureStatus` entity instance. Pass `nil` for no initial data.

#### `TransactionDetail(data map[string]any) BluefinPayconexEntity`

Create a new `TransactionDetail` entity instance. Pass `nil` for no initial data.

#### `Webhook(data map[string]any) BluefinPayconexEntity`

Create a new `Webhook` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## AccountUpdaterEntity

```go
accountUpdater := client.AccountUpdater(nil)
fmt.Println(accountUpdater.GetName()) // "account_updater"
```

### Operations

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.AccountUpdater(nil).Remove(map[string]any{"account_id": "account_id", "subscription_id": "subscription_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AccountUpdaterEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```go
accountUpdaterSchedule := client.AccountUpdaterSchedule(nil)
fmt.Println(accountUpdaterSchedule.GetName()) // "account_updater_schedule"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `[]any` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.AccountUpdaterSchedule(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AccountUpdaterScheduleEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```go
accountUpdaterScheduleWithResult := client.AccountUpdaterScheduleWithResult(nil)
fmt.Println(accountUpdaterScheduleWithResult.GetName()) // "account_updater_schedule_with_result"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `[]any` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `map[string]any` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `[]any` | Yes |  |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.AccountUpdaterScheduleWithResult(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.AccountUpdaterScheduleWithResult(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```go
accountUpdaterSubscriptionWithResult := client.AccountUpdaterSubscriptionWithResult(nil)
fmt.Println(accountUpdaterSubscriptionWithResult.GetName()) // "account_updater_subscription_with_result"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `[]any` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.AccountUpdaterSubscriptionWithResult(nil).Load(map[string]any{"account_id": "account_id", "subscription_id": "subscription_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.AccountUpdaterSubscriptionWithResult(nil).Create(map[string]any{
    "account_id": "example_account_id",
    "subscription_id": "example_subscription_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.AccountUpdaterSubscriptionWithResult(nil).Update(map[string]any{
    "account_id": "account_id",
    "subscription_id": "subscription_id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```go
accountUpdaterUpdate := client.AccountUpdaterUpdate(nil)
fmt.Println(accountUpdaterUpdate.GetName()) // "account_updater_update"
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
| `recurring_schedule` | `[]any` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.AccountUpdaterUpdate(nil).Load(map[string]any{"id": "account_updater_update_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AccountUpdaterUpdateEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ApiKeyEntity

```go
apiKey := client.ApiKey(nil)
fmt.Println(apiKey.GetName()) // "api_key"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `[]any` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `[]any` | No |  |
| `scope` | `[]any` | No |  |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.ApiKey(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.ApiKey(nil).Load(map[string]any{"id": "api_key_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.ApiKey(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.ApiKey(nil).Update(map[string]any{
    "id": "api_key_id",
    "account_id": "account_id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.ApiKey(nil).Remove(map[string]any{"id": "api_key_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ApiKeyEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```go
applePayMerchantDetail := client.ApplePayMerchantDetail(nil)
fmt.Println(applePayMerchantDetail.GetName()) // "apple_pay_merchant_detail"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `[]any` | Yes |  |
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.ApplePayMerchantDetail(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.ApplePayMerchantDetail(nil).Create(map[string]any{
    "account_id": 1,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ApplePayMerchantDetailEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ApplePaySessionEntity

```go
applePaySession := client.ApplePaySession(nil)
fmt.Println(applePaySession.GetName()) // "apple_pay_session"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `string` | No |  |
| `domain_name` | `string` | No |  |
| `epoch_timestamp` | `int` | No |  |
| `expires_at` | `int` | No |  |
| `merchant_identifier` | `string` | No |  |
| `merchant_session_identifier` | `string` | No |  |
| `nonce` | `int` | No |  |
| `operational_analytics_identifier` | `string` | No |  |
| `referrer` | `string` | Yes |  |
| `retry` | `int` | No |  |
| `signature` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.ApplePaySession(nil).Create(map[string]any{
    "account_id": 1,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ApplePaySessionEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DynamicDescriptorEntity

```go
dynamicDescriptor := client.DynamicDescriptor(nil)
fmt.Println(dynamicDescriptor.GetName()) // "dynamic_descriptor"
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.DynamicDescriptor(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.DynamicDescriptor(nil).Load(map[string]any{"id": "dynamic_descriptor_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.DynamicDescriptor(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.DynamicDescriptor(nil).Update(map[string]any{
    "id": "dynamic_descriptor_id",
    "account_id": "account_id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.DynamicDescriptor(nil).Remove(map[string]any{"id": "dynamic_descriptor_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DynamicDescriptorEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## IFrameCreateInstanceEntity

```go
iFrameCreateInstance := client.IFrameCreateInstance(nil)
fmt.Println(iFrameCreateInstance.GetName()) // "i_frame_create_instance"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `map[string]any` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `float64` | No |  |
| `token` | `[]any` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.IFrameCreateInstance(nil).Create(map[string]any{
    "account_id": "example_account_id",
    "payment_iframe_id": "example_payment_iframe_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `IFrameCreateInstanceEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## IFrameInstanceEntity

```go
iFrameInstance := client.IFrameInstance(nil)
fmt.Println(iFrameInstance.GetName()) // "i_frame_instance"
```

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.IFrameInstance(nil).Load(map[string]any{"id": "i_frame_instance_id", "account_id": "account_id", "payment_iframe_id": "payment_iframe_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `IFrameInstanceEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## IframeEntity

```go
iframe := client.Iframe(nil)
fmt.Println(iframe.GetName()) // "iframe"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `map[string]any` | No |  |
| `allowed_parent_domain` | `[]any` | Yes |  |
| `allowed_payment_method` | `[]any` | Yes |  |
| `card_setting` | `map[string]any` | No |  |
| `click_to_pay_setting` | `map[string]any` | No |  |
| `currency` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `timeout` | `float64` | No |  |

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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Iframe(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Iframe(nil).Load(map[string]any{"account_id": "account_id", "iframe_id": "iframe_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Iframe(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.Iframe(nil).Update(map[string]any{
    "account_id": "account_id",
    "iframe_id": "iframe_id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `IframeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## InitEntity

```go
init := client.Init(nil)
fmt.Println(init.GetName()) // "init"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `map[string]any` | No |  |
| `description` | `string` | No |  |
| `item` | `[]any` | No |  |
| `level2` | `map[string]any` | No |  |
| `level3` | `map[string]any` | No |  |
| `shipping_address` | `map[string]any` | Yes |  |
| `trace` | `map[string]any` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Init(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `InitEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```go
listApiKeyScopesEntry := client.ListApiKeyScopesEntry(nil)
fmt.Println(listApiKeyScopesEntry.GetName()) // "list_api_key_scopes_entry"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `description` | `string` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `int` | No |  |
| `scope` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.ListApiKeyScopesEntry(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ListApiKeyScopesEntryEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PaymentIframeEntity

```go
paymentIframe := client.PaymentIframe(nil)
fmt.Println(paymentIframe.GetName()) // "payment_iframe"
```

### Operations

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.PaymentIframe(nil).Remove(map[string]any{"account_id": "account_id", "id": "id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PaymentIframeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ThreeDSecureAuthEntity

```go
threeDSecureAuth := client.ThreeDSecureAuth(nil)
fmt.Println(threeDSecureAuth.GetName()) // "three_d_secure_auth"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `map[string]any` | Yes |  |
| `card` | `map[string]any` | Yes |  |
| `challenge` | `map[string]any` | No |  |
| `customer` | `map[string]any` | No |  |
| `purchase` | `map[string]any` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `map[string]any` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `map[string]any` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.ThreeDSecureAuth(nil).Create(map[string]any{
    "3_d_id": "example_3_d_id",
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ThreeDSecureAuthEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```go
threeDSecureBrowserInit := client.ThreeDSecureBrowserInit(nil)
fmt.Println(threeDSecureBrowserInit.GetName()) // "three_d_secure_browser_init"
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

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.ThreeDSecureBrowserInit(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ThreeDSecureStatusEntity

```go
threeDSecureStatus := client.ThreeDSecureStatus(nil)
fmt.Println(threeDSecureStatus.GetName()) // "three_d_secure_status"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `map[string]any` | No |  |
| `info` | `map[string]any` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `map[string]any` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.ThreeDSecureStatus(nil).Load(map[string]any{"3_d_id": "3_d_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ThreeDSecureStatusEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TransactionDetailEntity

```go
transactionDetail := client.TransactionDetail(nil)
fmt.Println(transactionDetail.GetName()) // "transaction_detail"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `map[string]any` | Yes |  |
| `auth` | `map[string]any` | Yes |  |
| `card` | `map[string]any` | No |  |
| `customer` | `map[string]any` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `[]any` | No |  |
| `level2` | `map[string]any` | No |  |
| `level3` | `map[string]any` | No |  |
| `override` | `map[string]any` | No |  |
| `shipping_address` | `map[string]any` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `map[string]any` | No |  |

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

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.TransactionDetail(nil).Load(map[string]any{"account_id": "account_id", "transaction_id": "transaction_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.TransactionDetail(nil).Update(map[string]any{
    "account_id": "account_id",
    "transaction_id": "transaction_id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TransactionDetailEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## WebhookEntity

```go
webhook := client.Webhook(nil)
fmt.Println(webhook.GetName()) // "webhook"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Webhook(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Webhook(nil).Load(map[string]any{"id": "webhook_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Webhook(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.Webhook(nil).Update(map[string]any{
    "id": "webhook_id",
    "account_id": "account_id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.Webhook(nil).Remove(map[string]any{"id": "webhook_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `WebhookEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewBluefinPayconexSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

