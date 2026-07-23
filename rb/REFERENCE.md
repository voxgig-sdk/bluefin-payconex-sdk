# BluefinPayconex Ruby SDK Reference

Complete API reference for the BluefinPayconex Ruby SDK.


## BluefinPayconexSDK

### Constructor

```ruby
require_relative 'BluefinPayconex_sdk'

client = BluefinPayconexSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = BluefinPayconexSDK.test
```


### Instance Methods

#### `AccountUpdater(data = nil)`

Create a new `AccountUpdater` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterSchedule(data = nil)`

Create a new `AccountUpdaterSchedule` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterScheduleWithResult(data = nil)`

Create a new `AccountUpdaterScheduleWithResult` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterSubscriptionWithResult(data = nil)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance. Pass `nil` for no initial data.

#### `AccountUpdaterUpdate(data = nil)`

Create a new `AccountUpdaterUpdate` entity instance. Pass `nil` for no initial data.

#### `ApiKey(data = nil)`

Create a new `ApiKey` entity instance. Pass `nil` for no initial data.

#### `ApplePayMerchantDetail(data = nil)`

Create a new `ApplePayMerchantDetail` entity instance. Pass `nil` for no initial data.

#### `ApplePaySession(data = nil)`

Create a new `ApplePaySession` entity instance. Pass `nil` for no initial data.

#### `DynamicDescriptor(data = nil)`

Create a new `DynamicDescriptor` entity instance. Pass `nil` for no initial data.

#### `IFrameCreateInstance(data = nil)`

Create a new `IFrameCreateInstance` entity instance. Pass `nil` for no initial data.

#### `IFrameInstance(data = nil)`

Create a new `IFrameInstance` entity instance. Pass `nil` for no initial data.

#### `Iframe(data = nil)`

Create a new `Iframe` entity instance. Pass `nil` for no initial data.

#### `Init(data = nil)`

Create a new `Init` entity instance. Pass `nil` for no initial data.

#### `ListApiKeyScopesEntry(data = nil)`

Create a new `ListApiKeyScopesEntry` entity instance. Pass `nil` for no initial data.

#### `PaymentIframe(data = nil)`

Create a new `PaymentIframe` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureAuth(data = nil)`

Create a new `ThreeDSecureAuth` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureBrowserInit(data = nil)`

Create a new `ThreeDSecureBrowserInit` entity instance. Pass `nil` for no initial data.

#### `ThreeDSecureStatus(data = nil)`

Create a new `ThreeDSecureStatus` entity instance. Pass `nil` for no initial data.

#### `TransactionDetail(data = nil)`

Create a new `TransactionDetail` entity instance. Pass `nil` for no initial data.

#### `Webhook(data = nil)`

Create a new `Webhook` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## AccountUpdaterEntity

```ruby
account_updater = client.AccountUpdater
```

