# BluefinPayconex TypeScript SDK Reference

Complete API reference for the BluefinPayconex TypeScript SDK.


## BluefinPayconexSDK

### Constructor

```ts
new BluefinPayconexSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = BluefinPayconexSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `BluefinPayconexSDK` instance in test mode.


### Instance Methods

#### `AccountUpdater(data?: object)`

Create a new `AccountUpdater` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AccountUpdaterEntity` instance.

#### `AccountUpdaterSchedule(data?: object)`

Create a new `AccountUpdaterSchedule` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AccountUpdaterScheduleEntity` instance.

#### `AccountUpdaterScheduleWithResult(data?: object)`

Create a new `AccountUpdaterScheduleWithResult` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AccountUpdaterScheduleWithResultEntity` instance.

#### `AccountUpdaterSubscriptionWithResult(data?: object)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AccountUpdaterSubscriptionWithResultEntity` instance.

#### `AccountUpdaterUpdate(data?: object)`

Create a new `AccountUpdaterUpdate` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AccountUpdaterUpdateEntity` instance.

#### `ApiKey(data?: object)`

Create a new `ApiKey` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ApiKeyEntity` instance.

#### `ApplePayMerchantDetail(data?: object)`

Create a new `ApplePayMerchantDetail` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ApplePayMerchantDetailEntity` instance.

#### `ApplePaySession(data?: object)`

Create a new `ApplePaySession` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ApplePaySessionEntity` instance.

#### `DynamicDescriptor(data?: object)`

Create a new `DynamicDescriptor` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `DynamicDescriptorEntity` instance.

#### `IFrameCreateInstance(data?: object)`

Create a new `IFrameCreateInstance` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `IFrameCreateInstanceEntity` instance.

#### `IFrameInstance(data?: object)`

Create a new `IFrameInstance` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `IFrameInstanceEntity` instance.

#### `Iframe(data?: object)`

Create a new `Iframe` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `IframeEntity` instance.

#### `Init(data?: object)`

Create a new `Init` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `InitEntity` instance.

#### `ListApiKeyScopesEntry(data?: object)`

Create a new `ListApiKeyScopesEntry` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ListApiKeyScopesEntryEntity` instance.

#### `PaymentIframe(data?: object)`

Create a new `PaymentIframe` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PaymentIframeEntity` instance.

#### `ThreeDSecureAuth(data?: object)`

Create a new `ThreeDSecureAuth` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ThreeDSecureAuthEntity` instance.

#### `ThreeDSecureBrowserInit(data?: object)`

Create a new `ThreeDSecureBrowserInit` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ThreeDSecureBrowserInitEntity` instance.

#### `ThreeDSecureStatus(data?: object)`

Create a new `ThreeDSecureStatus` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ThreeDSecureStatusEntity` instance.

#### `TransactionDetail(data?: object)`

Create a new `TransactionDetail` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TransactionDetailEntity` instance.

#### `Webhook(data?: object)`

