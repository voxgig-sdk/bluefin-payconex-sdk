# BluefinPayconex Dart SDK Reference

Complete API reference for the BluefinPayconex Dart SDK.

## BluefinPayconexSDK

### Constructor

```dart
import 'package:bluefin_payconex_sdk/BluefinPayconexSDK.dart';

final client = BluefinPayconexSDK(options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options['apikey']` | `String` | API key for authentication. |
| `options['base']` | `String` | Base URL for API requests. |
| `options['prefix']` | `String` | URL prefix appended after base. |
| `options['suffix']` | `String` | URL suffix appended after path. |
| `options['headers']` | `Map` | Custom headers for all requests. |
| `options['feature']` | `Map` | Feature configuration. |
| `options['system']` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK.test([testopts, sdkopts])`

Create a test client with mock features active. Both arguments may be `null`.

```dart
final client = BluefinPayconexSDK.test();
```


### Instance Methods

#### `AccountUpdater([entopts])`

Create a new `AccountUpdaterEntity` instance. Pass no argument for no initial data.

#### `AccountUpdaterSchedule([entopts])`

Create a new `AccountUpdaterScheduleEntity` instance. Pass no argument for no initial data.

#### `AccountUpdaterScheduleWithResult([entopts])`

Create a new `AccountUpdaterScheduleWithResultEntity` instance. Pass no argument for no initial data.

#### `AccountUpdaterSubscriptionWithResult([entopts])`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance. Pass no argument for no initial data.

#### `AccountUpdaterUpdate([entopts])`

Create a new `AccountUpdaterUpdateEntity` instance. Pass no argument for no initial data.

#### `ApiKey([entopts])`

Create a new `ApiKeyEntity` instance. Pass no argument for no initial data.

#### `ApplePayMerchantDetail([entopts])`

Create a new `ApplePayMerchantDetailEntity` instance. Pass no argument for no initial data.

#### `ApplePaySession([entopts])`

Create a new `ApplePaySessionEntity` instance. Pass no argument for no initial data.

#### `DynamicDescriptor([entopts])`

Create a new `DynamicDescriptorEntity` instance. Pass no argument for no initial data.

#### `IFrameCreateInstance([entopts])`

Create a new `IFrameCreateInstanceEntity` instance. Pass no argument for no initial data.

#### `IFrameInstance([entopts])`

Create a new `IFrameInstanceEntity` instance. Pass no argument for no initial data.

#### `Iframe([entopts])`

Create a new `IframeEntity` instance. Pass no argument for no initial data.

#### `Init([entopts])`

Create a new `InitEntity` instance. Pass no argument for no initial data.

#### `ListApiKeyScopesEntry([entopts])`

Create a new `ListApiKeyScopesEntryEntity` instance. Pass no argument for no initial data.

#### `PaymentIframe([entopts])`

Create a new `PaymentIframeEntity` instance. Pass no argument for no initial data.

#### `ThreeDSecureAuth([entopts])`

Create a new `ThreeDSecureAuthEntity` instance. Pass no argument for no initial data.

#### `ThreeDSecureBrowserInit([entopts])`

Create a new `ThreeDSecureBrowserInitEntity` instance. Pass no argument for no initial data.

#### `ThreeDSecureStatus([entopts])`

Create a new `ThreeDSecureStatusEntity` instance. Pass no argument for no initial data.

#### `TransactionDetail([entopts])`

Create a new `TransactionDetailEntity` instance. Pass no argument for no initial data.

#### `Webhook([entopts])`

Create a new `WebhookEntity` instance. Pass no argument for no initial data.

#### `options() -> Map`

Return a deep copy of the current SDK options.

#### `utility() -> Utility`

Return the SDK utility object.

#### `direct([fetchargs]) -> Future<Map>`

Make a direct HTTP request to any API endpoint. Returns a result `Map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `result['ok']`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs['path']` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs['method']` | `String` | HTTP method (default: `'GET'`). |
| `fetchargs['params']` | `Map` | Path parameter values. |
| `fetchargs['query']` | `Map` | Query string parameters. |
| `fetchargs['headers']` | `Map` | Request headers (merged with defaults). |
| `fetchargs['body']` | `dynamic` | Request body (maps are JSON-serialized). |

**Returns:** `Future<Map>`

#### `prepare([fetchargs]) -> Future`

Prepare a fetch definition without sending. Returns the `fetchdef` (or an error value on failure).


---

## AccountUpdaterEntity

```dart
final account_updater = client.AccountUpdater();
```

