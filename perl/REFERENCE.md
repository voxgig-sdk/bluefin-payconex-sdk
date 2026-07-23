# BluefinPayconex Perl SDK Reference

Complete API reference for the BluefinPayconex Perl SDK.


## BluefinPayconexSDK

### Constructor

```perl
use lib 'lib';
use BluefinPayconexSDK;

my $client = BluefinPayconexSDK->new($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `hashref` | SDK configuration options. |
| `$options->{apikey}` | `string` | API key for authentication. |
| `$options->{base}` | `string` | Base URL for API requests. |
| `$options->{prefix}` | `string` | URL prefix appended after base. |
| `$options->{suffix}` | `string` | URL suffix appended after path. |
| `$options->{headers}` | `hashref` | Custom headers for all requests. |
| `$options->{feature}` | `hashref` | Feature configuration. |
| `$options->{system}` | `hashref` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK->test($testopts, $sdkopts)`

Create a test client with mock features active. Both arguments may be `undef`.

```perl
my $client = BluefinPayconexSDK->test();
```


### Instance Methods

#### `AccountUpdater($data)`

Create a new `AccountUpdater` entity instance. Pass `undef` for no initial data.

#### `AccountUpdaterSchedule($data)`

Create a new `AccountUpdaterSchedule` entity instance. Pass `undef` for no initial data.

#### `AccountUpdaterScheduleWithResult($data)`

Create a new `AccountUpdaterScheduleWithResult` entity instance. Pass `undef` for no initial data.

#### `AccountUpdaterSubscriptionWithResult($data)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance. Pass `undef` for no initial data.

#### `AccountUpdaterUpdate($data)`

Create a new `AccountUpdaterUpdate` entity instance. Pass `undef` for no initial data.

#### `ApiKey($data)`

Create a new `ApiKey` entity instance. Pass `undef` for no initial data.

#### `ApplePayMerchantDetail($data)`

Create a new `ApplePayMerchantDetail` entity instance. Pass `undef` for no initial data.

#### `ApplePaySession($data)`

Create a new `ApplePaySession` entity instance. Pass `undef` for no initial data.

#### `DynamicDescriptor($data)`

Create a new `DynamicDescriptor` entity instance. Pass `undef` for no initial data.

#### `IFrameCreateInstance($data)`

Create a new `IFrameCreateInstance` entity instance. Pass `undef` for no initial data.

#### `IFrameInstance($data)`

Create a new `IFrameInstance` entity instance. Pass `undef` for no initial data.

#### `Iframe($data)`

Create a new `Iframe` entity instance. Pass `undef` for no initial data.

#### `Init($data)`

Create a new `Init` entity instance. Pass `undef` for no initial data.

#### `ListApiKeyScopesEntry($data)`

Create a new `ListApiKeyScopesEntry` entity instance. Pass `undef` for no initial data.

#### `PaymentIframe($data)`

Create a new `PaymentIframe` entity instance. Pass `undef` for no initial data.

#### `ThreeDSecureAuth($data)`

Create a new `ThreeDSecureAuth` entity instance. Pass `undef` for no initial data.

#### `ThreeDSecureBrowserInit($data)`

Create a new `ThreeDSecureBrowserInit` entity instance. Pass `undef` for no initial data.

#### `ThreeDSecureStatus($data)`

Create a new `ThreeDSecureStatus` entity instance. Pass `undef` for no initial data.

#### `TransactionDetail($data)`

Create a new `TransactionDetail` entity instance. Pass `undef` for no initial data.

#### `Webhook($data)`

Create a new `Webhook` entity instance. Pass `undef` for no initial data.

#### `options_map() -> hashref`

Return a deep copy of the current SDK options.

#### `get_utility() -> utility`

Return a copy of the SDK utility object.

#### `direct($fetchargs) -> hashref`

Make a direct HTTP request to any API endpoint. Returns a result `hashref` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never dies — branch on `$result->{ok}`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs->{path}` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs->{method}` | `string` | HTTP method (default: `'GET'`). |
| `$fetchargs->{params}` | `hashref` | Path parameter values. |
| `$fetchargs->{query}` | `hashref` | Query string parameters. |
| `$fetchargs->{headers}` | `hashref` | Request headers (merged with defaults). |
| `$fetchargs->{body}` | `any` | Request body (hashrefs are JSON-serialized). |

**Returns:** `hashref`

#### `prepare($fetchargs) -> hashref`

Prepare a fetch definition without sending. Returns the `fetchdef` and dies on error.


---

## AccountUpdater entity

```perl
my $account_updater = $client->AccountUpdater;
```