Create a new `Webhook` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `WebhookEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `BluefinPayconexSDK.test()`.

**Returns:** `BluefinPayconexSDK` instance in test mode.


---

## AccountUpdaterEntity

```ts
const account_updater = client.AccountUpdater()
```

### Operations

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.AccountUpdater().remove({ account_id: 'account_id', subscription_id: 'subscription_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AccountUpdaterEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## AccountUpdaterScheduleEntity

```ts
const account_updater_schedule = client.AccountUpdaterSchedule()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `boolean` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `any[]` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.AccountUpdaterSchedule().create({
  account_id: 'example_account_id',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AccountUpdaterScheduleEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## AccountUpdaterScheduleWithResultEntity

```ts
const account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `any[]` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `boolean` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `Record<string, any>` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `any[]` | Yes |  |
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.AccountUpdaterScheduleWithResult().create({
  account_id: 'example_account_id',
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.AccountUpdaterScheduleWithResult().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## AccountUpdaterSubscriptionWithResultEntity

```ts
const account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `boolean` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `any[]` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.AccountUpdaterSubscriptionWithResult().create({
  account_id: 'example_account_id',
  subscription_id: 'example_subscription_id',
})
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.AccountUpdaterSubscriptionWithResult().load({ account_id: 'account_id', subscription_id: 'subscription_id' })
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.AccountUpdaterSubscriptionWithResult().update({
  account_id: 'account_id',
  subscription_id: 'subscription_id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## AccountUpdaterUpdateEntity

```ts
const account_updater_update = client.AccountUpdaterUpdate()
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
| `recurring_schedule` | `any[]` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.AccountUpdaterUpdate().load({ id: 'account_updater_update_id', account_id: 'account_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AccountUpdaterUpdateEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ApiKeyEntity

```ts
const api_key = client.ApiKey()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `any[]` | No |  |
| `enabled` | `boolean` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `any[]` | No |  |
| `scope` | `any[]` | No |  |
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.ApiKey().create({
  account_id: 'example_account_id',
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.ApiKey().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.ApiKey().load({ id: 'api_key_id', account_id: 'account_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.ApiKey().remove({ id: 'api_key_id', account_id: 'account_id' })
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.ApiKey().update({
  id: 'api_key_id',
  account_id: 'account_id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ApiKeyEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ApplePayMerchantDetailEntity

```ts
const apple_pay_merchant_detail = client.ApplePayMerchantDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `any[]` | Yes |  |
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.ApplePayMerchantDetail().create({
  account_id: 1,
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.ApplePayMerchantDetail().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ApplePayMerchantDetailEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ApplePaySessionEntity

```ts
const apple_pay_session = client.ApplePaySession()
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.ApplePaySession().create({
  account_id: 1,
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ApplePaySessionEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## DynamicDescriptorEntity

```ts
const dynamic_descriptor = client.DynamicDescriptor()
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.DynamicDescriptor().create({
  account_id: 'example_account_id',
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.DynamicDescriptor().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.DynamicDescriptor().load({ id: 'dynamic_descriptor_id', account_id: 'account_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.DynamicDescriptor().remove({ id: 'dynamic_descriptor_id', account_id: 'account_id' })
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.DynamicDescriptor().update({
  id: 'dynamic_descriptor_id',
  account_id: 'account_id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `DynamicDescriptorEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## IFrameCreateInstanceEntity

```ts
const i_frame_create_instance = client.IFrameCreateInstance()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `Record<string, any>` | No |  |
| `initialize_transaction` | `boolean` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `number` | No |  |
| `token` | `any[]` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.IFrameCreateInstance().create({
  account_id: 'example_account_id',
  payment_iframe_id: 'example_payment_iframe_id',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `IFrameCreateInstanceEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## IFrameInstanceEntity

```ts
const i_frame_instance = client.IFrameInstance()
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.IFrameInstance().load({ id: 'i_frame_instance_id', account_id: 'account_id', payment_iframe_id: 'payment_iframe_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `IFrameInstanceEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## IframeEntity

```ts
const iframe = client.Iframe()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Record<string, any>` | No |  |
| `allowed_parent_domain` | `any[]` | Yes |  |
| `allowed_payment_method` | `any[]` | Yes |  |
| `card_setting` | `Record<string, any>` | No |  |
| `click_to_pay_setting` | `Record<string, any>` | No |  |
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Iframe().create({
  account_id: 'example_account_id',
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Iframe().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Iframe().load({ account_id: 'account_id', iframe_id: 'iframe_id' })
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.Iframe().update({
  account_id: 'account_id',
  iframe_id: 'iframe_id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `IframeEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## InitEntity

```ts
const init = client.Init()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Record<string, any>` | No |  |
| `description` | `string` | No |  |
| `item` | `any[]` | No |  |
| `level2` | `Record<string, any>` | No |  |
| `level3` | `Record<string, any>` | No |  |
| `shipping_address` | `Record<string, any>` | Yes |  |
| `trace` | `Record<string, any>` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Init().create({
  account_id: 'example_account_id',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `InitEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ListApiKeyScopesEntryEntity

```ts
const list_api_key_scopes_entry = client.ListApiKeyScopesEntry()
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.ListApiKeyScopesEntry().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ListApiKeyScopesEntryEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PaymentIframeEntity

```ts
const payment_iframe = client.PaymentIframe()
```

### Operations

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.PaymentIframe().remove({ account_id: 'account_id', id: 'id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PaymentIframeEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ThreeDSecureAuthEntity

```ts
const three_d_secure_auth = client.ThreeDSecureAuth()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Record<string, any>` | Yes |  |
| `card` | `Record<string, any>` | Yes |  |
| `challenge` | `Record<string, any>` | No |  |
| `customer` | `Record<string, any>` | No |  |
| `purchase` | `Record<string, any>` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `Record<string, any>` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `Record<string, any>` | No |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.ThreeDSecureAuth().create({
  '3_d_id': 'example_3_d_id',
  account_id: 'example_account_id',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ThreeDSecureAuthEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ThreeDSecureBrowserInitEntity

```ts
const three_d_secure_browser_init = client.ThreeDSecureBrowserInit()
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

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.ThreeDSecureBrowserInit().create({
  account_id: 'example_account_id',
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ThreeDSecureStatusEntity

```ts
const three_d_secure_status = client.ThreeDSecureStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Record<string, any>` | No |  |
| `info` | `Record<string, any>` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `Record<string, any>` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.ThreeDSecureStatus().load({ '3_d_id': '3_d_id', account_id: 'account_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ThreeDSecureStatusEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TransactionDetailEntity

```ts
const transaction_detail = client.TransactionDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Record<string, any>` | Yes |  |
| `auth` | `Record<string, any>` | Yes |  |
| `card` | `Record<string, any>` | No |  |
| `customer` | `Record<string, any>` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `any[]` | No |  |
| `level2` | `Record<string, any>` | No |  |
| `level3` | `Record<string, any>` | No |  |
| `override` | `Record<string, any>` | No |  |
| `shipping_address` | `Record<string, any>` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `Record<string, any>` | No |  |

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

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.TransactionDetail().load({ account_id: 'account_id', transaction_id: 'transaction_id' })
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.TransactionDetail().update({
  account_id: 'account_id',
  transaction_id: 'transaction_id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TransactionDetailEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## WebhookEntity

```ts
const webhook = client.Webhook()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Webhook().create({
  account_id: 'example_account_id',
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Webhook().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Webhook().load({ id: 'webhook_id', account_id: 'account_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.Webhook().remove({ id: 'webhook_id', account_id: 'account_id' })
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.Webhook().update({
  id: 'webhook_id',
  account_id: 'account_id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `WebhookEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinPayconexSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new BluefinPayconexSDK({
  feature: {
    test: { active: true },
  }
})
```

