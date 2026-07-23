# BluefinPayconex Lua SDK Reference

Complete API reference for the BluefinPayconex Lua SDK.


## BluefinPayconexSDK

### Constructor

```lua
local sdk = require("bluefin-payconex_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `AccountUpdater(data)`

Create a new `AccountUpdater` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterSchedule(data)`

Create a new `AccountUpdaterSchedule` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterScheduleWithResult(data)`

Create a new `AccountUpdaterScheduleWithResult` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterSubscriptionWithResult(data)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterUpdate(data)`

Create a new `AccountUpdaterUpdate` entity instance. Pass `nil` for no initial data.

#### `ApiKey(data)`

Create a new `ApiKey` entity instance. Pass `nil` for no initial data.

#### `ApplePayMerchantDetail(data)`

Create a new `ApplePayMerchantDetail` entity instance. Pass `nil` for no initial data.

#### `ApplePaySession(data)`

Create a new `ApplePaySession` entity instance. Pass `nil` for no initial data.

#### `DynamicDescriptor(data)`

Create a new `DynamicDescriptor` entity instance. Pass `nil` for no initial data.

#### `IFrameCreateInstance(data)`

Create a new `IFrameCreateInstance` entity instance. Pass `nil` for no initial data.

#### `IFrameInstance(data)`

Create a new `IFrameInstance` entity instance. Pass `nil` for no initial data.

#### `Iframe(data)`

Create a new `Iframe` entity instance. Pass `nil` for no initial data.

#### `Init(data)`

Create a new `Init` entity instance. Pass `nil` for no initial data.

#### `ListApiKeyScopesEntry(data)`

Create a new `ListApiKeyScopesEntry` entity instance. Pass `nil` for no initial data.

#### `PaymentIframe(data)`

Create a new `PaymentIframe` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureAuth(data)`

Create a new `ThreeDSecureAuth` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureBrowserInit(data)`