### Operations

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.AccountUpdater().remove({'account_id': 'account_id', 'subscription_id': 'subscription_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `AccountUpdaterEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## AccountUpdaterScheduleEntity

```dart
final account_updater_schedule = client.AccountUpdaterSchedule();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `List<dynamic>` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.AccountUpdaterSchedule().create({
  'account_id': 'example_account_id',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## AccountUpdaterScheduleWithResultEntity

```dart
final account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `List<dynamic>` | Yes |  |
| `created_at` | `String` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `String` | No |  |
| `id` | `String` | Yes |  |
| `most_recent_update` | `Map<String, dynamic>` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `List<dynamic>` | Yes |  |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.AccountUpdaterScheduleWithResult().create({
  'account_id': 'example_account_id',  // String
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.AccountUpdaterScheduleWithResult().list();
for (final account_updater_schedule_with_result in results) {
  print(account_updater_schedule_with_result.data());
}
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## AccountUpdaterSubscriptionWithResultEntity

```dart
final account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `String` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | No |  |
| `record` | `List<dynamic>` | No |  |
| `response_format` | `String` | No |  |
| `template_ref` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.AccountUpdaterSubscriptionWithResult().create({
  'account_id': 'example_account_id',  // String
  'subscription_id': 'example_subscription_id',  // String
});
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.AccountUpdaterSubscriptionWithResult().load({'account_id': 'account_id', 'subscription_id': 'subscription_id'});
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```dart
final result = await client.AccountUpdaterSubscriptionWithResult().update({
  'account_id': 'account_id',
  'subscription_id': 'subscription_id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## AccountUpdaterUpdateEntity

```dart
final account_updater_update = client.AccountUpdaterUpdate();
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
| `recurring_schedule` | `List<dynamic>` | No |  |
| `status` | `String` | No |  |
| `update_id` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.AccountUpdaterUpdate().load({'id': 'account_updater_update_id', 'account_id': 'account_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `AccountUpdaterUpdateEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ApiKeyEntity

```dart
final api_key = client.ApiKey();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `List<dynamic>` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `String` | No |  |
| `expires_in` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | No |  |
| `method` | `List<dynamic>` | No |  |
| `scope` | `List<dynamic>` | No |  |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.ApiKey().create({
  'account_id': 'example_account_id',  // String
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.ApiKey().list();
for (final api_key in results) {
  print(api_key.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.ApiKey().load({'id': 'api_key_id', 'account_id': 'account_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.ApiKey().remove({'id': 'api_key_id', 'account_id': 'account_id'});
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```dart
final result = await client.ApiKey().update({
  'id': 'api_key_id',
  'account_id': 'account_id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ApiKeyEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ApplePayMerchantDetailEntity

```dart
final apple_pay_merchant_detail = client.ApplePayMerchantDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `List<dynamic>` | Yes |  |
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.ApplePayMerchantDetail().create({
  'account_id': 1,  // int
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.ApplePayMerchantDetail().list();
for (final apple_pay_merchant_detail in results) {
  print(apple_pay_merchant_detail.data());
}
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ApplePayMerchantDetailEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ApplePaySessionEntity

```dart
final apple_pay_session = client.ApplePaySession();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String` | No |  |
| `domain_name` | `String` | No |  |
| `epoch_timestamp` | `int` | No |  |
| `expires_at` | `int` | No |  |
| `merchant_identifier` | `String` | No |  |
| `merchant_session_identifier` | `String` | No |  |
| `nonce` | `int` | No |  |
| `operational_analytics_identifier` | `String` | No |  |
| `referrer` | `String` | Yes |  |
| `retry` | `int` | No |  |
| `signature` | `String` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.ApplePaySession().create({
  'account_id': 1,  // int
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ApplePaySessionEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## DynamicDescriptorEntity

```dart
final dynamic_descriptor = client.DynamicDescriptor();
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.DynamicDescriptor().create({
  'account_id': 'example_account_id',  // String
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.DynamicDescriptor().list();
for (final dynamic_descriptor in results) {
  print(dynamic_descriptor.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.DynamicDescriptor().load({'id': 'dynamic_descriptor_id', 'account_id': 'account_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.DynamicDescriptor().remove({'id': 'dynamic_descriptor_id', 'account_id': 'account_id'});
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```dart
final result = await client.DynamicDescriptor().update({
  'id': 'dynamic_descriptor_id',
  'account_id': 'account_id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `DynamicDescriptorEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## IFrameCreateInstanceEntity

```dart
final i_frame_create_instance = client.IFrameCreateInstance();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String` | No |  |
| `currency` | `String` | No |  |
| `customer` | `Map<String, dynamic>` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `reference` | `String` | No |  |
| `timeout` | `num` | No |  |
| `token` | `List<dynamic>` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.IFrameCreateInstance().create({
  'account_id': 'example_account_id',  // String
  'payment_iframe_id': 'example_payment_iframe_id',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `IFrameCreateInstanceEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## IFrameInstanceEntity

```dart
final i_frame_instance = client.IFrameInstance();
```

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.IFrameInstance().load({'id': 'i_frame_instance_id', 'account_id': 'account_id', 'payment_iframe_id': 'payment_iframe_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `IFrameInstanceEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## IframeEntity

```dart
final iframe = client.Iframe();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Map<String, dynamic>` | No |  |
| `allowed_parent_domain` | `List<dynamic>` | Yes |  |
| `allowed_payment_method` | `List<dynamic>` | Yes |  |
| `card_setting` | `Map<String, dynamic>` | No |  |
| `click_to_pay_setting` | `Map<String, dynamic>` | No |  |
| `currency` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `timeout` | `num` | No |  |

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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Iframe().create({
  'account_id': 'example_account_id',  // String
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Iframe().list();
for (final iframe in results) {
  print(iframe.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Iframe().load({'account_id': 'account_id', 'iframe_id': 'iframe_id'});
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```dart
final result = await client.Iframe().update({
  'account_id': 'account_id',
  'iframe_id': 'iframe_id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `IframeEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## InitEntity

```dart
final init = client.Init();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Map<String, dynamic>` | No |  |
| `description` | `String` | No |  |
| `item` | `List<dynamic>` | No |  |
| `level2` | `Map<String, dynamic>` | No |  |
| `level3` | `Map<String, dynamic>` | No |  |
| `shipping_address` | `Map<String, dynamic>` | Yes |  |
| `trace` | `Map<String, dynamic>` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Init().create({
  'account_id': 'example_account_id',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `InitEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ListApiKeyScopesEntryEntity

```dart
final list_api_key_scopes_entry = client.ListApiKeyScopesEntry();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `description` | `String` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `int` | No |  |
| `scope` | `String` | No |  |

### Operations

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.ListApiKeyScopesEntry().list();
for (final list_api_key_scopes_entry in results) {
  print(list_api_key_scopes_entry.data());
}
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ListApiKeyScopesEntryEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## PaymentIframeEntity

```dart
final payment_iframe = client.PaymentIframe();
```

### Operations

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.PaymentIframe().remove({'account_id': 'account_id', 'id': 'id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `PaymentIframeEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ThreeDSecureAuthEntity

```dart
final three_d_secure_auth = client.ThreeDSecureAuth();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Map<String, dynamic>` | Yes |  |
| `card` | `Map<String, dynamic>` | Yes |  |
| `challenge` | `Map<String, dynamic>` | No |  |
| `customer` | `Map<String, dynamic>` | No |  |
| `purchase` | `Map<String, dynamic>` | Yes |  |
| `server_transaction_id` | `String` | No |  |
| `shipping` | `Map<String, dynamic>` | Yes |  |
| `status` | `String` | No |  |
| `three_d_secure_challenge_indicator` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |
| `trace` | `Map<String, dynamic>` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.ThreeDSecureAuth().create({
  '3_d_id': 'example_3_d_id',  // String
  'account_id': 'example_account_id',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ThreeDSecureAuthEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ThreeDSecureBrowserInitEntity

```dart
final three_d_secure_browser_init = client.ThreeDSecureBrowserInit();
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

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.ThreeDSecureBrowserInit().create({
  'account_id': 'example_account_id',  // String
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## ThreeDSecureStatusEntity

```dart
final three_d_secure_status = client.ThreeDSecureStatus();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Map<String, dynamic>` | No |  |
| `info` | `Map<String, dynamic>` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure` | `Map<String, dynamic>` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.ThreeDSecureStatus().load({'3_d_id': '3_d_id', 'account_id': 'account_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `ThreeDSecureStatusEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## TransactionDetailEntity

```dart
final transaction_detail = client.TransactionDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Map<String, dynamic>` | Yes |  |
| `auth` | `Map<String, dynamic>` | Yes |  |
| `card` | `Map<String, dynamic>` | No |  |
| `customer` | `Map<String, dynamic>` | No |  |
| `description` | `String` | No |  |
| `id` | `String` | No |  |
| `item` | `List<dynamic>` | No |  |
| `level2` | `Map<String, dynamic>` | No |  |
| `level3` | `Map<String, dynamic>` | No |  |
| `override` | `Map<String, dynamic>` | No |  |
| `shipping_address` | `Map<String, dynamic>` | Yes |  |
| `status` | `String` | Yes |  |
| `timestamp` | `String` | No |  |
| `trace` | `Map<String, dynamic>` | No |  |

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

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.TransactionDetail().load({'account_id': 'account_id', 'transaction_id': 'transaction_id'});
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```dart
final result = await client.TransactionDetail().update({
  'account_id': 'account_id',
  'transaction_id': 'transaction_id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `TransactionDetailEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## WebhookEntity

```dart
final webhook = client.Webhook();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String` | Yes |  |
| `id` | `String` | No |  |
| `url` | `String` | Yes |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.Webhook().create({
  'account_id': 'example_account_id',  // String
});
```

#### `list([reqmatch, ctrl]) -> Future<List>`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entity instances and throws on error.

```dart
final results = await client.Webhook().list();
for (final webhook in results) {
  print(webhook.data());
}
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.Webhook().load({'id': 'webhook_id', 'account_id': 'account_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.Webhook().remove({'id': 'webhook_id', 'account_id': 'account_id'});
```

#### `update(reqdata, [ctrl]) -> Future<dynamic>`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```dart
final result = await client.Webhook().update({
  'id': 'webhook_id',
  'account_id': 'account_id',
  // Fields to update
});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `WebhookEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```dart
final client = BluefinPayconexSDK({
  'feature': {
    'test': {'active': true},
  },
});
```