### Operations

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.AccountUpdater.remove({ "account_id" => "account_id", "subscription_id" => "subscription_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AccountUpdaterEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```ruby
account_updater_schedule = client.AccountUpdaterSchedule
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `Boolean` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `Array` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.AccountUpdaterSchedule.create({
  "account_id" => "example_account_id", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AccountUpdaterScheduleEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```ruby
account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Array` | Yes |  |
| `created_at` | `String` | Yes |  |
| `enabled` | `Boolean` | No |  |
| `expiry` | `String` | No |  |
| `id` | `String` | Yes |  |
| `most_recent_update` | `Hash` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `Array` | Yes |  |
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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.AccountUpdaterScheduleWithResult.create({
  "account_id" => "example_account_id", # String
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.AccountUpdaterScheduleWithResult.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```ruby
account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String` | No |  |
| `enabled` | `Boolean` | No |  |
| `id` | `String` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | No |  |
| `record` | `Array` | No |  |
| `response_format` | `String` | No |  |
| `template_ref` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.AccountUpdaterSubscriptionWithResult.create({
  "account_id" => "example_account_id", # String
  "subscription_id" => "example_subscription_id", # String
})
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.AccountUpdaterSubscriptionWithResult.load({ "account_id" => "account_id", "subscription_id" => "subscription_id" })
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.AccountUpdaterSubscriptionWithResult.update({
  "account_id" => "account_id",
  "subscription_id" => "subscription_id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```ruby
account_updater_update = client.AccountUpdaterUpdate
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
| `recurring_schedule` | `Array` | No |  |
| `status` | `String` | No |  |
| `update_id` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.AccountUpdaterUpdate.load({ "id" => "account_updater_update_id", "account_id" => "account_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AccountUpdaterUpdateEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ApiKeyEntity

```ruby
api_key = client.ApiKey
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `Array` | No |  |
| `enabled` | `Boolean` | No |  |
| `expires_at` | `String` | No |  |
| `expires_in` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | No |  |
| `method` | `Array` | No |  |
| `scope` | `Array` | No |  |
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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.ApiKey.create({
  "account_id" => "example_account_id", # String
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.ApiKey.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.ApiKey.load({ "id" => "api_key_id", "account_id" => "account_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.ApiKey.remove({ "id" => "api_key_id", "account_id" => "account_id" })
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.ApiKey.update({
  "id" => "api_key_id",
  "account_id" => "account_id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ApiKeyEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```ruby
apple_pay_merchant_detail = client.ApplePayMerchantDetail
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `Array` | Yes |  |
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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.ApplePayMerchantDetail.create({
  "account_id" => 1, # Integer
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.ApplePayMerchantDetail.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ApplePayMerchantDetailEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ApplePaySessionEntity

```ruby
apple_pay_session = client.ApplePaySession
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String` | No |  |
| `domain_name` | `String` | No |  |
| `epoch_timestamp` | `Integer` | No |  |
| `expires_at` | `Integer` | No |  |
| `merchant_identifier` | `String` | No |  |
| `merchant_session_identifier` | `String` | No |  |
| `nonce` | `Integer` | No |  |
| `operational_analytics_identifier` | `String` | No |  |
| `referrer` | `String` | Yes |  |
| `retry` | `Integer` | No |  |
| `signature` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.ApplePaySession.create({
  "account_id" => 1, # Integer
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ApplePaySessionEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DynamicDescriptorEntity

```ruby
dynamic_descriptor = client.DynamicDescriptor
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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.DynamicDescriptor.create({
  "account_id" => "example_account_id", # String
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.DynamicDescriptor.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.DynamicDescriptor.load({ "id" => "dynamic_descriptor_id", "account_id" => "account_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.DynamicDescriptor.remove({ "id" => "dynamic_descriptor_id", "account_id" => "account_id" })
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.DynamicDescriptor.update({
  "id" => "dynamic_descriptor_id",
  "account_id" => "account_id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DynamicDescriptorEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## IFrameCreateInstanceEntity

```ruby
i_frame_create_instance = client.IFrameCreateInstance
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String` | No |  |
| `currency` | `String` | No |  |
| `customer` | `Hash` | No |  |
| `initialize_transaction` | `Boolean` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `reference` | `String` | No |  |
| `timeout` | `Float` | No |  |
| `token` | `Array` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.IFrameCreateInstance.create({
  "account_id" => "example_account_id", # String
  "payment_iframe_id" => "example_payment_iframe_id", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `IFrameCreateInstanceEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## IFrameInstanceEntity

```ruby
i_frame_instance = client.IFrameInstance
```

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.IFrameInstance.load({ "id" => "i_frame_instance_id", "account_id" => "account_id", "payment_iframe_id" => "payment_iframe_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `IFrameInstanceEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## IframeEntity

```ruby
iframe = client.Iframe
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Hash` | No |  |
| `allowed_parent_domain` | `Array` | Yes |  |
| `allowed_payment_method` | `Array` | Yes |  |
| `card_setting` | `Hash` | No |  |
| `click_to_pay_setting` | `Hash` | No |  |
| `currency` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `timeout` | `Float` | No |  |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Iframe.create({
  "account_id" => "example_account_id", # String
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Iframe.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Iframe.load({ "account_id" => "account_id", "iframe_id" => "iframe_id" })
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.Iframe.update({
  "account_id" => "account_id",
  "iframe_id" => "iframe_id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `IframeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## InitEntity

```ruby
init = client.Init
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Hash` | No |  |
| `description` | `String` | No |  |
| `item` | `Array` | No |  |
| `level2` | `Hash` | No |  |
| `level3` | `Hash` | No |  |
| `shipping_address` | `Hash` | Yes |  |
| `trace` | `Hash` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Init.create({
  "account_id" => "example_account_id", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `InitEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```ruby
list_api_key_scopes_entry = client.ListApiKeyScopesEntry
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `description` | `String` | No |  |
| `enabled` | `Boolean` | No |  |
| `level` | `Integer` | No |  |
| `scope` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.ListApiKeyScopesEntry.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ListApiKeyScopesEntryEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PaymentIframeEntity

```ruby
payment_iframe = client.PaymentIframe
```

### Operations

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.PaymentIframe.remove({ "account_id" => "account_id", "id" => "id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PaymentIframeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ThreeDSecureAuthEntity

```ruby
three_d_secure_auth = client.ThreeDSecureAuth
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Hash` | Yes |  |
| `card` | `Hash` | Yes |  |
| `challenge` | `Hash` | No |  |
| `customer` | `Hash` | No |  |
| `purchase` | `Hash` | Yes |  |
| `server_transaction_id` | `String` | No |  |
| `shipping` | `Hash` | Yes |  |
| `status` | `String` | No |  |
| `three_d_secure_challenge_indicator` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |
| `trace` | `Hash` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.ThreeDSecureAuth.create({
  "3_d_id" => "example_3_d_id", # String
  "account_id" => "example_account_id", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ThreeDSecureAuthEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```ruby
three_d_secure_browser_init = client.ThreeDSecureBrowserInit
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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.ThreeDSecureBrowserInit.create({
  "account_id" => "example_account_id", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ThreeDSecureStatusEntity

```ruby
three_d_secure_status = client.ThreeDSecureStatus
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Hash` | No |  |
| `info` | `Hash` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure` | `Hash` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.ThreeDSecureStatus.load({ "3_d_id" => "3_d_id", "account_id" => "account_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ThreeDSecureStatusEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TransactionDetailEntity

```ruby
transaction_detail = client.TransactionDetail
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Hash` | Yes |  |
| `auth` | `Hash` | Yes |  |
| `card` | `Hash` | No |  |
| `customer` | `Hash` | No |  |
| `description` | `String` | No |  |
| `id` | `String` | No |  |
| `item` | `Array` | No |  |
| `level2` | `Hash` | No |  |
| `level3` | `Hash` | No |  |
| `override` | `Hash` | No |  |
| `shipping_address` | `Hash` | Yes |  |
| `status` | `String` | Yes |  |
| `timestamp` | `String` | No |  |
| `trace` | `Hash` | No |  |

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

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.TransactionDetail.load({ "account_id" => "account_id", "transaction_id" => "transaction_id" })
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.TransactionDetail.update({
  "account_id" => "account_id",
  "transaction_id" => "transaction_id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TransactionDetailEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## WebhookEntity

```ruby
webhook = client.Webhook
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String` | Yes |  |
| `id` | `String` | No |  |
| `url` | `String` | Yes |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Webhook.create({
  "account_id" => "example_account_id", # String
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Webhook.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Webhook.load({ "id" => "webhook_id", "account_id" => "account_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Webhook.remove({ "id" => "webhook_id", "account_id" => "account_id" })
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.Webhook.update({
  "id" => "webhook_id",
  "account_id" => "account_id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `WebhookEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = BluefinPayconexSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

