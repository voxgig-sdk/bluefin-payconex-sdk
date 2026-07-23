# BluefinPayconex Dart SDK



The Dart SDK for the BluefinPayconex API — an entity-oriented client following idiomatic Dart conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.AccountUpdater()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to pub.dev. Add it as a git
dependency (pinned to a release tag `dart/vX.Y.Z`, see
[Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) in your `pubspec.yaml`:

```yaml
dependencies:
  bluefin_payconex_sdk:
    git:
      url: https://github.com/voxgig-sdk/bluefin-payconex-sdk
      path: dart
      ref: dart/v0.0.1
```

Or depend on a local source checkout:

```yaml
dependencies:
  bluefin_payconex_sdk:
    path: ../dart
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```dart
import 'dart:io';
import 'package:bluefin_payconex_sdk/BluefinPayconexSDK.dart';

final client = BluefinPayconexSDK({
  'apikey': Platform.environment['BLUEFIN_PAYCONEX_APIKEY'],
});
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record (a `Map`) and throws on error.

```dart
try {
  final accountupdatersubscriptionwithresult = await client.AccountUpdaterSubscriptionWithResult().load({'account_id': 'example_account_id', 'subscription_id': 'example_subscription_id'});
  print(accountupdatersubscriptionwithresult);
} catch (err) {
  print('load failed: $err');
}
```

### 4. Create, update, and remove

```dart
// Remove
await client.AccountUpdater().remove({'account_id': 'example_account_id', 'subscription_id': 'example_subscription_id'});
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

```dart
final result = await client.direct({
  'path': '/api/resource/{id}',
  'method': 'GET',
  'params': {'id': 'example'},
});

if (true == result['ok']) {
  print(result['status']);  // 200
  print(result['data']);    // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. direct() never throws —
  // branch on result['ok'].
  print(result['status']);
  print(result['err']);
}
```

### Prepare a request without sending it

```dart
// prepare() returns the fetch definition (or an error value on failure).
final fetchdef = await client.prepare({
  'path': '/api/resource/{id}',
  'method': 'DELETE',
  'params': {'id': 'example'},
});

print(fetchdef['url']);
print(fetchdef['method']);
print(fetchdef['headers']);
```

### Use test mode

Create a mock client for unit testing — no server required:

```dart
final client = BluefinPayconexSDK.test();

// Entity ops return the bare record and throw on error.
final threedsecurestatus = await client.ThreeDSecureStatus().load();
// threedsecurestatus contains the mock response record
print(threedsecurestatus);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```dart
Future<dynamic> mockFetch(dynamic url, dynamic init) async {
  return {
    'status': 200,
    'statusText': 'OK',
    'headers': <String, dynamic>{},
    'json': () => {'id': 'mock01'},
  };
}

final client = BluefinPayconexSDK({
  'base': 'http://localhost:8080',
  'system': {
    'fetch': mockFetch,
  },
});
```

### Run live tests

Set the live-mode environment variables:

```bash
export BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
export BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd dart && dart run test/main.dart
```


## Reference

### BluefinPayconexSDK

```dart
import 'package:bluefin_payconex_sdk/BluefinPayconexSDK.dart';

final client = BluefinPayconexSDK(options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### test

```dart
final client = BluefinPayconexSDK.test(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options` | `() -> Map` | Deep copy of current SDK options. |
| `utility` | `() -> Utility` | The SDK utility object. |
| `prepare` | `([fetchargs]) -> Future` | Build an HTTP request definition without sending. Returns an error value on failure. |
| `direct` | `([fetchargs]) -> Future<Map>` | Build and send an HTTP request. Returns a result map (branch on `ok`); never throws. |
| `AccountUpdater` | `([entopts]) -> AccountUpdaterEntity` | Create an AccountUpdater entity instance. |
| `AccountUpdaterSchedule` | `([entopts]) -> AccountUpdaterScheduleEntity` | Create an AccountUpdaterSchedule entity instance. |
| `AccountUpdaterScheduleWithResult` | `([entopts]) -> AccountUpdaterScheduleWithResultEntity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `AccountUpdaterSubscriptionWithResult` | `([entopts]) -> AccountUpdaterSubscriptionWithResultEntity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `AccountUpdaterUpdate` | `([entopts]) -> AccountUpdaterUpdateEntity` | Create an AccountUpdaterUpdate entity instance. |
| `ApiKey` | `([entopts]) -> ApiKeyEntity` | Create an ApiKey entity instance. |
| `ApplePayMerchantDetail` | `([entopts]) -> ApplePayMerchantDetailEntity` | Create an ApplePayMerchantDetail entity instance. |
| `ApplePaySession` | `([entopts]) -> ApplePaySessionEntity` | Create an ApplePaySession entity instance. |
| `DynamicDescriptor` | `([entopts]) -> DynamicDescriptorEntity` | Create a DynamicDescriptor entity instance. |
| `IFrameCreateInstance` | `([entopts]) -> IFrameCreateInstanceEntity` | Create an IFrameCreateInstance entity instance. |
| `IFrameInstance` | `([entopts]) -> IFrameInstanceEntity` | Create an IFrameInstance entity instance. |
| `Iframe` | `([entopts]) -> IframeEntity` | Create an Iframe entity instance. |
| `Init` | `([entopts]) -> InitEntity` | Create an Init entity instance. |
| `ListApiKeyScopesEntry` | `([entopts]) -> ListApiKeyScopesEntryEntity` | Create a ListApiKeyScopesEntry entity instance. |
| `PaymentIframe` | `([entopts]) -> PaymentIframeEntity` | Create a PaymentIframe entity instance. |
| `ThreeDSecureAuth` | `([entopts]) -> ThreeDSecureAuthEntity` | Create a ThreeDSecureAuth entity instance. |
| `ThreeDSecureBrowserInit` | `([entopts]) -> ThreeDSecureBrowserInitEntity` | Create a ThreeDSecureBrowserInit entity instance. |
| `ThreeDSecureStatus` | `([entopts]) -> ThreeDSecureStatusEntity` | Create a ThreeDSecureStatus entity instance. |
| `TransactionDetail` | `([entopts]) -> TransactionDetailEntity` | Create a TransactionDetail entity instance. |
| `Webhook` | `([entopts]) -> WebhookEntity` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, [ctrl]) -> Future<dynamic>` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, [ctrl]) -> Future<List>` | List entities matching the criteria (a list of entity instances). Throws on error. |
| `create` | `(reqdata, [ctrl]) -> Future<dynamic>` | Create a new entity. Throws on error. |
| `update` | `(reqdata, [ctrl]) -> Future<dynamic>` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, [ctrl]) -> Future<dynamic>` | Remove an entity. Throws on error. |
| `data` | `([d]) -> Map` | Get (or, with an argument, set) entity data. |
| `match` | `([m]) -> Map` | Get (or, with an argument, set) entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `entopts` | `() -> Map` | Return the entity options. |
| `Name` | `String` | The entity name (a public field). |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, a `List` of entity instances for `list`) and throw on error. Wrap calls
in `try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `Map` you
branch on via `result['ok']`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `dynamic` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### AccountUpdater

| Field | Description |
| --- | --- |

Operations: Remove.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}`

