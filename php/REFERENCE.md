# BluefinPayconex PHP SDK Reference

Complete API reference for the BluefinPayconex PHP SDK.


## BluefinPayconexSDK

### Constructor

```php
require_once __DIR__ . '/bluefinpayconex_sdk.php';

$client = new BluefinPayconexSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = BluefinPayconexSDK::test();
```


### Instance Methods

#### `AccountUpdater($data = null)`

Create a new `AccountUpdaterEntity` instance. Pass `null` for no initial data.

#### `AccountUpdaterSchedule($data = null)`

Create a new `AccountUpdaterScheduleEntity` instance. Pass `null` for no initial data.

#### `AccountUpdaterScheduleWithResult($data = null)`

Create a new `AccountUpdaterScheduleWithResultEntity` instance. Pass `null` for no initial data.

#### `AccountUpdaterSubscriptionWithResult($data = null)`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance. Pass `null` for no initial data.

#### `AccountUpdaterUpdate($data = null)`

Create a new `AccountUpdaterUpdateEntity` instance. Pass `null` for no initial data.

#### `ApiKey($data = null)`

Create a new `ApiKeyEntity` instance. Pass `null` for no initial data.

#### `ApplePayMerchantDetail($data = null)`

Create a new `ApplePayMerchantDetailEntity` instance. Pass `null` for no initial data.

#### `ApplePaySession($data = null)`

Create a new `ApplePaySessionEntity` instance. Pass `null` for no initial data.

#### `DynamicDescriptor($data = null)`

Create a new `DynamicDescriptorEntity` instance. Pass `null` for no initial data.

#### `IFrameCreateInstance($data = null)`

Create a new `IFrameCreateInstanceEntity` instance. Pass `null` for no initial data.

#### `IFrameInstance($data = null)`

Create a new `IFrameInstanceEntity` instance. Pass `null` for no initial data.

#### `Iframe($data = null)`

Create a new `IframeEntity` instance. Pass `null` for no initial data.

#### `Init($data = null)`

Create a new `InitEntity` instance. Pass `null` for no initial data.

#### `ListApiKeyScopesEntry($data = null)`

Create a new `ListApiKeyScopesEntryEntity` instance. Pass `null` for no initial data.

#### `PaymentIframe($data = null)`

Create a new `PaymentIframeEntity` instance. Pass `null` for no initial data.

#### `ThreeDSecureAuth($data = null)`

Create a new `ThreeDSecureAuthEntity` instance. Pass `null` for no initial data.

#### `ThreeDSecureBrowserInit($data = null)`

Create a new `ThreeDSecureBrowserInitEntity` instance. Pass `null` for no initial data.

#### `ThreeDSecureStatus($data = null)`

Create a new `ThreeDSecureStatusEntity` instance. Pass `null` for no initial data.

#### `TransactionDetail($data = null)`

Create a new `TransactionDetailEntity` instance. Pass `null` for no initial data.

#### `Webhook($data = null)`

Create a new `WebhookEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): BluefinPayconexUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## AccountUpdaterEntity

```php
$account_updater = $client->AccountUpdater();
```

### Operations

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->AccountUpdater()->remove(["account_id" => "account_id", "subscription_id" => "subscription_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AccountUpdaterEntity`

