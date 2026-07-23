# BluefinPayconex C# SDK



The C# SDK for the BluefinPayconex API — an entity-oriented client following idiomatic C# conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.AccountUpdater()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to NuGet. Install it from the GitHub
release tag (`csharp/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) or
from a source checkout — build the library and add a project reference:

```bash
cd csharp && dotnet build BluefinPayconexSDK.csproj
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```csharp
using BluefinPayconexSdk;

var client = new BluefinPayconexSDK(new Dictionary<string, object?>
{
    ["apikey"] = Environment.GetEnvironmentVariable("BLUEFIN_PAYCONEX_APIKEY"),
});
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`Load()` returns the bare record (as `object?`) and raises on error.

```csharp
try
{
    var accountUpdaterSubscriptionWithResult = client.AccountUpdaterSubscriptionWithResult().Load(new Dictionary<string, object?> { ["account_id"] = "example_account_id", ["subscription_id"] = "example_subscription_id" });
    Console.WriteLine(accountUpdaterSubscriptionWithResult);
}
catch (Exception err)
{
    Console.WriteLine($"load failed: {err.Message}");
}
```

### 4. Create, update, and remove

```csharp
// Remove
client.AccountUpdater().Remove(new Dictionary<string, object?> { ["account_id"] = "example_account_id", ["subscription_id"] = "example_subscription_id" });
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

```csharp
var result = client.Direct(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "GET",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

if (Equals(result["ok"], true))
{
    Console.WriteLine(result["status"]);  // 200
    Console.WriteLine(result["data"]);    // response body
}
else
{
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both with TryGetValue rather than indexing a key that may be absent.
    result.TryGetValue("status", out var status);
    result.TryGetValue("err", out var err);
    Console.WriteLine($"{status} {err}");
}
```

### Prepare a request without sending it

```csharp
// Prepare() returns the fetch definition and raises on error.
var fetchdef = client.Prepare(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "DELETE",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

Console.WriteLine(fetchdef["url"]);
Console.WriteLine(fetchdef["method"]);
Console.WriteLine(fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```csharp
var client = BluefinPayconexSDK.TestSDK(null, null);

// Entity ops return the bare record and raise on error.
var threeDSecureStatus = client.ThreeDSecureStatus().Load(null);
// threeDSecureStatus holds the mock response record
Console.WriteLine(threeDSecureStatus);
```

### Use a custom fetch function

Replace the HTTP transport with your own delegate:

```csharp
Func<string, Dictionary<string, object?>, Dictionary<string, object?>> mockFetch =
    (url, init) => new Dictionary<string, object?>
    {
        ["status"] = 200,
        ["statusText"] = "OK",
        ["headers"] = new Dictionary<string, object?>(),
        ["json"] = (Func<object?>)(() => new Dictionary<string, object?> { ["id"] = "mock01" }),
    };

var client = new BluefinPayconexSDK(new Dictionary<string, object?>
{
    ["base"] = "http://localhost:8080",
    ["system"] = new Dictionary<string, object?>
    {
        ["fetch"] = mockFetch,
    },
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
cd csharp && dotnet test
```


## Reference

### BluefinPayconexSDK

```csharp
using BluefinPayconexSdk;

var client = new BluefinPayconexSDK(options);
```

Creates a new SDK client. `options` is a `Dictionary<string, object?>`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `Dictionary` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Dictionary` | System overrides (e.g. custom `fetch` delegate). |

### TestSDK

```csharp
var client = BluefinPayconexSDK.TestSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() -> Dictionary` | Deep copy of current SDK options. |
| `GetUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs) -> Dictionary` | Build an HTTP request definition without sending. Raises on error. |
| `Direct` | `(fetchargs) -> Dictionary` | Build and send an HTTP request. Returns a result dictionary (branch on `ok`). |
| `AccountUpdater` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdater entity instance. |
| `AccountUpdaterSchedule` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterSchedule entity instance. |
| `AccountUpdaterScheduleWithResult` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `AccountUpdaterSubscriptionWithResult` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `AccountUpdaterUpdate` | `(entopts) -> BluefinPayconexEntityBase` | Create an AccountUpdaterUpdate entity instance. |
| `ApiKey` | `(entopts) -> BluefinPayconexEntityBase` | Create an ApiKey entity instance. |
| `ApplePayMerchantDetail` | `(entopts) -> BluefinPayconexEntityBase` | Create an ApplePayMerchantDetail entity instance. |
| `ApplePaySession` | `(entopts) -> BluefinPayconexEntityBase` | Create an ApplePaySession entity instance. |
| `DynamicDescriptor` | `(entopts) -> BluefinPayconexEntityBase` | Create a DynamicDescriptor entity instance. |
| `IFrameCreateInstance` | `(entopts) -> BluefinPayconexEntityBase` | Create an IFrameCreateInstance entity instance. |
| `IFrameInstance` | `(entopts) -> BluefinPayconexEntityBase` | Create an IFrameInstance entity instance. |
| `Iframe` | `(entopts) -> BluefinPayconexEntityBase` | Create an Iframe entity instance. |
| `Init` | `(entopts) -> BluefinPayconexEntityBase` | Create an Init entity instance. |
| `ListApiKeyScopesEntry` | `(entopts) -> BluefinPayconexEntityBase` | Create a ListApiKeyScopesEntry entity instance. |
| `PaymentIframe` | `(entopts) -> BluefinPayconexEntityBase` | Create a PaymentIframe entity instance. |
| `ThreeDSecureAuth` | `(entopts) -> BluefinPayconexEntityBase` | Create a ThreeDSecureAuth entity instance. |
| `ThreeDSecureBrowserInit` | `(entopts) -> BluefinPayconexEntityBase` | Create a ThreeDSecureBrowserInit entity instance. |
| `ThreeDSecureStatus` | `(entopts) -> BluefinPayconexEntityBase` | Create a ThreeDSecureStatus entity instance. |
| `TransactionDetail` | `(entopts) -> BluefinPayconexEntityBase` | Create a TransactionDetail entity instance. |
| `Webhook` | `(entopts) -> BluefinPayconexEntityBase` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl) -> object?` | Load a single entity by match criteria. Raises on error. |
| `List` | `(reqmatch, ctrl) -> object?` | List entities matching the criteria (an aggregate list). Raises on error. |
| `Create` | `(reqdata, ctrl) -> object?` | Create a new entity. Raises on error. |
| `Update` | `(reqdata, ctrl) -> object?` | Update an existing entity. Raises on error. |
| `Remove` | `(reqmatch, ctrl) -> object?` | Remove an entity. Raises on error. |
| `Data` | `(newdata) -> object?` | Get or set entity data. |
| `Match` | `(newmatch) -> object?` | Get or set entity match criteria. |
| `Make` | `() -> IEntity` | Create a new instance with the same options. |
| `GetName` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Dictionary` for
single-entity ops, an aggregate list for `List`) as `object?` and raise on
error. Wrap calls in `try`/`catch` to handle failures.

The `Direct()` escape hatch never raises — it returns a result
`Dictionary<string, object?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Dictionary` | Response headers. |
| `data` | `object?` | Parsed JSON response body. |

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

Create an instance: `var accountUpdater = client.AccountUpdater();`

#### Operations

| Method | Description |
| --- | --- |
| `Remove(match)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `var accountUpdaterSchedule = client.AccountUpdaterSchedule();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `List<object?>` |  |

#### Example: Create

```csharp
var accountUpdaterSchedule = client.AccountUpdaterSchedule().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```


### AccountUpdaterScheduleWithResult

Create an instance: `var accountUpdaterScheduleWithResult = client.AccountUpdaterScheduleWithResult();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `List<object?>` |  |
| `created_at` | `string` |  |
| `enabled` | `bool` |  |
| `expiry` | `string` |  |
| `id` | `string` |  |
| `most_recent_update` | `Dictionary<string, object?>` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `List<object?>` |  |
| `type` | `string` |  |
| `updated_at` | `string` |  |

#### Example: List

```csharp
var accountUpdaterScheduleWithResultList = client.AccountUpdaterScheduleWithResult().List(null);
```

#### Example: Create

```csharp
var accountUpdaterScheduleWithResult = client.AccountUpdaterScheduleWithResult().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `var accountUpdaterSubscriptionWithResult = client.AccountUpdaterSubscriptionWithResult();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `Load(match)` | Load a single entity by match criteria. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `string` |  |
| `enabled` | `bool` |  |
| `id` | `string` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `record` | `List<object?>` |  |
| `response_format` | `string` |  |
| `template_ref` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```csharp
var accountUpdaterSubscriptionWithResult = client.AccountUpdaterSubscriptionWithResult().Load(new Dictionary<string, object?> { ["account_id"] = "account_id", ["subscription_id"] = "subscription_id" });
```

#### Example: Create

```csharp
var accountUpdaterSubscriptionWithResult = client.AccountUpdaterSubscriptionWithResult().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
    ["subscription_id"] = "example_subscription_id",  // string
});
```


### AccountUpdaterUpdate

Create an instance: `var accountUpdaterUpdate = client.AccountUpdaterUpdate();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

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
| `recurring_schedule` | `List<object?>` |  |
| `status` | `string` |  |
| `update_id` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```csharp
var accountUpdaterUpdate = client.AccountUpdaterUpdate().Load(new Dictionary<string, object?> { ["id"] = "account_updater_update_id", ["account_id"] = "account_id" });
```