#### AccountUpdaterSchedule

| Field | Description |
| --- | --- |
| `enabled` |  |
| `period_date` |  |
| `period_id` |  |
| `response_format` |  |
| `token` |  |

Operations: Create.

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

Operations: Create, List.

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

Operations: Create, Load, Update.

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

Operations: Load.

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

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/api-keys`

#### ApplePayMerchantDetail

| Field | Description |
| --- | --- |
| `domain` |  |
| `merchant_url` |  |
| `partner_merchant_name` |  |
| `payconex_account_id` |  |

Operations: Create, List.

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

Operations: Create.

API path: `/api/v4/accounts/{accountId}/applePay/session`

#### DynamicDescriptor

| Field | Description |
| --- | --- |
| `city` |  |
| `descriptor` |  |
| `id` |  |
| `name` |  |
| `state` |  |

Operations: Create, List, Load, Remove, Update.

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

Operations: Create.

API path: `/api/v4/accounts/{accountId}/payment-iframe/{iframeId}/instance/init`

#### IFrameInstance

| Field | Description |
| --- | --- |

Operations: Load.

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

Operations: Create, List, Load, Update.

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

Operations: Create.

API path: `/api/v4/accounts/{accountId}/payments/init`

#### ListApiKeyScopesEntry

| Field | Description |
| --- | --- |
| `category` |  |
| `description` |  |
| `enabled` |  |
| `level` |  |
| `scope` |  |

Operations: List.

API path: `/api/v4/api-key-scopes`

#### PaymentIframe

| Field | Description |
| --- | --- |

Operations: Remove.

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

Operations: Create.

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

Operations: Create.

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

Operations: Load.

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

Operations: Load, Update.

API path: `/api/v4/accounts/{accountId}/payments/{transactionId}`

#### Webhook

| Field | Description |
| --- | --- |
| `event` |  |
| `id` |  |
| `url` |  |

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/webhooks`



