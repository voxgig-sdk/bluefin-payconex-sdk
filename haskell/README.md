# BluefinPayconex Haskell SDK



The Haskell SDK for the BluefinPayconex API — an entity-oriented client following idiomatic Haskell conventions (pure functions, explicit `IO`, and the dependency-free vendored `Value` struct model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `account_updater sdk VNoval` — each
carrying a small, uniform set of operations (`eList`, `eLoad`, `eCreate`, `eUpdate`, `eRemove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Hackage. Install it from the GitHub
release tag (`haskell/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) or
from a source checkout. The runtime has no third-party dependencies (only the
GHC boot libraries: `base`, `containers`, `array`, `time`), so the
bundled Makefile drives stock GHC with no cabal solve:

```bash
cd haskell && make test
```

A `.cabal` file is also generated for use with `cabal`/`stack`:

```bash
cd haskell && cabal build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```haskell
import System.Environment (lookupEnv)
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  mkey <- lookupEnv "BLUEFIN_PAYCONEX_APIKEY"
  opts <- jo [("apikey", maybe VNoval VStr mkey)]
  sdk <- Sdk.newSdk opts
```

Entity operations raise on error (via `Control.Exception.throwIO`) and
return the bare result `Value`. Wrap a call in `Control.Exception.try`
to recover from failures.

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`eLoad` returns the bare record and raises on error.

```haskell
  account_updater_subscription_with_resultEnt <- Sdk.account_updater_subscription_with_result sdk VNoval
  m <- jo [("account_id", VStr "example_account_id"), ("subscription_id", VStr "example_subscription_id")]
  ctrl2 <- emptyMap
  account_updater_subscription_with_result <- Sdk.eLoad account_updater_subscription_with_resultEnt m ctrl2
  print account_updater_subscription_with_result
```

### 4. Create, update, and remove

```haskell
  removeEnt <- Sdk.account_updater sdk VNoval
  rm <- jo [("account_id", VStr "example_account_id"), ("subscription_id", VStr "example_subscription_id")]
  rctrl <- emptyMap
  _ <- Sdk.eRemove removeEnt rm rctrl
  return ()
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

For endpoints not covered by entity accessors, use `direct` — it never
raises and returns a result `Value` you branch on via its `ok` field:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "GET"), ("params", params)]
  result <- F.direct sdk args
  ok <- getp result "ok"
  case ok of
    VBool True -> do
      status <- getp result "status"   -- e.g. VNum 200
      body <- getp result "data"       -- the response body
      print (status, body)
    _ -> do
      -- A non-2xx response carries status + data (the error body); a
      -- transport-level failure carries err instead.
      status <- getp result "status"
      err <- getp result "err"
      print (status, err)
```

### Prepare a request without sending it

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "DELETE"), ("params", params)]
  -- prepare returns the fetch definition and raises on error.
  fetchdef <- F.prepare sdk args
  url <- getp fetchdef "url"
  method <- getp fetchdef "method"
  print (url, method)
```

### Use test mode

Create a mock client for unit testing — no server required:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  sdk <- Sdk.testSdk0
  ent <- Sdk.three_d_secure_status sdk VNoval
  arg <- emptyMap
  ctrl <- emptyMap
  -- Entity ops return the bare record and raise on error.
  three_d_secure_status <- Sdk.eLoad ent arg ctrl
  print three_d_secure_status