### ApiKey

Create an instance: `var apiKey = client.ApiKey();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `List<object?>` |  |
| `enabled` | `bool` |  |
| `expires_at` | `string` |  |
| `expires_in` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `method` | `List<object?>` |  |
| `scope` | `List<object?>` |  |
| `secret` | `string` |  |

#### Example: Load

```csharp
var apiKey = client.ApiKey().Load(new Dictionary<string, object?> { ["id"] = "api_key_id", ["account_id"] = "account_id" });
```

#### Example: List

```csharp
var apiKeyList = client.ApiKey().List(null);
```

#### Example: Create

```csharp
var apiKey = client.ApiKey().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```


### ApplePayMerchantDetail

Create an instance: `var applePayMerchantDetail = client.ApplePayMerchantDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `List<object?>` |  |
| `merchant_url` | `string` |  |
| `partner_merchant_name` | `string` |  |
| `payconex_account_id` | `string` |  |

#### Example: List

```csharp
var applePayMerchantDetailList = client.ApplePayMerchantDetail().List(null);
```

#### Example: Create

```csharp
var applePayMerchantDetail = client.ApplePayMerchantDetail().Create(new Dictionary<string, object?>
{
    ["account_id"] = 1L,  // long
});
```


### ApplePaySession

Create an instance: `var applePaySession = client.ApplePaySession();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `string` |  |
| `domain_name` | `string` |  |
| `epoch_timestamp` | `long` |  |
| `expires_at` | `long` |  |
| `merchant_identifier` | `string` |  |
| `merchant_session_identifier` | `string` |  |
| `nonce` | `long` |  |
| `operational_analytics_identifier` | `string` |  |
| `referrer` | `string` |  |
| `retry` | `long` |  |
| `signature` | `string` |  |

#### Example: Create

```csharp
var applePaySession = client.ApplePaySession().Create(new Dictionary<string, object?>
{
    ["account_id"] = 1L,  // long
});
```


### DynamicDescriptor

Create an instance: `var dynamicDescriptor = client.DynamicDescriptor();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `string` |  |
| `descriptor` | `string` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `state` | `string` |  |

