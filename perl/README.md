# BluefinPayconex Perl SDK



The Perl SDK for the BluefinPayconex API — an entity-oriented client
following idiomatic Perl conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->AccountUpdater` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to CPAN. Install it from the GitHub
release tag (`perl/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) or
from a source checkout.

The SDK is pure Perl with zero non-core runtime dependencies, so no build
step is required — just put its `lib` directory on `@INC`:

```perl
use lib 'lib';
use BluefinPayconexSDK;
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```perl
use lib 'lib';
use BluefinPayconexSDK;

my $client = BluefinPayconexSDK->new({
    'apikey' => $ENV{'BLUEFIN_PAYCONEX_APIKEY'},
});
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record (a `hashref`) and dies on error.

```perl
my $accountupdatersubscriptionwithresult = eval { $client->AccountUpdaterSubscriptionWithResult->load({ 'account_id' => 'example_account_id', 'subscription_id' => 'example_subscription_id' }) };
if (my $err = $@) {
    print "load failed: $err\n";
}
else {
    print "$accountupdatersubscriptionwithresult->{id}\n";
}
```

### 4. Create, update, and remove

```perl
# Remove
$client->AccountUpdater->remove({ 'account_id' => 'example_account_id', 'subscription_id' => 'example_subscription_id' });
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

```perl
my $result = $client->direct({
    'path' => '/api/resource/{id}',
    'method' => 'GET',
    'params' => { 'id' => 'example' },
});