## Entities


### AccountUpdater

Create an instance: `final account_updater = client.AccountUpdater();`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `final account_updater_schedule = client.AccountUpdaterSchedule();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `List<dynamic>` |  |

#### Example: Create

```dart
final account_updater_schedule = await client.AccountUpdaterSchedule().create({
  'account_id': 'example_account_id',  // String
});
```


### AccountUpdaterScheduleWithResult

Create an instance: `final account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `List<dynamic>` |  |
| `created_at` | `String` |  |
| `enabled` | `bool` |  |
| `expiry` | `String` |  |
| `id` | `String` |  |
| `most_recent_update` | `Map<String, dynamic>` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `List<dynamic>` |  |
| `type` | `String` |  |
| `updated_at` | `String` |  |

#### Example: List

```dart
final account_updater_schedule_with_results = await client.AccountUpdaterScheduleWithResult().list();
```

#### Example: Create

```dart
final account_updater_schedule_with_result = await client.AccountUpdaterScheduleWithResult().create({
  'account_id': 'example_account_id',  // String
});
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `final account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `String` |  |
| `enabled` | `bool` |  |
| `id` | `String` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `record` | `List<dynamic>` |  |
| `response_format` | `String` |  |
| `template_ref` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```dart
final account_updater_subscription_with_result = await client.AccountUpdaterSubscriptionWithResult().load({'account_id': 'account_id', 'subscription_id': 'subscription_id'});
```

#### Example: Create

```dart
final account_updater_subscription_with_result = await client.AccountUpdaterSubscriptionWithResult().create({
  'account_id': 'example_account_id',  // String
  'subscription_id': 'example_subscription_id',  // String
});
```


### AccountUpdaterUpdate

Create an instance: `final account_updater_update = client.AccountUpdaterUpdate();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `String` |  |
| `format` | `String` |  |
| `id` | `String` |  |
| `new_expiry` | `String` |  |
| `new_token` | `String` |  |
| `old_expiry` | `String` |  |
| `old_token` | `String` |  |
| `recurring_schedule` | `List<dynamic>` |  |
| `status` | `String` |  |
| `update_id` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```dart
final account_updater_update = await client.AccountUpdaterUpdate().load({'id': 'account_updater_update_id', 'account_id': 'account_id'});
```


### ApiKey

Create an instance: `final api_key = client.ApiKey();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `List<dynamic>` |  |
| `enabled` | `bool` |  |
| `expires_at` | `String` |  |
| `expires_in` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `method` | `List<dynamic>` |  |
| `scope` | `List<dynamic>` |  |
| `secret` | `String` |  |

#### Example: Load

```dart
final api_key = await client.ApiKey().load({'id': 'api_key_id', 'account_id': 'account_id'});
```

#### Example: List

```dart
final api_keys = await client.ApiKey().list();
```

#### Example: Create

```dart
final api_key = await client.ApiKey().create({
  'account_id': 'example_account_id',  // String
});
```


### ApplePayMerchantDetail

Create an instance: `final apple_pay_merchant_detail = client.ApplePayMerchantDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `List<dynamic>` |  |
| `merchant_url` | `String` |  |
| `partner_merchant_name` | `String` |  |
| `payconex_account_id` | `String` |  |

#### Example: List

```dart
final apple_pay_merchant_details = await client.ApplePayMerchantDetail().list();
```

#### Example: Create

```dart
final apple_pay_merchant_detail = await client.ApplePayMerchantDetail().create({
  'account_id': 1,  // int
});
```


### ApplePaySession

Create an instance: `final apple_pay_session = client.ApplePaySession();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `String` |  |
| `domain_name` | `String` |  |
| `epoch_timestamp` | `int` |  |
| `expires_at` | `int` |  |
| `merchant_identifier` | `String` |  |
| `merchant_session_identifier` | `String` |  |
| `nonce` | `int` |  |
| `operational_analytics_identifier` | `String` |  |
| `referrer` | `String` |  |
| `retry` | `int` |  |
| `signature` | `String` |  |

