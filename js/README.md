# BluefinPayconex JavaScript SDK



The JavaScript SDK for the BluefinPayconex API — an entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.AccountUpdater()` — each with a small set of operations (`list`, `load`, `create`, `update`, `remove`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```js
npm install bluefin-payconex
```
## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.


### Create a Client

```js
const { BluefinPayconexSDK } = require('@voxgig-sdk/bluefin-payconex-js')

const client = new BluefinPayconexSDK({
  apikey: process.env.BLUEFIN_PAYCONEX_APIKEY,
})
```

### Remove a AccountUpdater

```js
await client.AccountUpdater().remove({ account_id: 'example_account_id', subscription_id: 'example_subscription_id' })
```

### Direct API Access

Use `client.direct()` to call any API endpoint directly:

```js
const result = await client.direct({
  path: '/custom/endpoint/{id}',
  method: 'GET',
  params: { id: 'abc123' },
})

if (result.ok) {
  console.log(result.data)
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const threedsecurestatus = await client.ThreeDSecureStatus().load({ '3_d_id': "example", account_id: "example" })
  console.log(threedsecurestatus)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```js
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result instanceof Error) {
  throw result
}
if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```js
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```js
const client = BluefinPayconexSDK.test()

const threedsecurestatus = await client.ThreeDSecureStatus().load({ '3_d_id': 'example_3_d_id', account_id: 'example_account_id' })
// threedsecurestatus is a bare entity populated with mock response data
console.log(threedsecurestatus)
```

You can also use the instance method:

```js
const client = new BluefinPayconexSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```js
const entity = client.ThreeDSecureStatus()

// First call runs the operation and stores its result
await entity.load({ '3_d_id': 'example_3_d_id', account_id: 'example_account_id' })

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
```

### Add custom middleware

Pass features via the `extend` option:

```js
const logger = {
  hooks: {
    PreRequest: (ctx) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new BluefinPayconexSDK({
  apikey: '...',
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd js && npm test
```


## Reference

### BluefinPayconexSDK

#### Constructor

```js
new BluefinPayconexSDK(options?)
```

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `AccountUpdater(data?)` | `AccountUpdaterEntity` | Create an AccountUpdater entity instance. |
| `AccountUpdaterSchedule(data?)` | `AccountUpdaterScheduleEntity` | Create an AccountUpdaterSchedule entity instance. |
| `AccountUpdaterScheduleWithResult(data?)` | `AccountUpdaterScheduleWithResultEntity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `AccountUpdaterSubscriptionWithResult(data?)` | `AccountUpdaterSubscriptionWithResultEntity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `AccountUpdaterUpdate(data?)` | `AccountUpdaterUpdateEntity` | Create an AccountUpdaterUpdate entity instance. |
| `ApiKey(data?)` | `ApiKeyEntity` | Create an ApiKey entity instance. |
| `ApplePayMerchantDetail(data?)` | `ApplePayMerchantDetailEntity` | Create an ApplePayMerchantDetail entity instance. |
| `ApplePaySession(data?)` | `ApplePaySessionEntity` | Create an ApplePaySession entity instance. |
| `DynamicDescriptor(data?)` | `DynamicDescriptorEntity` | Create a DynamicDescriptor entity instance. |
| `IFrameCreateInstance(data?)` | `IFrameCreateInstanceEntity` | Create an IFrameCreateInstance entity instance. |
| `IFrameInstance(data?)` | `IFrameInstanceEntity` | Create an IFrameInstance entity instance. |
| `Iframe(data?)` | `IframeEntity` | Create an Iframe entity instance. |
| `Init(data?)` | `InitEntity` | Create an Init entity instance. |
| `ListApiKeyScopesEntry(data?)` | `ListApiKeyScopesEntryEntity` | Create a ListApiKeyScopesEntry entity instance. |
| `PaymentIframe(data?)` | `PaymentIframeEntity` | Create a PaymentIframe entity instance. |
| `ThreeDSecureAuth(data?)` | `ThreeDSecureAuthEntity` | Create a ThreeDSecureAuth entity instance. |
| `ThreeDSecureBrowserInit(data?)` | `ThreeDSecureBrowserInitEntity` | Create a ThreeDSecureBrowserInit entity instance. |
| `ThreeDSecureStatus(data?)` | `ThreeDSecureStatusEntity` | Create a ThreeDSecureStatus entity instance. |
| `TransactionDetail(data?)` | `TransactionDetailEntity` | Create a TransactionDetail entity instance. |
| `Webhook(data?)` | `WebhookEntity` | Create a Webhook entity instance. |
| `tester(testopts?, sdkopts?)` | `BluefinPayconexSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `BluefinPayconexSDK.test(testopts?, sdkopts?)` | `BluefinPayconexSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Entity>` | Create a new entity. |
| `update` | `update(reqdata?, ctrl?): Promise<Entity>` | Update an existing entity. |
| `remove` | `remove(reqmatch?, ctrl?): Promise<void>` | Remove an entity. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): BluefinPayconexSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load`, `create` and `update` resolve to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).
- `remove` resolves to `undefined`.

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```js
{
  ok: true,
  status: 200,
  headers: {},
  data: {}
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```js
{
  url: 'string',
  method: 'string',
  headers: {},
  body: undefined
}
```

### Entities

#### AccountUpdater

| Field | Description |
| --- | --- |

Operations: remove.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}`

#### AccountUpdaterSchedule

| Field | Description |
| --- | --- |
| `enabled` |  |
| `period_date` |  |
| `period_id` |  |
| `response_format` |  |
| `token` |  |

Operations: create.

API path: `/api/v4/accounts/{accountId}/account-updater/payconex/subscribe`

#### AccountUpdaterScheduleWithResult

| Field | Description |
| --- | --- |
| `card` |  |
| `created_at` |  |
| `enabled` |  |
| `expiry` |  |
| `id` |  |
| `most_recent_update` |  |
| `period_date` |  |
| `period_id` |  |
| `response_format` |  |
| `token` |  |
| `type` |  |
| `updated_at` |  |

Operations: create, list.

API path: `/api/v4/accounts/{accountId}/account-updater/pan/subscribe`

#### AccountUpdaterSubscriptionWithResult

| Field | Description |
| --- | --- |
| `created_at` |  |
| `enabled` |  |
| `id` |  |
| `period_date` |  |
| `period_id` |  |
| `record` |  |
| `response_format` |  |
| `template_ref` |  |
| `updated_at` |  |

Operations: create, load, update.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan`

#### AccountUpdaterUpdate

| Field | Description |
| --- | --- |
| `account_updater_schedule_record_id` |  |
| `format` |  |
| `id` |  |
| `new_expiry` |  |
| `new_token` |  |
| `old_expiry` |  |
| `old_token` |  |
| `recurring_schedule` |  |
| `status` |  |
| `update_id` |  |
| `updated_at` |  |

Operations: load.

API path: `/api/v4/accounts/{account}/account-updater/updates/{updateId}`

#### ApiKey

| Field | Description |
| --- | --- |
| `account` |  |
| `enabled` |  |
| `expires_at` |  |
| `expires_in` |  |
| `id` |  |
| `label` |  |
| `method` |  |
| `scope` |  |
| `secret` |  |

Operations: create, list, load, remove, update.

API path: `/api/v4/accounts/{accountId}/api-keys`

#### ApplePayMerchantDetail

| Field | Description |
| --- | --- |
| `domain` |  |
| `merchant_url` |  |
| `partner_merchant_name` |  |
| `payconex_account_id` |  |

Operations: create, list.

API path: `/api/v4/accounts/{accountId}/applePay/enrollment`

#### ApplePaySession

| Field | Description |
| --- | --- |
| `display_name` |  |
| `domain_name` |  |
| `epoch_timestamp` |  |
| `expires_at` |  |
| `merchant_identifier` |  |
| `merchant_session_identifier` |  |
| `nonce` |  |
| `operational_analytics_identifier` |  |
| `referrer` |  |
| `retry` |  |
| `signature` |  |

Operations: create.

API path: `/api/v4/accounts/{accountId}/applePay/session`

#### DynamicDescriptor

| Field | Description |
| --- | --- |
| `city` |  |
| `descriptor` |  |
| `id` |  |
| `name` |  |
| `state` |  |

Operations: create, list, load, remove, update.

API path: `/api/v4/accounts/{accountId}/dynamic_descriptors`

#### IFrameCreateInstance

| Field | Description |
| --- | --- |
| `amount` |  |
| `currency` |  |
| `customer` |  |
| `initialize_transaction` |  |
| `label` |  |
| `language` |  |
| `reference` |  |
| `timeout` |  |
| `token` |  |

Operations: create.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init`

#### IFrameInstance

| Field | Description |
| --- | --- |

Operations: load.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/{iframeInstanceId}`

#### Iframe

| Field | Description |
| --- | --- |
| `ach_setting` |  |
| `allowed_parent_domain` |  |
| `allowed_payment_method` |  |
| `card_setting` |  |
| `click_to_pay_setting` |  |
| `currency` |  |
| `id` |  |
| `label` |  |
| `language` |  |
| `timeout` |  |

Operations: create, list, load, update.

API path: `/api/v4/accounts/{accountId}/payment-iframe`

#### Init

| Field | Description |
| --- | --- |
| `customer` |  |
| `description` |  |
| `item` |  |
| `level2` |  |
| `level3` |  |
| `shipping_address` |  |
| `trace` |  |

Operations: create.

API path: `/api/v4/accounts/{accountId}/payments/init`

#### ListApiKeyScopesEntry

| Field | Description |
| --- | --- |
| `category` |  |
| `description` |  |
| `enabled` |  |
| `level` |  |
| `scope` |  |

Operations: list.

API path: `/api/v4/api-key-scopes`

#### PaymentIframe

| Field | Description |
| --- | --- |

Operations: remove.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}`

#### ThreeDSecureAuth

| Field | Description |
| --- | --- |
| `browser` |  |
| `card` |  |
| `challenge` |  |
| `customer` |  |
| `purchase` |  |
| `server_transaction_id` |  |
| `shipping` |  |
| `status` |  |
| `three_d_secure_challenge_indicator` |  |
| `three_d_secure_id` |  |
| `trace` |  |

Operations: create.

API path: `/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate`

#### ThreeDSecureBrowserInit

| Field | Description |
| --- | --- |
| `acs_result_url` |  |
| `acs_url` |  |
| `cvv` |  |
| `expiry` |  |
| `pan` |  |
| `payment_details_reference` |  |
| `server_transaction_id` |  |
| `status` |  |
| `three_d_secure_data` |  |
| `three_d_secure_id` |  |

Operations: create.

API path: `/api/v4/accounts/{accountId}/3DS/init-card-details`

#### ThreeDSecureStatus

| Field | Description |
| --- | --- |
| `error` |  |
| `info` |  |
| `server_transaction_id` |  |
| `status` |  |
| `three_d_secure` |  |
| `three_d_secure_id` |  |

Operations: load.

API path: `/api/v4/accounts/{accountId}/3DS/{resourceId}/status`

#### TransactionDetail

| Field | Description |
| --- | --- |
| `amount` |  |
| `auth` |  |
| `card` |  |
| `customer` |  |
| `description` |  |
| `id` |  |
| `item` |  |
| `level2` |  |
| `level3` |  |
| `override` |  |
| `shipping_address` |  |
| `status` |  |
| `timestamp` |  |
| `trace` |  |

Operations: load, update.

API path: `/api/v4/accounts/{accountId}/payments/{transactionId}`

#### Webhook

| Field | Description |
| --- | --- |
| `event` |  |
| `id` |  |
| `url` |  |

Operations: create, list, load, remove, update.

API path: `/api/v4/accounts/{accountId}/webhooks`



## Entities


### AccountUpdater

Create an instance: `const account_updater = client.AccountUpdater()`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `const account_updater_schedule = client.AccountUpdaterSchedule()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `boolean` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `Array` |  |

#### Example: Create

```ts
const account_updater_schedule = await client.AccountUpdaterSchedule().create({
  account_id: 'example_account_id',
})
```


### AccountUpdaterScheduleWithResult

Create an instance: `const account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `Array` |  |
| `created_at` | `string` |  |
| `enabled` | `boolean` |  |
| `expiry` | `string` |  |
| `id` | `string` |  |
| `most_recent_update` | `Object` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `Array` |  |
| `type` | `string` |  |
| `updated_at` | `string` |  |

#### Example: List

```ts
const account_updater_schedule_with_results = await client.AccountUpdaterScheduleWithResult().list()
```

#### Example: Create

```ts
const account_updater_schedule_with_result = await client.AccountUpdaterScheduleWithResult().create({
  account_id: 'example_account_id',
})
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `const account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `string` |  |
| `enabled` | `boolean` |  |
| `id` | `string` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `record` | `Array` |  |
| `response_format` | `string` |  |
| `template_ref` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```ts
const account_updater_subscription_with_result = await client.AccountUpdaterSubscriptionWithResult().load({ account_id: 'account_id', subscription_id: 'subscription_id' })
```

#### Example: Create

```ts
const account_updater_subscription_with_result = await client.AccountUpdaterSubscriptionWithResult().create({
  account_id: 'example_account_id',
  subscription_id: 'example_subscription_id',
})
```


### AccountUpdaterUpdate

Create an instance: `const account_updater_update = client.AccountUpdaterUpdate()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `string` |  |
| `format` | `string` |  |
| `id` | `string` |  |
| `new_expiry` | `string` |  |
| `new_token` | `string` |  |
| `old_expiry` | `string` |  |
| `old_token` | `string` |  |
| `recurring_schedule` | `Array` |  |
| `status` | `string` |  |
| `update_id` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```ts
const account_updater_update = await client.AccountUpdaterUpdate().load({ id: 'account_updater_update_id', account_id: 'account_id' })
```


### ApiKey

Create an instance: `const api_key = client.ApiKey()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `Array` |  |
| `enabled` | `boolean` |  |
| `expires_at` | `string` |  |
| `expires_in` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `method` | `Array` |  |
| `scope` | `Array` |  |
| `secret` | `string` |  |

#### Example: Load

```ts
const api_key = await client.ApiKey().load({ id: 'api_key_id', account_id: 'account_id' })
```

#### Example: List

```ts
const api_keys = await client.ApiKey().list()
```

#### Example: Create

```ts
const api_key = await client.ApiKey().create({
  account_id: 'example_account_id',
})
```


### ApplePayMerchantDetail

Create an instance: `const apple_pay_merchant_detail = client.ApplePayMerchantDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `Array` |  |
| `merchant_url` | `string` |  |
| `partner_merchant_name` | `string` |  |
| `payconex_account_id` | `string` |  |

#### Example: List

```ts
const apple_pay_merchant_details = await client.ApplePayMerchantDetail().list()
```

#### Example: Create

```ts
const apple_pay_merchant_detail = await client.ApplePayMerchantDetail().create({
  account_id: 1,
})
```


### ApplePaySession

Create an instance: `const apple_pay_session = client.ApplePaySession()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `string` |  |
| `domain_name` | `string` |  |
| `epoch_timestamp` | `number` |  |
| `expires_at` | `number` |  |
| `merchant_identifier` | `string` |  |
| `merchant_session_identifier` | `string` |  |
| `nonce` | `number` |  |
| `operational_analytics_identifier` | `string` |  |
| `referrer` | `string` |  |
| `retry` | `number` |  |
| `signature` | `string` |  |

#### Example: Create

```ts
const apple_pay_session = await client.ApplePaySession().create({
  account_id: 1,
})
```


### DynamicDescriptor

Create an instance: `const dynamic_descriptor = client.DynamicDescriptor()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `string` |  |
| `descriptor` | `string` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `state` | `string` |  |

#### Example: Load

```ts
const dynamic_descriptor = await client.DynamicDescriptor().load({ id: 'dynamic_descriptor_id', account_id: 'account_id' })
```

#### Example: List

```ts
const dynamic_descriptors = await client.DynamicDescriptor().list()
```

#### Example: Create

```ts
const dynamic_descriptor = await client.DynamicDescriptor().create({
  account_id: 'example_account_id',
})
```


### IFrameCreateInstance

Create an instance: `const i_frame_create_instance = client.IFrameCreateInstance()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `string` |  |
| `currency` | `string` |  |
| `customer` | `Object` |  |
| `initialize_transaction` | `boolean` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `reference` | `string` |  |
| `timeout` | `number` |  |
| `token` | `Array` |  |

#### Example: Create

```ts
const i_frame_create_instance = await client.IFrameCreateInstance().create({
  account_id: 'example_account_id',
  payment_iframe_id: 'example_payment_iframe_id',
})
```


### IFrameInstance

Create an instance: `const i_frame_instance = client.IFrameInstance()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const i_frame_instance = await client.IFrameInstance().load({ id: 'i_frame_instance_id', account_id: 'account_id', payment_iframe_id: 'payment_iframe_id' })
```


### Iframe

Create an instance: `const iframe = client.Iframe()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `Object` |  |
| `allowed_parent_domain` | `Array` |  |
| `allowed_payment_method` | `Array` |  |
| `card_setting` | `Object` |  |
| `click_to_pay_setting` | `Object` |  |
| `currency` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `timeout` | `number` |  |

#### Example: Load

```ts
const iframe = await client.Iframe().load({ account_id: 'account_id', iframe_id: 'iframe_id' })
```

#### Example: List

```ts
const iframes = await client.Iframe().list()
```

#### Example: Create

```ts
const iframe = await client.Iframe().create({
  account_id: 'example_account_id',
})
```


### Init

Create an instance: `const init = client.Init()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `Object` |  |
| `description` | `string` |  |
| `item` | `Array` |  |
| `level2` | `Object` |  |
| `level3` | `Object` |  |
| `shipping_address` | `Object` |  |
| `trace` | `Object` |  |

#### Example: Create

```ts
const init = await client.Init().create({
  account_id: 'example_account_id',
})
```


### ListApiKeyScopesEntry

Create an instance: `const list_api_key_scopes_entry = client.ListApiKeyScopesEntry()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `string` |  |
| `description` | `string` |  |
| `enabled` | `boolean` |  |
| `level` | `number` |  |
| `scope` | `string` |  |

#### Example: List

```ts
const list_api_key_scopes_entrys = await client.ListApiKeyScopesEntry().list()
```


### PaymentIframe

Create an instance: `const payment_iframe = client.PaymentIframe()`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `const three_d_secure_auth = client.ThreeDSecureAuth()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `Object` |  |
| `card` | `Object` |  |
| `challenge` | `Object` |  |
| `customer` | `Object` |  |
| `purchase` | `Object` |  |
| `server_transaction_id` | `string` |  |
| `shipping` | `Object` |  |
| `status` | `string` |  |
| `three_d_secure_challenge_indicator` | `string` |  |
| `three_d_secure_id` | `string` |  |
| `trace` | `Object` |  |

#### Example: Create

```ts
const three_d_secure_auth = await client.ThreeDSecureAuth().create({
  '3_d_id': 'example_3_d_id',
  account_id: 'example_account_id',
})
```


### ThreeDSecureBrowserInit

Create an instance: `const three_d_secure_browser_init = client.ThreeDSecureBrowserInit()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `string` |  |
| `acs_url` | `string` |  |
| `cvv` | `string` |  |
| `expiry` | `string` |  |
| `pan` | `string` |  |
| `payment_details_reference` | `string` |  |
| `server_transaction_id` | `string` |  |
| `status` | `string` |  |
| `three_d_secure_data` | `string` |  |
| `three_d_secure_id` | `string` |  |

#### Example: Create

```ts
const three_d_secure_browser_init = await client.ThreeDSecureBrowserInit().create({
  account_id: 'example_account_id',
})
```


### ThreeDSecureStatus

Create an instance: `const three_d_secure_status = client.ThreeDSecureStatus()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `Object` |  |
| `info` | `Object` |  |
| `server_transaction_id` | `string` |  |
| `status` | `string` |  |
| `three_d_secure` | `Object` |  |
| `three_d_secure_id` | `string` |  |

#### Example: Load

```ts
const three_d_secure_status = await client.ThreeDSecureStatus().load({ '3_d_id': '3_d_id', account_id: 'account_id' })
```


### TransactionDetail

Create an instance: `const transaction_detail = client.TransactionDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `Object` |  |
| `auth` | `Object` |  |
| `card` | `Object` |  |
| `customer` | `Object` |  |
| `description` | `string` |  |
| `id` | `string` |  |
| `item` | `Array` |  |
| `level2` | `Object` |  |
| `level3` | `Object` |  |
| `override` | `Object` |  |
| `shipping_address` | `Object` |  |
| `status` | `string` |  |
| `timestamp` | `string` |  |
| `trace` | `Object` |  |

#### Example: Load

```ts
const transaction_detail = await client.TransactionDetail().load({ account_id: 'account_id', transaction_id: 'transaction_id' })
```


### Webhook

Create an instance: `const webhook = client.Webhook()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `string` |  |
| `id` | `string` |  |
| `url` | `string` |  |

#### Example: Load

```ts
const webhook = await client.Webhook().load({ id: 'webhook_id', account_id: 'account_id' })
```

#### Example: List

```ts
const webhooks = await client.Webhook().list()
```

#### Example: Create

```ts
const webhook = await client.Webhook().create({
  account_id: 'example_account_id',
})
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
bluefin-payconex/
├── src/
│   ├── BluefinPayconexSDK.js        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
└── test/                   # Test suites
```

Import the SDK from the package root:

```js
const { BluefinPayconexSDK } = require('@voxgig-sdk/bluefin-payconex-js')
```

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const threedsecurestatus = client.ThreeDSecureStatus()
await threedsecurestatus.load({ '3_d_id': "example", account_id: "example" })

// threedsecurestatus.data() now returns the threedsecurestatus data from the last `load`
// threedsecurestatus.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