Create a new `AccountUpdaterEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```php
$account_updater_schedule = $client->AccountUpdaterSchedule();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `array` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->AccountUpdaterSchedule()->create([
  "account_id" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AccountUpdaterScheduleEntity`

Create a new `AccountUpdaterScheduleEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```php
$account_updater_schedule_with_result = $client->AccountUpdaterScheduleWithResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `array` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `array` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `array` | Yes |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->AccountUpdaterScheduleWithResult()->create([
  "account_id" => null, // string
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->AccountUpdaterScheduleWithResult()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AccountUpdaterScheduleWithResultEntity`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```php
$account_updater_subscription_with_result = $client->AccountUpdaterSubscriptionWithResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `array` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->AccountUpdaterSubscriptionWithResult()->create([
  "account_id" => null, // string
  "subscription_id" => null, // string
]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->AccountUpdaterSubscriptionWithResult()->load(["account_id" => "account_id", "subscription_id" => "subscription_id"]);
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->AccountUpdaterSubscriptionWithResult()->update([
  "account_id" => "account_id",
  "subscription_id" => "subscription_id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AccountUpdaterSubscriptionWithResultEntity`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```php
$account_updater_update = $client->AccountUpdaterUpdate();
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
| `recurring_schedule` | `array` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->AccountUpdaterUpdate()->load(["id" => "account_updater_update_id", "account_id" => "account_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AccountUpdaterUpdateEntity`

Create a new `AccountUpdaterUpdateEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ApiKeyEntity

```php
$api_key = $client->ApiKey();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `array` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `array` | No |  |
| `scope` | `array` | No |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->ApiKey()->create([
  "account_id" => null, // string
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->ApiKey()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->ApiKey()->load(["id" => "api_key_id", "account_id" => "account_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->ApiKey()->remove(["id" => "api_key_id", "account_id" => "account_id"]);
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->ApiKey()->update([
  "id" => "api_key_id",
  "account_id" => "account_id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ApiKeyEntity`

Create a new `ApiKeyEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```php
$apple_pay_merchant_detail = $client->ApplePayMerchantDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `array` | Yes |  |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->ApplePayMerchantDetail()->create([
  "account_id" => null, // int
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->ApplePayMerchantDetail()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ApplePayMerchantDetailEntity`

Create a new `ApplePayMerchantDetailEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ApplePaySessionEntity

```php
$apple_pay_session = $client->ApplePaySession();
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->ApplePaySession()->create([
  "account_id" => null, // int
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ApplePaySessionEntity`

Create a new `ApplePaySessionEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## DynamicDescriptorEntity

```php
$dynamic_descriptor = $client->DynamicDescriptor();
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->DynamicDescriptor()->create([
  "account_id" => null, // string
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->DynamicDescriptor()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->DynamicDescriptor()->load(["id" => "dynamic_descriptor_id", "account_id" => "account_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->DynamicDescriptor()->remove(["id" => "dynamic_descriptor_id", "account_id" => "account_id"]);
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->DynamicDescriptor()->update([
  "id" => "dynamic_descriptor_id",
  "account_id" => "account_id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): DynamicDescriptorEntity`

Create a new `DynamicDescriptorEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## IFrameCreateInstanceEntity

```php
$i_frame_create_instance = $client->IFrameCreateInstance();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `array` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `float` | No |  |
| `token` | `array` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->IFrameCreateInstance()->create([
  "account_id" => null, // string
  "payment_iframe_id" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): IFrameCreateInstanceEntity`

Create a new `IFrameCreateInstanceEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## IFrameInstanceEntity

```php
$i_frame_instance = $client->IFrameInstance();
```

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->IFrameInstance()->load(["id" => "i_frame_instance_id", "account_id" => "account_id", "payment_iframe_id" => "payment_iframe_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): IFrameInstanceEntity`

Create a new `IFrameInstanceEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## IframeEntity

```php
$iframe = $client->Iframe();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `array` | No |  |
| `allowed_parent_domain` | `array` | Yes |  |
| `allowed_payment_method` | `array` | Yes |  |
| `card_setting` | `array` | No |  |
| `click_to_pay_setting` | `array` | No |  |
| `currency` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `timeout` | `float` | No |  |

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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Iframe()->create([
  "account_id" => null, // string
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Iframe()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Iframe()->load(["account_id" => "account_id", "iframe_id" => "iframe_id"]);
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->Iframe()->update([
  "account_id" => "account_id",
  "iframe_id" => "iframe_id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): IframeEntity`

Create a new `IframeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## InitEntity

```php
$init = $client->Init();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `array` | No |  |
| `description` | `string` | No |  |
| `item` | `array` | No |  |
| `level2` | `array` | No |  |
| `level3` | `array` | No |  |
| `shipping_address` | `array` | Yes |  |
| `trace` | `array` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Init()->create([
  "account_id" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): InitEntity`

Create a new `InitEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```php
$list_api_key_scopes_entry = $client->ListApiKeyScopesEntry();
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

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->ListApiKeyScopesEntry()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ListApiKeyScopesEntryEntity`

Create a new `ListApiKeyScopesEntryEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PaymentIframeEntity

```php
$payment_iframe = $client->PaymentIframe();
```

### Operations

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->PaymentIframe()->remove(["account_id" => "account_id", "id" => "id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PaymentIframeEntity`

Create a new `PaymentIframeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ThreeDSecureAuthEntity

```php
$three_d_secure_auth = $client->ThreeDSecureAuth();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `array` | Yes |  |
| `card` | `array` | Yes |  |
| `challenge` | `array` | No |  |
| `customer` | `array` | No |  |
| `purchase` | `array` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `array` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `array` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->ThreeDSecureAuth()->create([
  "3_d_id" => null, // string
  "account_id" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ThreeDSecureAuthEntity`

Create a new `ThreeDSecureAuthEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```php
$three_d_secure_browser_init = $client->ThreeDSecureBrowserInit();
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->ThreeDSecureBrowserInit()->create([
  "account_id" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ThreeDSecureBrowserInitEntity`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ThreeDSecureStatusEntity

```php
$three_d_secure_status = $client->ThreeDSecureStatus();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `array` | No |  |
| `info` | `array` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `array` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->ThreeDSecureStatus()->load(["3_d_id" => "3_d_id", "account_id" => "account_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ThreeDSecureStatusEntity`

Create a new `ThreeDSecureStatusEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TransactionDetailEntity

```php
$transaction_detail = $client->TransactionDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `array` | Yes |  |
| `auth` | `array` | Yes |  |
| `card` | `array` | No |  |
| `customer` | `array` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `array` | No |  |
| `level2` | `array` | No |  |
| `level3` | `array` | No |  |
| `override` | `array` | No |  |
| `shipping_address` | `array` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `array` | No |  |

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

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->TransactionDetail()->load(["account_id" => "account_id", "transaction_id" => "transaction_id"]);
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->TransactionDetail()->update([
  "account_id" => "account_id",
  "transaction_id" => "transaction_id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TransactionDetailEntity`

Create a new `TransactionDetailEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## WebhookEntity

```php
$webhook = $client->Webhook();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Webhook()->create([
  "account_id" => null, // string
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Webhook()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Webhook()->load(["id" => "webhook_id", "account_id" => "account_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Webhook()->remove(["id" => "webhook_id", "account_id" => "account_id"]);
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->Webhook()->update([
  "id" => "webhook_id",
  "account_id" => "account_id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): WebhookEntity`

Create a new `WebhookEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new BluefinPayconexSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