```

### Use a custom fetch function

Replace the HTTP transport with your own `VFunc` under `system.fetch`:

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo, jsonThunk)

customClient :: IO Sdk.Client
customClient = do
  let mockFetch = VFunc (\_ _ _ _ -> do
        body <- jo [("id", VStr "mock01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk body)])
  sys <- jo [("fetch", mockFetch)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  Sdk.newSdk opts
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run the suite (stock GHC, no third-party dependencies):

```bash
cd haskell && make test
```


## Reference

### Client constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

`newSdk :: Value -> IO Client` constructs a client from an options map;
`newSdk0 :: IO Client` is the no-argument convenience form.

| Option (map key) | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides (e.g. custom `fetch` function). |

### Test client

```haskell
client <- Sdk.testSdk testopts sdkopts
```

`testSdk :: Value -> Value -> IO Client` constructs a test-mode client with
mock transport (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a live client from options. |
| `newSdk0` | `IO Client` | Construct a live client with defaults. |
| `testSdk` | `Value -> Value -> IO Client` | Construct a test-mode client. |
| `prepare` | `Client -> Value -> IO Value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `Client -> Value -> IO Value` | Build and send an HTTP request. Returns a result `Value` (branch on `ok`). |
| `account_updater` | `Client -> Value -> IO Entity` | Create an AccountUpdater entity instance. |
| `account_updater_schedule` | `Client -> Value -> IO Entity` | Create an AccountUpdaterSchedule entity instance. |
| `account_updater_schedule_with_result` | `Client -> Value -> IO Entity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `account_updater_subscription_with_result` | `Client -> Value -> IO Entity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `account_updater_update` | `Client -> Value -> IO Entity` | Create an AccountUpdaterUpdate entity instance. |
| `api_key` | `Client -> Value -> IO Entity` | Create an ApiKey entity instance. |
| `apple_pay_merchant_detail` | `Client -> Value -> IO Entity` | Create an ApplePayMerchantDetail entity instance. |
| `apple_pay_session` | `Client -> Value -> IO Entity` | Create an ApplePaySession entity instance. |
| `dynamic_descriptor` | `Client -> Value -> IO Entity` | Create a DynamicDescriptor entity instance. |
| `i_frame_create_instance` | `Client -> Value -> IO Entity` | Create an IFrameCreateInstance entity instance. |
| `i_frame_instance` | `Client -> Value -> IO Entity` | Create an IFrameInstance entity instance. |
| `iframe` | `Client -> Value -> IO Entity` | Create an Iframe entity instance. |
| `init` | `Client -> Value -> IO Entity` | Create an Init entity instance. |
| `list_api_key_scopes_entry` | `Client -> Value -> IO Entity` | Create a ListApiKeyScopesEntry entity instance. |
| `payment_iframe` | `Client -> Value -> IO Entity` | Create a PaymentIframe entity instance. |
| `three_d_secure_auth` | `Client -> Value -> IO Entity` | Create a ThreeDSecureAuth entity instance. |
| `three_d_secure_browser_init` | `Client -> Value -> IO Entity` | Create a ThreeDSecureBrowserInit entity instance. |
| `three_d_secure_status` | `Client -> Value -> IO Entity` | Create a ThreeDSecureStatus entity instance. |
| `transaction_detail` | `Client -> Value -> IO Entity` | Create a TransactionDetail entity instance. |
| `webhook` | `Client -> Value -> IO Entity` | Create a Webhook entity instance. |

### Entity interface

All entities share the same record interface (fields of the `Entity` type).

| Field | Signature | Description |
| --- | --- | --- |
| `eLoad` | `Value -> Value -> IO Value` | Load a single entity by match criteria. Raises on error. |
| `eList` | `Value -> Value -> IO Value` | List entities matching the criteria. Raises on error. |
| `eCreate` | `Value -> Value -> IO Value` | Create a new entity. Raises on error. |
| `eUpdate` | `Value -> Value -> IO Value` | Update an existing entity. Raises on error. |
| `eRemove` | `Value -> Value -> IO Value` | Remove an entity. Raises on error. |
| `eDataGet` | `IO Value` | Get entity data. |
| `eDataSet` | `Value -> IO ()` | Set entity data. |
| `eStream` | `String -> Value -> Value -> IO [Value]` | Run an op as a lazy stream of items. |
| `eMake` | `IO Entity` | Create a new instance with the same options. |
| `eName` | `String` | The entity name. |

### Result shape

Entity operations return the bare result `Value` (a map for single-entity
ops, a list for `eList`) and raise on error. Wrap calls in
`Control.Exception.try` to handle failures.