Create a new `ThreeDSecureBrowserInit` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureStatus(data)`

Create a new `ThreeDSecureStatus` entity instance. Pass `nil` for no initial data.

#### `TransactionDetail(data)`

Create a new `TransactionDetail` entity instance. Pass `nil` for no initial data.

#### `Webhook(data)`

Create a new `Webhook` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## AccountUpdaterEntity

```lua
local account_updater = client:AccountUpdater(nil)
```

### Operations

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:AccountUpdater():remove({ account_id = "account_id", subscription_id = "subscription_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```lua
local account_updater_schedule = client:AccountUpdaterSchedule(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `boolean` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `table` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:AccountUpdaterSchedule():create({
  account_id = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```lua
local account_updater_schedule_with_result = client:AccountUpdaterScheduleWithResult(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `table` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `boolean` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `table` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `table` | Yes |  |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:AccountUpdaterScheduleWithResult():create({
  account_id = --[[ string ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:AccountUpdaterScheduleWithResult():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```lua
local account_updater_subscription_with_result = client:AccountUpdaterSubscriptionWithResult(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `boolean` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `table` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:AccountUpdaterSubscriptionWithResult():create({
  account_id = --[[ string ]],
  subscription_id = --[[ string ]],
})
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:AccountUpdaterSubscriptionWithResult():load({ account_id = "account_id", subscription_id = "subscription_id" })
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:AccountUpdaterSubscriptionWithResult():update({
  account_id = "account_id",
  subscription_id = "subscription_id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```lua
local account_updater_update = client:AccountUpdaterUpdate(nil)
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
| `recurring_schedule` | `table` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:AccountUpdaterUpdate():load({ id = "account_updater_update_id", account_id = "account_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterUpdateEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ApiKeyEntity

```lua
local api_key = client:ApiKey(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `table` | No |  |
| `enabled` | `boolean` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `table` | No |  |
| `scope` | `table` | No |  |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:ApiKey():create({
  account_id = --[[ string ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:ApiKey():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:ApiKey():load({ id = "api_key_id", account_id = "account_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:ApiKey():remove({ id = "api_key_id", account_id = "account_id" })
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:ApiKey():update({
  id = "api_key_id",
  account_id = "account_id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ApiKeyEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```lua
local apple_pay_merchant_detail = client:ApplePayMerchantDetail(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `table` | Yes |  |
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:ApplePayMerchantDetail():create({
  account_id = --[[ number ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:ApplePayMerchantDetail():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePayMerchantDetailEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ApplePaySessionEntity

```lua
local apple_pay_session = client:ApplePaySession(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `string` | No |  |
| `domain_name` | `string` | No |  |
| `epoch_timestamp` | `number` | No |  |
| `expires_at` | `number` | No |  |
| `merchant_identifier` | `string` | No |  |
| `merchant_session_identifier` | `string` | No |  |
| `nonce` | `number` | No |  |
| `operational_analytics_identifier` | `string` | No |  |
| `referrer` | `string` | Yes |  |
| `retry` | `number` | No |  |
| `signature` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:ApplePaySession():create({
  account_id = --[[ number ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePaySessionEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DynamicDescriptorEntity

```lua
local dynamic_descriptor = client:DynamicDescriptor(nil)
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:DynamicDescriptor():create({
  account_id = --[[ string ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:DynamicDescriptor():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:DynamicDescriptor():load({ id = "dynamic_descriptor_id", account_id = "account_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:DynamicDescriptor():remove({ id = "dynamic_descriptor_id", account_id = "account_id" })
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:DynamicDescriptor():update({
  id = "dynamic_descriptor_id",
  account_id = "account_id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DynamicDescriptorEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## IFrameCreateInstanceEntity

```lua
local i_frame_create_instance = client:IFrameCreateInstance(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `table` | No |  |
| `initialize_transaction` | `boolean` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `number` | No |  |
| `token` | `table` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:IFrameCreateInstance():create({
  account_id = --[[ string ]],
  payment_iframe_id = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameCreateInstanceEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## IFrameInstanceEntity

```lua
local i_frame_instance = client:IFrameInstance(nil)
```

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:IFrameInstance():load({ id = "i_frame_instance_id", account_id = "account_id", payment_iframe_id = "payment_iframe_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameInstanceEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## IframeEntity

```lua
local iframe = client:Iframe(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `table` | No |  |
| `allowed_parent_domain` | `table` | Yes |  |
| `allowed_payment_method` | `table` | Yes |  |
| `card_setting` | `table` | No |  |
| `click_to_pay_setting` | `table` | No |  |
| `currency` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `timeout` | `number` | No |  |

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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Iframe():create({
  account_id = --[[ string ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Iframe():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Iframe():load({ account_id = "account_id", iframe_id = "iframe_id" })
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:Iframe():update({
  account_id = "account_id",
  iframe_id = "iframe_id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IframeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## InitEntity

```lua
local init = client:Init(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `table` | No |  |
| `description` | `string` | No |  |
| `item` | `table` | No |  |
| `level2` | `table` | No |  |
| `level3` | `table` | No |  |
| `shipping_address` | `table` | Yes |  |
| `trace` | `table` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Init():create({
  account_id = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `InitEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```lua
local list_api_key_scopes_entry = client:ListApiKeyScopesEntry(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `description` | `string` | No |  |
| `enabled` | `boolean` | No |  |
| `level` | `number` | No |  |
| `scope` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:ListApiKeyScopesEntry():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ListApiKeyScopesEntryEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PaymentIframeEntity

```lua
local payment_iframe = client:PaymentIframe(nil)
```

### Operations

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:PaymentIframe():remove({ account_id = "account_id", id = "id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PaymentIframeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ThreeDSecureAuthEntity

```lua
local three_d_secure_auth = client:ThreeDSecureAuth(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `table` | Yes |  |
| `card` | `table` | Yes |  |
| `challenge` | `table` | No |  |
| `customer` | `table` | No |  |
| `purchase` | `table` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `table` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `table` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:ThreeDSecureAuth():create({
  ["3_d_id"] = --[[ string ]],
  account_id = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureAuthEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```lua
local three_d_secure_browser_init = client:ThreeDSecureBrowserInit(nil)
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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:ThreeDSecureBrowserInit():create({
  account_id = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ThreeDSecureStatusEntity

```lua
local three_d_secure_status = client:ThreeDSecureStatus(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `table` | No |  |
| `info` | `table` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `table` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:ThreeDSecureStatus():load({ ["3_d_id"] = "3_d_id", account_id = "account_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureStatusEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TransactionDetailEntity

```lua
local transaction_detail = client:TransactionDetail(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `table` | Yes |  |
| `auth` | `table` | Yes |  |
| `card` | `table` | No |  |
| `customer` | `table` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `table` | No |  |
| `level2` | `table` | No |  |
| `level3` | `table` | No |  |
| `override` | `table` | No |  |
| `shipping_address` | `table` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `table` | No |  |

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

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:TransactionDetail():load({ account_id = "account_id", transaction_id = "transaction_id" })
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:TransactionDetail():update({
  account_id = "account_id",
  transaction_id = "transaction_id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionDetailEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## WebhookEntity

```lua
local webhook = client:Webhook(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Webhook():create({
  account_id = --[[ string ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Webhook():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Webhook():load({ id = "webhook_id", account_id = "account_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Webhook():remove({ id = "webhook_id", account_id = "account_id" })
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:Webhook():update({
  id = "webhook_id",
  account_id = "account_id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WebhookEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