### Operations

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->AccountUpdater->remove({ 'account_id' => 'account_id', 'subscription_id' => 'subscription_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `AccountUpdater` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterSchedule entity

```perl
my $account_updater_schedule = $client->AccountUpdaterSchedule;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `boolean` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `arrayref` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->AccountUpdaterSchedule->create({
    'account_id' => 'example_account_id',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterScheduleWithResult entity

```perl
my $account_updater_schedule_with_result = $client->AccountUpdaterScheduleWithResult;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `arrayref` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `boolean` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `hashref` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `arrayref` | Yes |  |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->AccountUpdaterScheduleWithResult->create({
    'account_id' => 'example_account_id',  # string
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->AccountUpdaterScheduleWithResult->list;
for my $account_updater_schedule_with_result (@$results) {
    print "$account_updater_schedule_with_result->{id}\n";
}
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResult entity

```perl
my $account_updater_subscription_with_result = $client->AccountUpdaterSubscriptionWithResult;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `boolean` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `arrayref` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->AccountUpdaterSubscriptionWithResult->create({
    'account_id' => 'example_account_id',  # string
    'subscription_id' => 'example_subscription_id',  # string
});
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->AccountUpdaterSubscriptionWithResult->load({ 'account_id' => 'account_id', 'subscription_id' => 'subscription_id' });
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->AccountUpdaterSubscriptionWithResult->update({
    'account_id' => 'account_id',
    'subscription_id' => 'subscription_id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## AccountUpdaterUpdate entity

```perl
my $account_updater_update = $client->AccountUpdaterUpdate;
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
| `recurring_schedule` | `arrayref` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->AccountUpdaterUpdate->load({ 'id' => 'account_updater_update_id', 'account_id' => 'account_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## ApiKey entity

```perl
my $api_key = $client->ApiKey;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `arrayref` | No |  |
| `enabled` | `boolean` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `arrayref` | No |  |
| `scope` | `arrayref` | No |  |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->ApiKey->create({
    'account_id' => 'example_account_id',  # string
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->ApiKey->list;
for my $api_key (@$results) {
    print "$api_key->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->ApiKey->load({ 'id' => 'api_key_id', 'account_id' => 'account_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->ApiKey->remove({ 'id' => 'api_key_id', 'account_id' => 'account_id' });
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->ApiKey->update({
    'id' => 'api_key_id',
    'account_id' => 'account_id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `ApiKey` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## ApplePayMerchantDetail entity

```perl
my $apple_pay_merchant_detail = $client->ApplePayMerchantDetail;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `arrayref` | Yes |  |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->ApplePayMerchantDetail->create({
    'account_id' => 1,  # integer
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->ApplePayMerchantDetail->list;
for my $apple_pay_merchant_detail (@$results) {
    print "$apple_pay_merchant_detail->{id}\n";
}
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## ApplePaySession entity

```perl
my $apple_pay_session = $client->ApplePaySession;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `string` | No |  |
| `domain_name` | `string` | No |  |
| `epoch_timestamp` | `integer` | No |  |
| `expires_at` | `integer` | No |  |
| `merchant_identifier` | `string` | No |  |
| `merchant_session_identifier` | `string` | No |  |
| `nonce` | `integer` | No |  |
| `operational_analytics_identifier` | `string` | No |  |
| `referrer` | `string` | Yes |  |
| `retry` | `integer` | No |  |
| `signature` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->ApplePaySession->create({
    'account_id' => 1,  # integer
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `ApplePaySession` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## DynamicDescriptor entity

```perl
my $dynamic_descriptor = $client->DynamicDescriptor;
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->DynamicDescriptor->create({
    'account_id' => 'example_account_id',  # string
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->DynamicDescriptor->list;
for my $dynamic_descriptor (@$results) {
    print "$dynamic_descriptor->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->DynamicDescriptor->load({ 'id' => 'dynamic_descriptor_id', 'account_id' => 'account_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->DynamicDescriptor->remove({ 'id' => 'dynamic_descriptor_id', 'account_id' => 'account_id' });
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->DynamicDescriptor->update({
    'id' => 'dynamic_descriptor_id',
    'account_id' => 'account_id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## IFrameCreateInstance entity

```perl
my $i_frame_create_instance = $client->IFrameCreateInstance;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `hashref` | No |  |
| `initialize_transaction` | `boolean` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `number` | No |  |
| `token` | `arrayref` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->IFrameCreateInstance->create({
    'account_id' => 'example_account_id',  # string
    'payment_iframe_id' => 'example_payment_iframe_id',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## IFrameInstance entity

```perl
my $i_frame_instance = $client->IFrameInstance;
```

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->IFrameInstance->load({ 'id' => 'i_frame_instance_id', 'account_id' => 'account_id', 'payment_iframe_id' => 'payment_iframe_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `IFrameInstance` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Iframe entity

```perl
my $iframe = $client->Iframe;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `hashref` | No |  |
| `allowed_parent_domain` | `arrayref` | Yes |  |
| `allowed_payment_method` | `arrayref` | Yes |  |
| `card_setting` | `hashref` | No |  |
| `click_to_pay_setting` | `hashref` | No |  |
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Iframe->create({
    'account_id' => 'example_account_id',  # string
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Iframe->list;
for my $iframe (@$results) {
    print "$iframe->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Iframe->load({ 'account_id' => 'account_id', 'iframe_id' => 'iframe_id' });
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->Iframe->update({
    'account_id' => 'account_id',
    'iframe_id' => 'iframe_id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Iframe` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Init entity

```perl
my $init = $client->Init;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `hashref` | No |  |
| `description` | `string` | No |  |
| `item` | `arrayref` | No |  |
| `level2` | `hashref` | No |  |
| `level3` | `hashref` | No |  |
| `shipping_address` | `hashref` | Yes |  |
| `trace` | `hashref` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Init->create({
    'account_id' => 'example_account_id',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Init` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## ListApiKeyScopesEntry entity

```perl
my $list_api_key_scopes_entry = $client->ListApiKeyScopesEntry;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `description` | `string` | No |  |
| `enabled` | `boolean` | No |  |
| `level` | `integer` | No |  |
| `scope` | `string` | No |  |

### Operations

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->ListApiKeyScopesEntry->list;
for my $list_api_key_scopes_entry (@$results) {
    print "$list_api_key_scopes_entry->{id}\n";
}
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## PaymentIframe entity

```perl
my $payment_iframe = $client->PaymentIframe;
```

### Operations

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->PaymentIframe->remove({ 'account_id' => 'account_id', 'id' => 'id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `PaymentIframe` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## ThreeDSecureAuth entity

```perl
my $three_d_secure_auth = $client->ThreeDSecureAuth;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `hashref` | Yes |  |
| `card` | `hashref` | Yes |  |
| `challenge` | `hashref` | No |  |
| `customer` | `hashref` | No |  |
| `purchase` | `hashref` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `hashref` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `hashref` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->ThreeDSecureAuth->create({
    '3_d_id' => 'example_3_d_id',  # string
    'account_id' => 'example_account_id',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## ThreeDSecureBrowserInit entity

```perl
my $three_d_secure_browser_init = $client->ThreeDSecureBrowserInit;
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

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->ThreeDSecureBrowserInit->create({
    'account_id' => 'example_account_id',  # string
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## ThreeDSecureStatus entity

```perl
my $three_d_secure_status = $client->ThreeDSecureStatus;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `hashref` | No |  |
| `info` | `hashref` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `hashref` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->ThreeDSecureStatus->load({ '3_d_id' => '3_d_id', 'account_id' => 'account_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## TransactionDetail entity

```perl
my $transaction_detail = $client->TransactionDetail;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `hashref` | Yes |  |
| `auth` | `hashref` | Yes |  |
| `card` | `hashref` | No |  |
| `customer` | `hashref` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `arrayref` | No |  |
| `level2` | `hashref` | No |  |
| `level3` | `hashref` | No |  |
| `override` | `hashref` | No |  |
| `shipping_address` | `hashref` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `hashref` | No |  |

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

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->TransactionDetail->load({ 'account_id' => 'account_id', 'transaction_id' => 'transaction_id' });
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->TransactionDetail->update({
    'account_id' => 'account_id',
    'transaction_id' => 'transaction_id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `TransactionDetail` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Webhook entity

```perl
my $webhook = $client->Webhook;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->Webhook->create({
    'account_id' => 'example_account_id',  # string
});
```

#### `list($reqmatch, $ctrl) -> arrayref`

List entities matching the given criteria. The match is optional — call `list` with no argument to list all records. Returns an arrayref and dies on error.

```perl
my $results = $client->Webhook->list;
for my $webhook (@$results) {
    print "$webhook->{id}\n";
}
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->Webhook->load({ 'id' => 'webhook_id', 'account_id' => 'account_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->Webhook->remove({ 'id' => 'webhook_id', 'account_id' => 'account_id' });
```

#### `update($reqdata, $ctrl) -> hashref`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and dies on error.

```perl
my $result = $client->Webhook->update({
    'id' => 'webhook_id',
    'account_id' => 'account_id',
    # Fields to update
});
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `Webhook` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```perl
my $client = BluefinPayconexSDK->new({
    'feature' => {
        'test' => { 'active' => 1 },
    },
});
```