#### Example: Load

```csharp
var dynamicDescriptor = client.DynamicDescriptor().Load(new Dictionary<string, object?> { ["id"] = "dynamic_descriptor_id", ["account_id"] = "account_id" });
```

#### Example: List

```csharp
var dynamicDescriptorList = client.DynamicDescriptor().List(null);
```

#### Example: Create

```csharp
var dynamicDescriptor = client.DynamicDescriptor().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```


### IFrameCreateInstance

Create an instance: `var iFrameCreateInstance = client.IFrameCreateInstance();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `string` |  |
| `currency` | `string` |  |
| `customer` | `Dictionary<string, object?>` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `reference` | `string` |  |
| `timeout` | `double` |  |
| `token` | `List<object?>` |  |

#### Example: Create

```csharp
var iFrameCreateInstance = client.IFrameCreateInstance().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
    ["payment_iframe_id"] = "example_payment_iframe_id",  // string
});
```


### IFrameInstance

Create an instance: `var iFrameInstance = client.IFrameInstance();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Example: Load

```csharp
var iFrameInstance = client.IFrameInstance().Load(new Dictionary<string, object?> { ["id"] = "i_frame_instance_id", ["account_id"] = "account_id", ["payment_iframe_id"] = "payment_iframe_id" });
```


### Iframe

Create an instance: `var iframe = client.Iframe();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `Dictionary<string, object?>` |  |
| `allowed_parent_domain` | `List<object?>` |  |
| `allowed_payment_method` | `List<object?>` |  |
| `card_setting` | `Dictionary<string, object?>` |  |
| `click_to_pay_setting` | `Dictionary<string, object?>` |  |
| `currency` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `timeout` | `double` |  |

#### Example: Load

```csharp
var iframe = client.Iframe().Load(new Dictionary<string, object?> { ["account_id"] = "account_id", ["iframe_id"] = "iframe_id" });
```

#### Example: List

```csharp
var iframeList = client.Iframe().List(null);
```

#### Example: Create

```csharp
var iframe = client.Iframe().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```


### Init

Create an instance: `var init = client.Init();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `Dictionary<string, object?>` |  |
| `description` | `string` |  |
| `item` | `List<object?>` |  |
| `level2` | `Dictionary<string, object?>` |  |
| `level3` | `Dictionary<string, object?>` |  |
| `shipping_address` | `Dictionary<string, object?>` |  |
| `trace` | `Dictionary<string, object?>` |  |