#### Example: Create

```dart
final apple_pay_session = await client.ApplePaySession().create({
  'account_id': 1,  // int
});
```


### DynamicDescriptor

Create an instance: `final dynamic_descriptor = client.DynamicDescriptor();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `String` |  |
| `descriptor` | `String` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `state` | `String` |  |

#### Example: Load

```dart
final dynamic_descriptor = await client.DynamicDescriptor().load({'id': 'dynamic_descriptor_id', 'account_id': 'account_id'});
```

#### Example: List

```dart
final dynamic_descriptors = await client.DynamicDescriptor().list();
```

#### Example: Create

```dart
final dynamic_descriptor = await client.DynamicDescriptor().create({
  'account_id': 'example_account_id',  // String
});
```


### IFrameCreateInstance

Create an instance: `final i_frame_create_instance = client.IFrameCreateInstance();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `String` |  |
| `currency` | `String` |  |
| `customer` | `Map<String, dynamic>` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `reference` | `String` |  |
| `timeout` | `num` |  |
| `token` | `List<dynamic>` |  |

#### Example: Create

```dart
final i_frame_create_instance = await client.IFrameCreateInstance().create({
  'account_id': 'example_account_id',  // String
  'payment_iframe_id': 'example_payment_iframe_id',  // String
});
```


### IFrameInstance

Create an instance: `final i_frame_instance = client.IFrameInstance();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```dart
final i_frame_instance = await client.IFrameInstance().load({'id': 'i_frame_instance_id', 'account_id': 'account_id', 'payment_iframe_id': 'payment_iframe_id'});
```


### Iframe

Create an instance: `final iframe = client.Iframe();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `Map<String, dynamic>` |  |
| `allowed_parent_domain` | `List<dynamic>` |  |
| `allowed_payment_method` | `List<dynamic>` |  |
| `card_setting` | `Map<String, dynamic>` |  |
| `click_to_pay_setting` | `Map<String, dynamic>` |  |
| `currency` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `timeout` | `num` |  |

#### Example: Load

```dart
final iframe = await client.Iframe().load({'account_id': 'account_id', 'iframe_id': 'iframe_id'});
```

#### Example: List

```dart
final iframes = await client.Iframe().list();
```

#### Example: Create

```dart
final iframe = await client.Iframe().create({
  'account_id': 'example_account_id',  // String
});
```


### Init

Create an instance: `final init = client.Init();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `Map<String, dynamic>` |  |
| `description` | `String` |  |
| `item` | `List<dynamic>` |  |
| `level2` | `Map<String, dynamic>` |  |
| `level3` | `Map<String, dynamic>` |  |
| `shipping_address` | `Map<String, dynamic>` |  |
| `trace` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final init = await client.Init().create({
  'account_id': 'example_account_id',  // String
});
```


### ListApiKeyScopesEntry

Create an instance: `final list_api_key_scopes_entry = client.ListApiKeyScopesEntry();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `String` |  |
| `description` | `String` |  |
| `enabled` | `bool` |  |
| `level` | `int` |  |
| `scope` | `String` |  |

#### Example: List

```dart
final list_api_key_scopes_entrys = await client.ListApiKeyScopesEntry().list();
```


### PaymentIframe

Create an instance: `final payment_iframe = client.PaymentIframe();`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `final three_d_secure_auth = client.ThreeDSecureAuth();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `Map<String, dynamic>` |  |
| `card` | `Map<String, dynamic>` |  |
| `challenge` | `Map<String, dynamic>` |  |
| `customer` | `Map<String, dynamic>` |  |
| `purchase` | `Map<String, dynamic>` |  |
| `server_transaction_id` | `String` |  |
| `shipping` | `Map<String, dynamic>` |  |
| `status` | `String` |  |
| `three_d_secure_challenge_indicator` | `String` |  |
| `three_d_secure_id` | `String` |  |
| `trace` | `Map<String, dynamic>` |  |

#### Example: Create