if ($result->{ok}) {
    print $result->{status}, "\n";  # 200
    print $result->{data}, "\n";    # response body
}
else {
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read whichever is defined.
    print $result->{status}, ' ', ($result->{err} // ''), "\n";
}
```

### Prepare a request without sending it

```perl
# prepare() returns the fetch definition and dies on error.
my $fetchdef = $client->prepare({
    'path' => '/api/resource/{id}',
    'method' => 'DELETE',
    'params' => { 'id' => 'example' },
});

print $fetchdef->{url}, "\n";
print $fetchdef->{method}, "\n";
print $fetchdef->{headers}, "\n";
```

### Use test mode

Create a mock client for unit testing — no server required:

```perl
my $client = BluefinPayconexSDK->test(undef, undef);

# Entity ops return the bare record and die on error.
my $threedsecurestatus = $client->ThreeDSecureStatus->load();
# $threedsecurestatus contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own coderef:

```perl
my $mock_fetch = sub {
    my ($url, $init) = @_;
    return ({
        'status' => 200,
        'statusText' => 'OK',
        'headers' => {},
        'json' => sub { { 'id' => 'mock01' } },
    }, undef);
};

my $client = BluefinPayconexSDK->new({
    'base' => 'http://localhost:8080',
    'system' => { 'fetch' => $mock_fetch },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd perl && prove -Ilib t/
```


## Reference

### BluefinPayconexSDK

```perl
use lib 'lib';
use BluefinPayconexSDK;

my $client = BluefinPayconexSDK->new($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `hashref` | Feature activation flags. |
| `extend` | `arrayref` | Additional feature instances to load. |
| `system` | `hashref` | System overrides (e.g. custom `fetch` coderef). |

### test

```perl
my $client = BluefinPayconexSDK->test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `undef`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> hashref` | Deep copy of current SDK options. |
| `get_utility` | `() -> utility` | Copy of the SDK utility object. |
| `prepare` | `($fetchargs) -> hashref` | Build an HTTP request definition without sending. Dies on error. |
| `direct` | `($fetchargs) -> hashref` | Build and send an HTTP request. Returns a result hashref (branch on `ok`). |
| `AccountUpdater` | `($data) -> AccountUpdater entity` | Create an AccountUpdater entity instance. |
| `AccountUpdaterSchedule` | `($data) -> AccountUpdaterSchedule entity` | Create an AccountUpdaterSchedule entity instance. |
| `AccountUpdaterScheduleWithResult` | `($data) -> AccountUpdaterScheduleWithResult entity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `AccountUpdaterSubscriptionWithResult` | `($data) -> AccountUpdaterSubscriptionWithResult entity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `AccountUpdaterUpdate` | `($data) -> AccountUpdaterUpdate entity` | Create an AccountUpdaterUpdate entity instance. |
| `ApiKey` | `($data) -> ApiKey entity` | Create an ApiKey entity instance. |
| `ApplePayMerchantDetail` | `($data) -> ApplePayMerchantDetail entity` | Create an ApplePayMerchantDetail entity instance. |
| `ApplePaySession` | `($data) -> ApplePaySession entity` | Create an ApplePaySession entity instance. |
| `DynamicDescriptor` | `($data) -> DynamicDescriptor entity` | Create a DynamicDescriptor entity instance. |
| `IFrameCreateInstance` | `($data) -> IFrameCreateInstance entity` | Create an IFrameCreateInstance entity instance. |
| `IFrameInstance` | `($data) -> IFrameInstance entity` | Create an IFrameInstance entity instance. |
| `Iframe` | `($data) -> Iframe entity` | Create an Iframe entity instance. |
| `Init` | `($data) -> Init entity` | Create an Init entity instance. |
| `ListApiKeyScopesEntry` | `($data) -> ListApiKeyScopesEntry entity` | Create a ListApiKeyScopesEntry entity instance. |
| `PaymentIframe` | `($data) -> PaymentIframe entity` | Create a PaymentIframe entity instance. |
| `ThreeDSecureAuth` | `($data) -> ThreeDSecureAuth entity` | Create a ThreeDSecureAuth entity instance. |
| `ThreeDSecureBrowserInit` | `($data) -> ThreeDSecureBrowserInit entity` | Create a ThreeDSecureBrowserInit entity instance. |
| `ThreeDSecureStatus` | `($data) -> ThreeDSecureStatus entity` | Create a ThreeDSecureStatus entity instance. |
| `TransactionDetail` | `($data) -> TransactionDetail entity` | Create a TransactionDetail entity instance. |
| `Webhook` | `($data) -> Webhook entity` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl) -> hashref` | Load a single entity by match criteria. Dies on error. |
| `list` | `($reqmatch, $ctrl) -> arrayref` | List entities matching the criteria. Dies on error. |
| `create` | `($reqdata, $ctrl) -> hashref` | Create a new entity. Dies on error. |
| `update` | `($reqdata, $ctrl) -> hashref` | Update an existing entity. Dies on error. |
| `remove` | `($reqmatch, $ctrl) -> hashref` | Remove an entity. Dies on error. |
| `data_get` | `() -> hashref` | Get entity data. |
| `data_set` | `($data)` | Set entity data. |
| `match_get` | `() -> hashref` | Get entity match criteria. |
| `match_set` | `($match)` | Set entity match criteria. |
| `make` | `() -> entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `hashref` for single-entity
ops, an `arrayref` for `list`) and die on error. Wrap calls in
`eval { ... }` and inspect `$@` to handle failures.

The `direct()` escape hatch never dies — it returns a result `hashref`
you branch on via `$result->{ok}`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | True if the HTTP status is 2xx. |
| `status` | `integer` | HTTP status code. |
| `headers` | `hashref` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is false and `err` contains the error value.

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

Create an instance: `my $account_updater = $client->AccountUpdater;`

#### Operations

| Method | Description |
| --- | --- |
| `remove($match)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `my $account_updater_schedule = $client->AccountUpdaterSchedule;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `boolean` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `arrayref` |  |

#### Example: Create

```perl
my $account_updater_schedule = $client->AccountUpdaterSchedule->create({
    'account_id' => 'example_account_id',  # string
});
```


### AccountUpdaterScheduleWithResult

Create an instance: `my $account_updater_schedule_with_result = $client->AccountUpdaterScheduleWithResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `arrayref` |  |
| `created_at` | `string` |  |
| `enabled` | `boolean` |  |
| `expiry` | `string` |  |
| `id` | `string` |  |
| `most_recent_update` | `hashref` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `arrayref` |  |
| `type` | `string` |  |
| `updated_at` | `string` |  |

#### Example: List

```perl
my $account_updater_schedule_with_results = $client->AccountUpdaterScheduleWithResult->list;
```

#### Example: Create

```perl
my $account_updater_schedule_with_result = $client->AccountUpdaterScheduleWithResult->create({
    'account_id' => 'example_account_id',  # string
});
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `my $account_updater_subscription_with_result = $client->AccountUpdaterSubscriptionWithResult;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `load($match)` | Load a single entity by match criteria. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `string` |  |
| `enabled` | `boolean` |  |
| `id` | `string` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `record` | `arrayref` |  |
| `response_format` | `string` |  |
| `template_ref` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```perl
my $account_updater_subscription_with_result = $client->AccountUpdaterSubscriptionWithResult->load({ 'account_id' => 'account_id', 'subscription_id' => 'subscription_id' });
```

#### Example: Create

```perl
my $account_updater_subscription_with_result = $client->AccountUpdaterSubscriptionWithResult->create({
    'account_id' => 'example_account_id',  # string
    'subscription_id' => 'example_subscription_id',  # string
});
```


### AccountUpdaterUpdate

Create an instance: `my $account_updater_update = $client->AccountUpdaterUpdate;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

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
| `recurring_schedule` | `arrayref` |  |
| `status` | `string` |  |
| `update_id` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```perl
my $account_updater_update = $client->AccountUpdaterUpdate->load({ 'id' => 'account_updater_update_id', 'account_id' => 'account_id' });
```


### ApiKey

Create an instance: `my $api_key = $client->ApiKey;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `arrayref` |  |
| `enabled` | `boolean` |  |
| `expires_at` | `string` |  |
| `expires_in` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `method` | `arrayref` |  |
| `scope` | `arrayref` |  |
| `secret` | `string` |  |

#### Example: Load

```perl
my $api_key = $client->ApiKey->load({ 'id' => 'api_key_id', 'account_id' => 'account_id' });
```

#### Example: List

```perl
my $api_keys = $client->ApiKey->list;
```

#### Example: Create

```perl
my $api_key = $client->ApiKey->create({
    'account_id' => 'example_account_id',  # string
});
```


### ApplePayMerchantDetail

Create an instance: `my $apple_pay_merchant_detail = $client->ApplePayMerchantDetail;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `arrayref` |  |
| `merchant_url` | `string` |  |
| `partner_merchant_name` | `string` |  |
| `payconex_account_id` | `string` |  |

#### Example: List

```perl
my $apple_pay_merchant_details = $client->ApplePayMerchantDetail->list;
```

#### Example: Create

```perl
my $apple_pay_merchant_detail = $client->ApplePayMerchantDetail->create({
    'account_id' => 1,  # integer
});
```


### ApplePaySession

Create an instance: `my $apple_pay_session = $client->ApplePaySession;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `string` |  |
| `domain_name` | `string` |  |
| `epoch_timestamp` | `integer` |  |
| `expires_at` | `integer` |  |
| `merchant_identifier` | `string` |  |
| `merchant_session_identifier` | `string` |  |
| `nonce` | `integer` |  |
| `operational_analytics_identifier` | `string` |  |
| `referrer` | `string` |  |
| `retry` | `integer` |  |
| `signature` | `string` |  |

#### Example: Create

```perl
my $apple_pay_session = $client->ApplePaySession->create({
    'account_id' => 1,  # integer
});
```


### DynamicDescriptor

Create an instance: `my $dynamic_descriptor = $client->DynamicDescriptor;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `string` |  |
| `descriptor` | `string` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `state` | `string` |  |

#### Example: Load

```perl
my $dynamic_descriptor = $client->DynamicDescriptor->load({ 'id' => 'dynamic_descriptor_id', 'account_id' => 'account_id' });
```

#### Example: List

```perl
my $dynamic_descriptors = $client->DynamicDescriptor->list;
```

#### Example: Create

```perl
my $dynamic_descriptor = $client->DynamicDescriptor->create({
    'account_id' => 'example_account_id',  # string
});
```


### IFrameCreateInstance

Create an instance: `my $i_frame_create_instance = $client->IFrameCreateInstance;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `string` |  |
| `currency` | `string` |  |
| `customer` | `hashref` |  |
| `initialize_transaction` | `boolean` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `reference` | `string` |  |
| `timeout` | `number` |  |
| `token` | `arrayref` |  |

#### Example: Create

```perl
my $i_frame_create_instance = $client->IFrameCreateInstance->create({
    'account_id' => 'example_account_id',  # string
    'payment_iframe_id' => 'example_payment_iframe_id',  # string
});
```


### IFrameInstance

Create an instance: `my $i_frame_instance = $client->IFrameInstance;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Example: Load

```perl
my $i_frame_instance = $client->IFrameInstance->load({ 'id' => 'i_frame_instance_id', 'account_id' => 'account_id', 'payment_iframe_id' => 'payment_iframe_id' });
```


### Iframe

Create an instance: `my $iframe = $client->Iframe;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `hashref` |  |
| `allowed_parent_domain` | `arrayref` |  |
| `allowed_payment_method` | `arrayref` |  |
| `card_setting` | `hashref` |  |
| `click_to_pay_setting` | `hashref` |  |
| `currency` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `timeout` | `number` |  |

#### Example: Load

```perl
my $iframe = $client->Iframe->load({ 'account_id' => 'account_id', 'iframe_id' => 'iframe_id' });
```

#### Example: List

```perl
my $iframes = $client->Iframe->list;
```

#### Example: Create

```perl
my $iframe = $client->Iframe->create({
    'account_id' => 'example_account_id',  # string
});
```


### Init

Create an instance: `my $init = $client->Init;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `hashref` |  |
| `description` | `string` |  |
| `item` | `arrayref` |  |
| `level2` | `hashref` |  |
| `level3` | `hashref` |  |
| `shipping_address` | `hashref` |  |
| `trace` | `hashref` |  |

#### Example: Create

```perl
my $init = $client->Init->create({
    'account_id' => 'example_account_id',  # string
});
```


### ListApiKeyScopesEntry

Create an instance: `my $list_api_key_scopes_entry = $client->ListApiKeyScopesEntry;`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `string` |  |
| `description` | `string` |  |
| `enabled` | `boolean` |  |
| `level` | `integer` |  |
| `scope` | `string` |  |

#### Example: List

```perl
my $list_api_key_scopes_entrys = $client->ListApiKeyScopesEntry->list;
```


### PaymentIframe

Create an instance: `my $payment_iframe = $client->PaymentIframe;`

#### Operations

| Method | Description |
| --- | --- |
| `remove($match)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `my $three_d_secure_auth = $client->ThreeDSecureAuth;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `hashref` |  |
| `card` | `hashref` |  |
| `challenge` | `hashref` |  |
| `customer` | `hashref` |  |
| `purchase` | `hashref` |  |
| `server_transaction_id` | `string` |  |
| `shipping` | `hashref` |  |
| `status` | `string` |  |
| `three_d_secure_challenge_indicator` | `string` |  |
| `three_d_secure_id` | `string` |  |
| `trace` | `hashref` |  |

#### Example: Create

```perl
my $three_d_secure_auth = $client->ThreeDSecureAuth->create({
    '3_d_id' => 'example_3_d_id',  # string
    'account_id' => 'example_account_id',  # string
});
```


### ThreeDSecureBrowserInit

Create an instance: `my $three_d_secure_browser_init = $client->ThreeDSecureBrowserInit;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |

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

```perl
my $three_d_secure_browser_init = $client->ThreeDSecureBrowserInit->create({
    'account_id' => 'example_account_id',  # string
});
```


### ThreeDSecureStatus

Create an instance: `my $three_d_secure_status = $client->ThreeDSecureStatus;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `hashref` |  |
| `info` | `hashref` |  |
| `server_transaction_id` | `string` |  |
| `status` | `string` |  |
| `three_d_secure` | `hashref` |  |
| `three_d_secure_id` | `string` |  |

#### Example: Load

```perl
my $three_d_secure_status = $client->ThreeDSecureStatus->load({ '3_d_id' => '3_d_id', 'account_id' => 'account_id' });
```


### TransactionDetail

Create an instance: `my $transaction_detail = $client->TransactionDetail;`

#### Operations

| Method | Description |
| --- | --- |
| `load($match)` | Load a single entity by match criteria. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `hashref` |  |
| `auth` | `hashref` |  |
| `card` | `hashref` |  |
| `customer` | `hashref` |  |
| `description` | `string` |  |
| `id` | `string` |  |
| `item` | `arrayref` |  |
| `level2` | `hashref` |  |
| `level3` | `hashref` |  |
| `override` | `hashref` |  |
| `shipping_address` | `hashref` |  |
| `status` | `string` |  |
| `timestamp` | `string` |  |
| `trace` | `hashref` |  |

#### Example: Load

```perl
my $transaction_detail = $client->TransactionDetail->load({ 'account_id' => 'account_id', 'transaction_id' => 'transaction_id' });
```


### Webhook

Create an instance: `my $webhook = $client->Webhook;`

#### Operations

| Method | Description |
| --- | --- |
| `create($data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load($match)` | Load a single entity by match criteria. |
| `remove($match)` | Remove the matching entity. |
| `update($data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `string` |  |
| `id` | `string` |  |
| `url` | `string` |  |

#### Example: Load

```perl
my $webhook = $client->Webhook->load({ 'id' => 'webhook_id', 'account_id' => 'account_id' });
```

#### Example: List

```perl
my $webhooks = $client->Webhook->list;
```

#### Example: Create

```perl
my $webhook = $client->Webhook->create({
    'account_id' => 'example_account_id',  # string
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

### Data as hashrefs

The Perl SDK uses plain hashrefs and arrayrefs throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `BluefinPayconexHelpers::to_map()` to safely validate that a value
is a hashref.

### Module structure

```
perl/
├── lib/BluefinPayconexSDK.pm    -- Main SDK module (package BluefinPayconexSDK)
├── config.pm                    -- Configuration
├── features.pm                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utility functions
├── lib/Voxgig/Struct.pm         -- Vendored struct library
└── t/                           -- Test suites
```

Load the main module with `use lib 'lib'; use BluefinPayconexSDK;` — it
pulls in the config, features, and core modules for you. Require entity or
utility modules directly only when needed.

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