#### Example: Create

```csharp
var init = client.Init().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```


### ListApiKeyScopesEntry

Create an instance: `var listApiKeyScopesEntry = client.ListApiKeyScopesEntry();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `string` |  |
| `description` | `string` |  |
| `enabled` | `bool` |  |
| `level` | `long` |  |
| `scope` | `string` |  |

#### Example: List

```csharp
var listApiKeyScopesEntryList = client.ListApiKeyScopesEntry().List(null);
```


### PaymentIframe

Create an instance: `var paymentIframe = client.PaymentIframe();`

#### Operations

| Method | Description |
| --- | --- |
| `Remove(match)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `var threeDSecureAuth = client.ThreeDSecureAuth();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `Dictionary<string, object?>` |  |
| `card` | `Dictionary<string, object?>` |  |
| `challenge` | `Dictionary<string, object?>` |  |
| `customer` | `Dictionary<string, object?>` |  |
| `purchase` | `Dictionary<string, object?>` |  |
| `server_transaction_id` | `string` |  |
| `shipping` | `Dictionary<string, object?>` |  |
| `status` | `string` |  |
| `three_d_secure_challenge_indicator` | `string` |  |
| `three_d_secure_id` | `string` |  |
| `trace` | `Dictionary<string, object?>` |  |

#### Example: Create

```csharp
var threeDSecureAuth = client.ThreeDSecureAuth().Create(new Dictionary<string, object?>
{
    ["3_d_id"] = "example_3_d_id",  // string
    ["account_id"] = "example_account_id",  // string
});
```


### ThreeDSecureBrowserInit

Create an instance: `var threeDSecureBrowserInit = client.ThreeDSecureBrowserInit();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

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

```csharp
var threeDSecureBrowserInit = client.ThreeDSecureBrowserInit().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
});
```


### ThreeDSecureStatus

Create an instance: `var threeDSecureStatus = client.ThreeDSecureStatus();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `Dictionary<string, object?>` |  |
| `info` | `Dictionary<string, object?>` |  |
| `server_transaction_id` | `string` |  |
| `status` | `string` |  |
| `three_d_secure` | `Dictionary<string, object?>` |  |
| `three_d_secure_id` | `string` |  |

#### Example: Load

```csharp
var threeDSecureStatus = client.ThreeDSecureStatus().Load(new Dictionary<string, object?> { ["3_d_id"] = "3_d_id", ["account_id"] = "account_id" });
```


### TransactionDetail

Create an instance: `var transactionDetail = client.TransactionDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `Dictionary<string, object?>` |  |
| `auth` | `Dictionary<string, object?>` |  |
| `card` | `Dictionary<string, object?>` |  |
| `customer` | `Dictionary<string, object?>` |  |
| `description` | `string` |  |
| `id` | `string` |  |
| `item` | `List<object?>` |  |
| `level2` | `Dictionary<string, object?>` |  |
| `level3` | `Dictionary<string, object?>` |  |
| `override` | `Dictionary<string, object?>` |  |
| `shipping_address` | `Dictionary<string, object?>` |  |
| `status` | `string` |  |
| `timestamp` | `string` |  |
| `trace` | `Dictionary<string, object?>` |  |

#### Example: Load

```csharp
var transactionDetail = client.TransactionDetail().Load(new Dictionary<string, object?> { ["account_id"] = "account_id", ["transaction_id"] = "transaction_id" });
```


### Webhook

Create an instance: `var webhook = client.Webhook();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `string` |  |
| `id` | `string` |  |
| `url` | `string` |  |

#### Example: Load

```csharp
var webhook = client.Webhook().Load(new Dictionary<string, object?> { ["id"] = "webhook_id", ["account_id"] = "account_id" });
```

#### Example: List

```csharp
var webhookList = client.Webhook().List(null);
```

#### Example: Create

```csharp
var webhook = client.Webhook().Create(new Dictionary<string, object?>
{
    ["account_id"] = "example_account_id",  // string
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

### Data as dictionaries

The C# SDK uses a loose object model — `Dictionary<string, object?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors
the dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.ToMapAny(value)` to safely coerce a value to a
`Dictionary<string, object?>`. A `BluefinPayconexTypes.cs` module of
reference `record` types is also generated for editor documentation.

### Project structure

```
csharp/
├── BluefinPayconexSDK.csproj    -- Library project (compiles everything except test/)
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- xUnit test suites
```

The main client class (`BluefinPayconexSDK`, namespace
`BluefinPayconexSdk`) exposes the entity accessors. Reference entity or
utility types directly only when needed.

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