The `direct` escape hatch never raises — it returns a result `Value`
you branch on via its `ok` field (read with `getp result "ok"`):

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `True` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `False` and `err` carries the error value.

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

Create an instance: `account_updater <- Sdk.account_updater sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eRemove ent match ctrl` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `account_updater_schedule <- Sdk.account_updater_schedule sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `Bool` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `[Value]` |  |

#### Example: Create

```haskell
  ent <- Sdk.account_updater_schedule sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  account_updater_schedule <- Sdk.eCreate ent d ctrl
```


### AccountUpdaterScheduleWithResult

Create an instance: `account_updater_schedule_with_result <- Sdk.account_updater_schedule_with_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `[Value]` |  |
| `created_at` | `String` |  |
| `enabled` | `Bool` |  |
| `expiry` | `String` |  |
| `id` | `String` |  |
| `most_recent_update` | `Value` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `response_format` | `String` |  |
| `token` | `[Value]` |  |
| `type` | `String` |  |
| `updated_at` | `String` |  |

#### Example: List

```haskell
  ent <- Sdk.account_updater_schedule_with_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  account_updater_schedule_with_results <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.account_updater_schedule_with_result sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  account_updater_schedule_with_result <- Sdk.eCreate ent d ctrl
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `account_updater_subscription_with_result <- Sdk.account_updater_subscription_with_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `String` |  |
| `enabled` | `Bool` |  |
| `id` | `String` |  |
| `period_date` | `String` |  |
| `period_id` | `String` |  |
| `record` | `[Value]` |  |
| `response_format` | `String` |  |
| `template_ref` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.account_updater_subscription_with_result sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("subscription_id", VStr "subscription_id")]
  ctrl <- emptyMap
  account_updater_subscription_with_result <- Sdk.eLoad ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.account_updater_subscription_with_result sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    , ("subscription_id", VStr "example_subscription_id")   -- String
    ]
  ctrl <- emptyMap
  account_updater_subscription_with_result <- Sdk.eCreate ent d ctrl