```dart
final three_d_secure_auth = await client.ThreeDSecureAuth().create({
  '3_d_id': 'example_3_d_id',  // String
  'account_id': 'example_account_id',  // String
});
```


### ThreeDSecureBrowserInit

Create an instance: `final three_d_secure_browser_init = client.ThreeDSecureBrowserInit();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `String` |  |
| `acs_url` | `String` |  |
| `cvv` | `String` |  |
| `expiry` | `String` |  |
| `pan` | `String` |  |
| `payment_details_reference` | `String` |  |
| `server_transaction_id` | `String` |  |
| `status` | `String` |  |
| `three_d_secure_data` | `String` |  |
| `three_d_secure_id` | `String` |  |

#### Example: Create

```dart
final three_d_secure_browser_init = await client.ThreeDSecureBrowserInit().create({
  'account_id': 'example_account_id',  // String
});
```


### ThreeDSecureStatus

Create an instance: `final three_d_secure_status = client.ThreeDSecureStatus();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `Map<String, dynamic>` |  |
| `info` | `Map<String, dynamic>` |  |
| `server_transaction_id` | `String` |  |
| `status` | `String` |  |
| `three_d_secure` | `Map<String, dynamic>` |  |
| `three_d_secure_id` | `String` |  |

#### Example: Load

```dart
final three_d_secure_status = await client.ThreeDSecureStatus().load({'3_d_id': '3_d_id', 'account_id': 'account_id'});
```


### TransactionDetail

Create an instance: `final transaction_detail = client.TransactionDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `Map<String, dynamic>` |  |
| `auth` | `Map<String, dynamic>` |  |
| `card` | `Map<String, dynamic>` |  |
| `customer` | `Map<String, dynamic>` |  |
| `description` | `String` |  |
| `id` | `String` |  |
| `item` | `List<dynamic>` |  |
| `level2` | `Map<String, dynamic>` |  |
| `level3` | `Map<String, dynamic>` |  |
| `override` | `Map<String, dynamic>` |  |
| `shipping_address` | `Map<String, dynamic>` |  |
| `status` | `String` |  |
| `timestamp` | `String` |  |
| `trace` | `Map<String, dynamic>` |  |

#### Example: Load

```dart
final transaction_detail = await client.TransactionDetail().load({'account_id': 'account_id', 'transaction_id': 'transaction_id'});
```


### Webhook

Create an instance: `final webhook = client.Webhook();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `String` |  |
| `id` | `String` |  |
| `url` | `String` |  |

#### Example: Load

```dart
final webhook = await client.Webhook().load({'id': 'webhook_id', 'account_id': 'account_id'});
```

#### Example: List

```dart
final webhooks = await client.Webhook().list();
```

#### Example: Create

```dart
final webhook = await client.Webhook().create({
  'account_id': 'example_account_id',  // String
});
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

### Maps in, typed models alongside

The Dart SDK passes plain `Map<String, dynamic>` values through the
operation pipeline rather than requiring typed objects at every call. This
mirrors the dynamic nature of the API and keeps calls terse — a create is
just `create({'name': 'example'})`.

For a typed, documented view of each entity and operation, the generated
`BluefinPayconexTypes.dart` provides a class per entity plus per-op request/match
classes (e.g. `BluefinPayconex.fromMap(entity.data())` and `model.toMap()`), so you
can convert to and from those maps wherever you want compile-time structure.

### Package structure

```
dart/
├── lib/
│   ├── BluefinPayconexSDK.dart          -- Main SDK library (exported entry point)
│   ├── BluefinPayconexTypes.dart        -- Typed entity + request/match models
│   ├── BluefinPayconexEntityBase.dart   -- Base class for entities
│   ├── BluefinPayconexError.dart        -- SDK error type
│   ├── Config.dart              -- Configuration
│   ├── entity/                  -- Entity implementations
│   ├── feature/                 -- Built-in features (base, test, log, ...)
│   └── utility/                 -- Utility functions and vendored struct library
└── test/                        -- Test suites (dart run test/main.dart)
```

The main library (`BluefinPayconexSDK.dart`) re-exports the SDK class, the typed
models, and every entity class, so a single
`import 'package:bluefin_payconex_sdk/BluefinPayconexSDK.dart';`
brings in everything you need.

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
