# BluefinPayconex Elixir SDK Reference

Complete API reference for the BluefinPayconex Elixir SDK.


## BluefinPayconex

### Constructor

```elixir
sdk = BluefinPayconex.new(options)
```

Create a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinPayconex.Helpers.deep/1`.

**Options:**

| Name | Type | Description |
| --- | --- | --- |
| `apikey` | `String.t()` | API key for authentication. |
| `base` | `String.t()` | Base URL for API requests. |
| `prefix` | `String.t()` | URL prefix appended after base. |
| `suffix` | `String.t()` | URL suffix appended after path. |
| `headers` | `map()` | Custom headers for all requests. |
| `feature` | `map()` | Feature configuration. |
| `system` | `map()` | System overrides (e.g. custom fetch). |


### Constructors

#### `BluefinPayconex.test(testopts \\ nil, sdkopts \\ nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```elixir
sdk = BluefinPayconex.test()
```


### Functions

#### `BluefinPayconex.account_updater(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.AccountUpdater` handle.

#### `BluefinPayconex.account_updater_schedule(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.AccountUpdaterSchedule` handle.

#### `BluefinPayconex.account_updater_schedule_with_result(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.AccountUpdaterScheduleWithResult` handle.

#### `BluefinPayconex.account_updater_subscription_with_result(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult` handle.

#### `BluefinPayconex.account_updater_update(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.AccountUpdaterUpdate` handle.

#### `BluefinPayconex.api_key(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.ApiKey` handle.

#### `BluefinPayconex.apple_pay_merchant_detail(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.ApplePayMerchantDetail` handle.

#### `BluefinPayconex.apple_pay_session(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.ApplePaySession` handle.

#### `BluefinPayconex.dynamic_descriptor(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.DynamicDescriptor` handle.

#### `BluefinPayconex.i_frame_create_instance(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.IFrameCreateInstance` handle.

#### `BluefinPayconex.i_frame_instance(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.IFrameInstance` handle.

#### `BluefinPayconex.iframe(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.Iframe` handle.

#### `BluefinPayconex.init(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.Init` handle.

#### `BluefinPayconex.list_api_key_scopes_entry(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.ListApiKeyScopesEntry` handle.

#### `BluefinPayconex.payment_iframe(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.PaymentIframe` handle.

#### `BluefinPayconex.three_d_secure_auth(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.ThreeDSecureAuth` handle.

#### `BluefinPayconex.three_d_secure_browser_init(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.ThreeDSecureBrowserInit` handle.

#### `BluefinPayconex.three_d_secure_status(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.ThreeDSecureStatus` handle.

#### `BluefinPayconex.transaction_detail(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.TransactionDetail` handle.

#### `BluefinPayconex.webhook(client, entopts \\ nil)`

Create a `BluefinPayconex.Entity.Webhook` handle.

#### `options_map(client) :: map()`

Return a deep copy of the current SDK options.

#### `get_utility(client) :: map()`

Return the SDK utility node.

#### `direct(client, fetchargs) :: map()`

Make a direct HTTP request to any API endpoint. Returns a result node with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `Voxgig.Struct.getprop(result, "ok")`.

**fetchargs keys:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String.t()` | URL path with optional `{param}` placeholders. |
| `method` | `String.t()` | HTTP method (default: `"GET"`). |
| `params` | `map()` | Path parameter values. |
| `query` | `map()` | Query string parameters. |
| `headers` | `map()` | Request headers (merged with defaults). |
| `body` | `any()` | Request body (maps are JSON-serialized). |

#### `prepare(client, fetchargs) :: map()`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## BluefinPayconex.Entity.AccountUpdater

```elixir
account_updater = BluefinPayconex.account_updater(sdk)
```

### Operations

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinPayconex.Entity.AccountUpdater.remove(account_updater, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "subscription_id" => "subscription_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.AccountUpdater` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.AccountUpdaterSchedule

```elixir
account_updater_schedule = BluefinPayconex.account_updater_schedule(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `boolean()` | No |  |
| `period_date` | `String.t()` | No |  |
| `period_id` | `String.t()` | Yes |  |
| `response_format` | `String.t()` | No |  |
| `token` | `list()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.AccountUpdaterSchedule.create(account_updater_schedule, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.AccountUpdaterSchedule` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.AccountUpdaterScheduleWithResult

```elixir
account_updater_schedule_with_result = BluefinPayconex.account_updater_schedule_with_result(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `list()` | Yes |  |
| `created_at` | `String.t()` | Yes |  |
| `enabled` | `boolean()` | No |  |
| `expiry` | `String.t()` | No |  |
| `id` | `String.t()` | Yes |  |
| `most_recent_update` | `map()` | No |  |
| `period_date` | `String.t()` | No |  |
| `period_id` | `String.t()` | Yes |  |
| `response_format` | `String.t()` | No |  |
| `token` | `list()` | Yes |  |
| `type` | `String.t()` | Yes |  |
| `updated_at` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.AccountUpdaterScheduleWithResult.create(account_updater_schedule_with_result, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinPayconex.Entity.AccountUpdaterScheduleWithResult.list(account_updater_schedule_with_result)
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.AccountUpdaterScheduleWithResult` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult

```elixir
account_updater_subscription_with_result = BluefinPayconex.account_updater_subscription_with_result(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String.t()` | No |  |
| `enabled` | `boolean()` | No |  |
| `id` | `String.t()` | No |  |
| `period_date` | `String.t()` | No |  |
| `period_id` | `String.t()` | No |  |
| `record` | `list()` | No |  |
| `response_format` | `String.t()` | No |  |
| `template_ref` | `String.t()` | No |  |
| `updated_at` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult.create(account_updater_subscription_with_result, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
  "subscription_id" => "example_subscription_id",  # String.t()
}))
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult.load(account_updater_subscription_with_result, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "subscription_id" => "subscription_id"}))
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult.update(account_updater_subscription_with_result, BluefinPayconex.Helpers.deep(%{
  "account_id" => "account_id",
  "subscription_id" => "subscription_id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.AccountUpdaterUpdate

```elixir
account_updater_update = BluefinPayconex.account_updater_update(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `String.t()` | No |  |
| `format` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `new_expiry` | `String.t()` | No |  |
| `new_token` | `String.t()` | No |  |
| `old_expiry` | `String.t()` | No |  |
| `old_token` | `String.t()` | No |  |
| `recurring_schedule` | `list()` | No |  |
| `status` | `String.t()` | No |  |
| `update_id` | `String.t()` | No |  |
| `updated_at` | `String.t()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.AccountUpdaterUpdate.load(account_updater_update, BluefinPayconex.Helpers.deep(%{"id" => "account_updater_update_id", "account_id" => "account_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.AccountUpdaterUpdate` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.ApiKey

```elixir
api_key = BluefinPayconex.api_key(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `list()` | No |  |
| `enabled` | `boolean()` | No |  |
| `expires_at` | `String.t()` | No |  |
| `expires_in` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `label` | `String.t()` | No |  |
| `method` | `list()` | No |  |
| `scope` | `list()` | No |  |
| `secret` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ApiKey.create(api_key, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinPayconex.Entity.ApiKey.list(api_key)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ApiKey.load(api_key, BluefinPayconex.Helpers.deep(%{"id" => "api_key_id", "account_id" => "account_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinPayconex.Entity.ApiKey.remove(api_key, BluefinPayconex.Helpers.deep(%{"id" => "api_key_id", "account_id" => "account_id"}))
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ApiKey.update(api_key, BluefinPayconex.Helpers.deep(%{
  "id" => "api_key_id",
  "account_id" => "account_id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.ApiKey` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.ApplePayMerchantDetail

```elixir
apple_pay_merchant_detail = BluefinPayconex.apple_pay_merchant_detail(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `list()` | Yes |  |
| `merchant_url` | `String.t()` | Yes |  |
| `partner_merchant_name` | `String.t()` | No |  |
| `payconex_account_id` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ApplePayMerchantDetail.create(apple_pay_merchant_detail, BluefinPayconex.Helpers.deep(%{
  "account_id" => 1,  # integer()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinPayconex.Entity.ApplePayMerchantDetail.list(apple_pay_merchant_detail)
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.ApplePayMerchantDetail` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.ApplePaySession

```elixir
apple_pay_session = BluefinPayconex.apple_pay_session(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String.t()` | No |  |
| `domain_name` | `String.t()` | No |  |
| `epoch_timestamp` | `integer()` | No |  |
| `expires_at` | `integer()` | No |  |
| `merchant_identifier` | `String.t()` | No |  |
| `merchant_session_identifier` | `String.t()` | No |  |
| `nonce` | `integer()` | No |  |
| `operational_analytics_identifier` | `String.t()` | No |  |
| `referrer` | `String.t()` | Yes |  |
| `retry` | `integer()` | No |  |
| `signature` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ApplePaySession.create(apple_pay_session, BluefinPayconex.Helpers.deep(%{
  "account_id" => 1,  # integer()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.ApplePaySession` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.DynamicDescriptor

```elixir
dynamic_descriptor = BluefinPayconex.dynamic_descriptor(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `String.t()` | No |  |
| `descriptor` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `state` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.DynamicDescriptor.create(dynamic_descriptor, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinPayconex.Entity.DynamicDescriptor.list(dynamic_descriptor)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.DynamicDescriptor.load(dynamic_descriptor, BluefinPayconex.Helpers.deep(%{"id" => "dynamic_descriptor_id", "account_id" => "account_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinPayconex.Entity.DynamicDescriptor.remove(dynamic_descriptor, BluefinPayconex.Helpers.deep(%{"id" => "dynamic_descriptor_id", "account_id" => "account_id"}))
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.DynamicDescriptor.update(dynamic_descriptor, BluefinPayconex.Helpers.deep(%{
  "id" => "dynamic_descriptor_id",
  "account_id" => "account_id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.DynamicDescriptor` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.IFrameCreateInstance

```elixir
i_frame_create_instance = BluefinPayconex.i_frame_create_instance(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String.t()` | No |  |
| `currency` | `String.t()` | No |  |
| `customer` | `map()` | No |  |
| `initialize_transaction` | `boolean()` | No |  |
| `label` | `String.t()` | Yes |  |
| `language` | `String.t()` | No |  |
| `reference` | `String.t()` | No |  |
| `timeout` | `float()` | No |  |
| `token` | `list()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.IFrameCreateInstance.create(i_frame_create_instance, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
  "payment_iframe_id" => "example_payment_iframe_id",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.IFrameCreateInstance` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.IFrameInstance

```elixir
i_frame_instance = BluefinPayconex.i_frame_instance(sdk)
```

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.IFrameInstance.load(i_frame_instance, BluefinPayconex.Helpers.deep(%{"id" => "i_frame_instance_id", "account_id" => "account_id", "payment_iframe_id" => "payment_iframe_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.IFrameInstance` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.Iframe

```elixir
iframe = BluefinPayconex.iframe(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `map()` | No |  |
| `allowed_parent_domain` | `list()` | Yes |  |
| `allowed_payment_method` | `list()` | Yes |  |
| `card_setting` | `map()` | No |  |
| `click_to_pay_setting` | `map()` | No |  |
| `currency` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `label` | `String.t()` | Yes |  |
| `language` | `String.t()` | No |  |
| `timeout` | `float()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.Iframe.create(iframe, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinPayconex.Entity.Iframe.list(iframe)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.Iframe.load(iframe, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "iframe_id" => "iframe_id"}))
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.Iframe.update(iframe, BluefinPayconex.Helpers.deep(%{
  "account_id" => "account_id",
  "iframe_id" => "iframe_id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.Iframe` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.Init

```elixir
init = BluefinPayconex.init(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `map()` | No |  |
| `description` | `String.t()` | No |  |
| `item` | `list()` | No |  |
| `level2` | `map()` | No |  |
| `level3` | `map()` | No |  |
| `shipping_address` | `map()` | Yes |  |
| `trace` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.Init.create(init, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.Init` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.ListApiKeyScopesEntry

```elixir
list_api_key_scopes_entry = BluefinPayconex.list_api_key_scopes_entry(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String.t()` | No |  |
| `description` | `String.t()` | No |  |
| `enabled` | `boolean()` | No |  |
| `level` | `integer()` | No |  |
| `scope` | `String.t()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinPayconex.Entity.ListApiKeyScopesEntry.list(list_api_key_scopes_entry)
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.ListApiKeyScopesEntry` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.PaymentIframe

```elixir
payment_iframe = BluefinPayconex.payment_iframe(sdk)
```

### Operations

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinPayconex.Entity.PaymentIframe.remove(payment_iframe, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "id" => "id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.PaymentIframe` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.ThreeDSecureAuth

```elixir
three_d_secure_auth = BluefinPayconex.three_d_secure_auth(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `map()` | Yes |  |
| `card` | `map()` | Yes |  |
| `challenge` | `map()` | No |  |
| `customer` | `map()` | No |  |
| `purchase` | `map()` | Yes |  |
| `server_transaction_id` | `String.t()` | No |  |
| `shipping` | `map()` | Yes |  |
| `status` | `String.t()` | No |  |
| `three_d_secure_challenge_indicator` | `String.t()` | No |  |
| `three_d_secure_id` | `String.t()` | No |  |
| `trace` | `map()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ThreeDSecureAuth.create(three_d_secure_auth, BluefinPayconex.Helpers.deep(%{
  "3_d_id" => "example_3_d_id",  # String.t()
  "account_id" => "example_account_id",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.ThreeDSecureAuth` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.ThreeDSecureBrowserInit

```elixir
three_d_secure_browser_init = BluefinPayconex.three_d_secure_browser_init(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `String.t()` | No |  |
| `acs_url` | `String.t()` | No |  |
| `cvv` | `String.t()` | No |  |
| `expiry` | `String.t()` | Yes |  |
| `pan` | `String.t()` | Yes |  |
| `payment_details_reference` | `String.t()` | No |  |
| `server_transaction_id` | `String.t()` | No |  |
| `status` | `String.t()` | No |  |
| `three_d_secure_data` | `String.t()` | No |  |
| `three_d_secure_id` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ThreeDSecureBrowserInit.create(three_d_secure_browser_init, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.ThreeDSecureBrowserInit` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.ThreeDSecureStatus

```elixir
three_d_secure_status = BluefinPayconex.three_d_secure_status(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `map()` | No |  |
| `info` | `map()` | No |  |
| `server_transaction_id` | `String.t()` | No |  |
| `status` | `String.t()` | No |  |
| `three_d_secure` | `map()` | No |  |
| `three_d_secure_id` | `String.t()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.ThreeDSecureStatus.load(three_d_secure_status, BluefinPayconex.Helpers.deep(%{"3_d_id" => "3_d_id", "account_id" => "account_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.ThreeDSecureStatus` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.TransactionDetail

```elixir
transaction_detail = BluefinPayconex.transaction_detail(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `map()` | Yes |  |
| `auth` | `map()` | Yes |  |
| `card` | `map()` | No |  |
| `customer` | `map()` | No |  |
| `description` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `item` | `list()` | No |  |
| `level2` | `map()` | No |  |
| `level3` | `map()` | No |  |
| `override` | `map()` | No |  |
| `shipping_address` | `map()` | Yes |  |
| `status` | `String.t()` | Yes |  |
| `timestamp` | `String.t()` | No |  |
| `trace` | `map()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.TransactionDetail.load(transaction_detail, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "transaction_id" => "transaction_id"}))
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.TransactionDetail.update(transaction_detail, BluefinPayconex.Helpers.deep(%{
  "account_id" => "account_id",
  "transaction_id" => "transaction_id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.TransactionDetail` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinPayconex.Entity.Webhook

```elixir
webhook = BluefinPayconex.webhook(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String.t()` | Yes |  |
| `id` | `String.t()` | No |  |
| `url` | `String.t()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.Webhook.create(webhook, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinPayconex.Entity.Webhook.list(webhook)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.Webhook.load(webhook, BluefinPayconex.Helpers.deep(%{"id" => "webhook_id", "account_id" => "account_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinPayconex.Entity.Webhook.remove(webhook, BluefinPayconex.Helpers.deep(%{"id" => "webhook_id", "account_id" => "account_id"}))
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinPayconex.Entity.Webhook.update(webhook, BluefinPayconex.Helpers.deep(%{
  "id" => "webhook_id",
  "account_id" => "account_id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinPayconex.Entity.Webhook` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```elixir
sdk = BluefinPayconex.new(BluefinPayconex.Helpers.deep(%{
  "feature" => %{
    "test" => %{"active" => true},
  }
}))
```