```


### AccountUpdaterUpdate

Create an instance: `account_updater_update <- Sdk.account_updater_update sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

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
| `recurring_schedule` | `[Value]` |  |
| `status` | `String` |  |
| `update_id` | `String` |  |
| `updated_at` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.account_updater_update sdk VNoval
  match <- jo [("id", VStr "account_updater_update_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  account_updater_update <- Sdk.eLoad ent match ctrl
```


### ApiKey

Create an instance: `api_key <- Sdk.api_key sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `[Value]` |  |
| `enabled` | `Bool` |  |
| `expires_at` | `String` |  |
| `expires_in` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `method` | `[Value]` |  |
| `scope` | `[Value]` |  |
| `secret` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.api_key sdk VNoval
  match <- jo [("id", VStr "api_key_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  api_key <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.api_key sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  api_keys <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.api_key sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  api_key <- Sdk.eCreate ent d ctrl
```


### ApplePayMerchantDetail

Create an instance: `apple_pay_merchant_detail <- Sdk.apple_pay_merchant_detail sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `[Value]` |  |
| `merchant_url` | `String` |  |
| `partner_merchant_name` | `String` |  |
| `payconex_account_id` | `String` |  |

#### Example: List

```haskell
  ent <- Sdk.apple_pay_merchant_detail sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  apple_pay_merchant_details <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.apple_pay_merchant_detail sdk VNoval
  d <- jo
    [ ("account_id", VNum 1)   -- Int
    ]
  ctrl <- emptyMap
  apple_pay_merchant_detail <- Sdk.eCreate ent d ctrl
```


### ApplePaySession

Create an instance: `apple_pay_session <- Sdk.apple_pay_session sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `String` |  |
| `domain_name` | `String` |  |
| `epoch_timestamp` | `Int` |  |
| `expires_at` | `Int` |  |
| `merchant_identifier` | `String` |  |
| `merchant_session_identifier` | `String` |  |
| `nonce` | `Int` |  |
| `operational_analytics_identifier` | `String` |  |
| `referrer` | `String` |  |
| `retry` | `Int` |  |
| `signature` | `String` |  |

#### Example: Create

```haskell
  ent <- Sdk.apple_pay_session sdk VNoval
  d <- jo
    [ ("account_id", VNum 1)   -- Int
    ]
  ctrl <- emptyMap
  apple_pay_session <- Sdk.eCreate ent d ctrl
```


### DynamicDescriptor

Create an instance: `dynamic_descriptor <- Sdk.dynamic_descriptor sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `String` |  |
| `descriptor` | `String` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `state` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  match <- jo [("id", VStr "dynamic_descriptor_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  dynamic_descriptor <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  dynamic_descriptors <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  dynamic_descriptor <- Sdk.eCreate ent d ctrl
```


### IFrameCreateInstance

Create an instance: `i_frame_create_instance <- Sdk.i_frame_create_instance sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `String` |  |
| `currency` | `String` |  |
| `customer` | `Value` |  |
| `initialize_transaction` | `Bool` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `reference` | `String` |  |
| `timeout` | `Double` |  |
| `token` | `[Value]` |  |

#### Example: Create

```haskell
  ent <- Sdk.i_frame_create_instance sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    , ("payment_iframe_id", VStr "example_payment_iframe_id")   -- String
    ]
  ctrl <- emptyMap
  i_frame_create_instance <- Sdk.eCreate ent d ctrl
```


### IFrameInstance

Create an instance: `i_frame_instance <- Sdk.i_frame_instance sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Example: Load

```haskell
  ent <- Sdk.i_frame_instance sdk VNoval
  match <- jo [("id", VStr "i_frame_instance_id"), ("account_id", VStr "account_id"), ("payment_iframe_id", VStr "payment_iframe_id")]
  ctrl <- emptyMap
  i_frame_instance <- Sdk.eLoad ent match ctrl
```


### Iframe

Create an instance: `iframe <- Sdk.iframe sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `Value` |  |
| `allowed_parent_domain` | `[Value]` |  |
| `allowed_payment_method` | `[Value]` |  |
| `card_setting` | `Value` |  |
| `click_to_pay_setting` | `Value` |  |
| `currency` | `String` |  |
| `id` | `String` |  |
| `label` | `String` |  |
| `language` | `String` |  |
| `timeout` | `Double` |  |

#### Example: Load

```haskell
  ent <- Sdk.iframe sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("iframe_id", VStr "iframe_id")]
  ctrl <- emptyMap
  iframe <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.iframe sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  iframes <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.iframe sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  iframe <- Sdk.eCreate ent d ctrl
```


### Init

Create an instance: `init <- Sdk.init sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `Value` |  |
| `description` | `String` |  |
| `item` | `[Value]` |  |
| `level2` | `Value` |  |
| `level3` | `Value` |  |
| `shipping_address` | `Value` |  |
| `trace` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.init sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  init <- Sdk.eCreate ent d ctrl
```


### ListApiKeyScopesEntry

Create an instance: `list_api_key_scopes_entry <- Sdk.list_api_key_scopes_entry sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `String` |  |
| `description` | `String` |  |
| `enabled` | `Bool` |  |
| `level` | `Int` |  |
| `scope` | `String` |  |

#### Example: List

```haskell
  ent <- Sdk.list_api_key_scopes_entry sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  list_api_key_scopes_entrys <- Sdk.eList ent match ctrl
```


### PaymentIframe

Create an instance: `payment_iframe <- Sdk.payment_iframe sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eRemove ent match ctrl` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `three_d_secure_auth <- Sdk.three_d_secure_auth sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `Value` |  |
| `card` | `Value` |  |
| `challenge` | `Value` |  |
| `customer` | `Value` |  |
| `purchase` | `Value` |  |
| `server_transaction_id` | `String` |  |
| `shipping` | `Value` |  |
| `status` | `String` |  |
| `three_d_secure_challenge_indicator` | `String` |  |
| `three_d_secure_id` | `String` |  |
| `trace` | `Value` |  |

#### Example: Create

```haskell
  ent <- Sdk.three_d_secure_auth sdk VNoval
  d <- jo
    [ ("3_d_id", VStr "example_3_d_id")   -- String
    , ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  three_d_secure_auth <- Sdk.eCreate ent d ctrl
```


### ThreeDSecureBrowserInit

Create an instance: `three_d_secure_browser_init <- Sdk.three_d_secure_browser_init sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

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

```haskell
  ent <- Sdk.three_d_secure_browser_init sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  three_d_secure_browser_init <- Sdk.eCreate ent d ctrl
```


### ThreeDSecureStatus

Create an instance: `three_d_secure_status <- Sdk.three_d_secure_status sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `Value` |  |
| `info` | `Value` |  |
| `server_transaction_id` | `String` |  |
| `status` | `String` |  |
| `three_d_secure` | `Value` |  |
| `three_d_secure_id` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.three_d_secure_status sdk VNoval
  match <- jo [("3_d_id", VStr "3_d_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  three_d_secure_status <- Sdk.eLoad ent match ctrl
```


### TransactionDetail

Create an instance: `transaction_detail <- Sdk.transaction_detail sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `Value` |  |
| `auth` | `Value` |  |
| `card` | `Value` |  |
| `customer` | `Value` |  |
| `description` | `String` |  |
| `id` | `String` |  |
| `item` | `[Value]` |  |
| `level2` | `Value` |  |
| `level3` | `Value` |  |
| `override` | `Value` |  |
| `shipping_address` | `Value` |  |
| `status` | `String` |  |
| `timestamp` | `String` |  |
| `trace` | `Value` |  |

#### Example: Load

```haskell
  ent <- Sdk.transaction_detail sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("transaction_id", VStr "transaction_id")]
  ctrl <- emptyMap
  transaction_detail <- Sdk.eLoad ent match ctrl
```


### Webhook

Create an instance: `webhook <- Sdk.webhook sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `String` |  |
| `id` | `String` |  |
| `url` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.webhook sdk VNoval
  match <- jo [("id", VStr "webhook_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  webhook <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.webhook sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  webhooks <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.webhook sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  webhook <- Sdk.eCreate ent d ctrl
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

### Data as struct Values

The Haskell SDK models every API record as the dynamic `Value` type (from
the vendored `VoxgigStruct` module) rather than bespoke Haskell records.
This mirrors the dynamic nature of the API and keeps the SDK flexible — no
new datatypes or code generation are needed when the API schema changes.

Build request maps with `jo [(key, value)]` and read fields back with
`getp value "field"`; scalars are the `VStr` / `VNum` / `VBool`
constructors, and `VNoval` stands for an absent property.

### Module structure

```
haskell/
├── src/
│   ├── VoxgigStruct.hs   -- vendored dependency-free struct library (Value)
│   ├── Vregex.hs         -- vendored regex support
│   ├── SdkTypes.hs       -- core types (Client, Entity, Feature)
│   ├── SdkHelpers.hs     -- helper functions (jo, getp, ...)
│   ├── SdkRuntime.hs     -- the generic operation pipeline
│   ├── SdkFeatures.hs    -- built-in features + makeEntity
│   ├── SdkConfig.hs      -- generated API configuration + feature factory
│   └── SdkClient.hs      -- generated public client (newSdk, entity accessors)
├── test/                 -- test suites
├── Makefile              -- stock-GHC build/test (no third-party deps)
└── bluefinpayconex-sdk.cabal      -- package manifest (for Hackage)
```

The public module (`SdkClient`) exports the SDK constructors (`newSdk`,
`testSdk`) and one accessor per entity. Import `VoxgigStruct` for the
`Value` constructors and `SdkHelpers` for `jo` / `getp`.

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
