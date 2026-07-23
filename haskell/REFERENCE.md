# BluefinPayconex Haskell SDK Reference

Complete API reference for the BluefinPayconex Haskell SDK.


## Client

### Constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

Construct a live SDK client.

**Functions:**

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a client from an options map. |
| `newSdk0` | `IO Client` | Construct a client with defaults. |

**Options (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL for API requests. |
| `prefix` | `String` | URL prefix appended after base. |
| `suffix` | `String` | URL suffix appended after path. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature configuration. |
| `system` | `Value` | System overrides (e.g. custom fetch). |


### Test constructors

```haskell
client <- Sdk.testSdk0
```

`testSdk :: Value -> Value -> IO Client` constructs a test client with mock
features active (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.


### Entity accessors

#### `account_updater :: Client -> Value -> IO Entity`

Construct a `AccountUpdater` entity bound to the client. Pass `VNoval` for no initial options.

#### `account_updater_schedule :: Client -> Value -> IO Entity`

Construct a `AccountUpdaterSchedule` entity bound to the client. Pass `VNoval` for no initial options.

#### `account_updater_schedule_with_result :: Client -> Value -> IO Entity`

Construct a `AccountUpdaterScheduleWithResult` entity bound to the client. Pass `VNoval` for no initial options.

#### `account_updater_subscription_with_result :: Client -> Value -> IO Entity`

Construct a `AccountUpdaterSubscriptionWithResult` entity bound to the client. Pass `VNoval` for no initial options.

#### `account_updater_update :: Client -> Value -> IO Entity`

Construct a `AccountUpdaterUpdate` entity bound to the client. Pass `VNoval` for no initial options.

#### `api_key :: Client -> Value -> IO Entity`

Construct a `ApiKey` entity bound to the client. Pass `VNoval` for no initial options.

#### `apple_pay_merchant_detail :: Client -> Value -> IO Entity`

Construct a `ApplePayMerchantDetail` entity bound to the client. Pass `VNoval` for no initial options.

#### `apple_pay_session :: Client -> Value -> IO Entity`

Construct a `ApplePaySession` entity bound to the client. Pass `VNoval` for no initial options.

#### `dynamic_descriptor :: Client -> Value -> IO Entity`

Construct a `DynamicDescriptor` entity bound to the client. Pass `VNoval` for no initial options.

#### `i_frame_create_instance :: Client -> Value -> IO Entity`

Construct a `IFrameCreateInstance` entity bound to the client. Pass `VNoval` for no initial options.

#### `i_frame_instance :: Client -> Value -> IO Entity`

Construct a `IFrameInstance` entity bound to the client. Pass `VNoval` for no initial options.

#### `iframe :: Client -> Value -> IO Entity`

Construct a `Iframe` entity bound to the client. Pass `VNoval` for no initial options.

#### `init :: Client -> Value -> IO Entity`

Construct a `Init` entity bound to the client. Pass `VNoval` for no initial options.

#### `list_api_key_scopes_entry :: Client -> Value -> IO Entity`

Construct a `ListApiKeyScopesEntry` entity bound to the client. Pass `VNoval` for no initial options.

#### `payment_iframe :: Client -> Value -> IO Entity`

Construct a `PaymentIframe` entity bound to the client. Pass `VNoval` for no initial options.

#### `three_d_secure_auth :: Client -> Value -> IO Entity`

Construct a `ThreeDSecureAuth` entity bound to the client. Pass `VNoval` for no initial options.

#### `three_d_secure_browser_init :: Client -> Value -> IO Entity`

Construct a `ThreeDSecureBrowserInit` entity bound to the client. Pass `VNoval` for no initial options.

#### `three_d_secure_status :: Client -> Value -> IO Entity`

Construct a `ThreeDSecureStatus` entity bound to the client. Pass `VNoval` for no initial options.

#### `transaction_detail :: Client -> Value -> IO Entity`

Construct a `TransactionDetail` entity bound to the client. Pass `VNoval` for no initial options.

#### `webhook :: Client -> Value -> IO Entity`

Construct a `Webhook` entity bound to the client. Pass `VNoval` for no initial options.

### HTTP escape hatches

#### `direct :: Client -> Value -> IO Value` (module `SdkFeatures`)

Make a direct HTTP request to any API endpoint. Returns a result `Value` with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `getp result "ok"`.

**Argument (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String` | URL path with optional `{param}` placeholders. |
| `method` | `String` | HTTP method (default: `"GET"`). |
| `params` | `Value` | Path parameter values. |
| `query` | `Value` | Query string parameters. |
| `headers` | `Value` | Request headers (merged with defaults). |
| `body` | `Value` | Request body (maps are JSON-serialized). |

#### `prepare :: Client -> Value -> IO Value` (module `SdkFeatures`)

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AccountUpdater

```haskell
  ent <- Sdk.account_updater sdk VNoval
```

### Operations

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

```haskell
  ent <- Sdk.account_updater sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("subscription_id", VStr "subscription_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `AccountUpdater` entity with the same options.

#### `eName :: String`

The entity name.


---

## AccountUpdaterSchedule

```haskell
  ent <- Sdk.account_updater_schedule sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `Bool` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `[Value]` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.account_updater_schedule sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `AccountUpdaterSchedule` entity with the same options.

#### `eName :: String`

The entity name.


---

## AccountUpdaterScheduleWithResult

```haskell
  ent <- Sdk.account_updater_schedule_with_result sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `[Value]` | Yes |  |
| `created_at` | `String` | Yes |  |
| `enabled` | `Bool` | No |  |
| `expiry` | `String` | No |  |
| `id` | `String` | Yes |  |
| `most_recent_update` | `Value` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | Yes |  |
| `response_format` | `String` | No |  |
| `token` | `[Value]` | Yes |  |
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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.account_updater_schedule_with_result sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.account_updater_schedule_with_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `AccountUpdaterScheduleWithResult` entity with the same options.

#### `eName :: String`

The entity name.


---

## AccountUpdaterSubscriptionWithResult

```haskell
  ent <- Sdk.account_updater_subscription_with_result sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `String` | No |  |
| `enabled` | `Bool` | No |  |
| `id` | `String` | No |  |
| `period_date` | `String` | No |  |
| `period_id` | `String` | No |  |
| `record` | `[Value]` | No |  |
| `response_format` | `String` | No |  |
| `template_ref` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.account_updater_subscription_with_result sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    , ("subscription_id", VStr "example_subscription_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.account_updater_subscription_with_result sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("subscription_id", VStr "subscription_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eUpdate ent data ctrl :: IO Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```haskell
  ent <- Sdk.account_updater_subscription_with_result sdk VNoval
  d <- jo
    [ ("account_id", VStr "account_id")
    , ("subscription_id", VStr "subscription_id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `AccountUpdaterSubscriptionWithResult` entity with the same options.

#### `eName :: String`

The entity name.


---

## AccountUpdaterUpdate

```haskell
  ent <- Sdk.account_updater_update sdk VNoval
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
| `recurring_schedule` | `[Value]` | No |  |
| `status` | `String` | No |  |
| `update_id` | `String` | No |  |
| `updated_at` | `String` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.account_updater_update sdk VNoval
  match <- jo [("id", VStr "account_updater_update_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `AccountUpdaterUpdate` entity with the same options.

#### `eName :: String`

The entity name.


---

## ApiKey

```haskell
  ent <- Sdk.api_key sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `[Value]` | No |  |
| `enabled` | `Bool` | No |  |
| `expires_at` | `String` | No |  |
| `expires_in` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | No |  |
| `method` | `[Value]` | No |  |
| `scope` | `[Value]` | No |  |
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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.api_key sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.api_key sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.api_key sdk VNoval
  match <- jo [("id", VStr "api_key_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

```haskell
  ent <- Sdk.api_key sdk VNoval
  match <- jo [("id", VStr "api_key_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

#### `eUpdate ent data ctrl :: IO Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```haskell
  ent <- Sdk.api_key sdk VNoval
  d <- jo
    [ ("id", VStr "api_key_id")
    , ("account_id", VStr "account_id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `ApiKey` entity with the same options.

#### `eName :: String`

The entity name.


---

## ApplePayMerchantDetail

```haskell
  ent <- Sdk.apple_pay_merchant_detail sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `[Value]` | Yes |  |
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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.apple_pay_merchant_detail sdk VNoval
  d <- jo
    [ ("account_id", VNum 1)   -- Int
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.apple_pay_merchant_detail sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `ApplePayMerchantDetail` entity with the same options.

#### `eName :: String`

The entity name.


---

## ApplePaySession

```haskell
  ent <- Sdk.apple_pay_session sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `String` | No |  |
| `domain_name` | `String` | No |  |
| `epoch_timestamp` | `Int` | No |  |
| `expires_at` | `Int` | No |  |
| `merchant_identifier` | `String` | No |  |
| `merchant_session_identifier` | `String` | No |  |
| `nonce` | `Int` | No |  |
| `operational_analytics_identifier` | `String` | No |  |
| `referrer` | `String` | Yes |  |
| `retry` | `Int` | No |  |
| `signature` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.apple_pay_session sdk VNoval
  d <- jo
    [ ("account_id", VNum 1)   -- Int
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `ApplePaySession` entity with the same options.

#### `eName :: String`

The entity name.


---

## DynamicDescriptor

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  match <- jo [("id", VStr "dynamic_descriptor_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  match <- jo [("id", VStr "dynamic_descriptor_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

#### `eUpdate ent data ctrl :: IO Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```haskell
  ent <- Sdk.dynamic_descriptor sdk VNoval
  d <- jo
    [ ("id", VStr "dynamic_descriptor_id")
    , ("account_id", VStr "account_id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DynamicDescriptor` entity with the same options.

#### `eName :: String`

The entity name.


---

## IFrameCreateInstance

```haskell
  ent <- Sdk.i_frame_create_instance sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `String` | No |  |
| `currency` | `String` | No |  |
| `customer` | `Value` | No |  |
| `initialize_transaction` | `Bool` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `reference` | `String` | No |  |
| `timeout` | `Double` | No |  |
| `token` | `[Value]` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.i_frame_create_instance sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    , ("payment_iframe_id", VStr "example_payment_iframe_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `IFrameCreateInstance` entity with the same options.

#### `eName :: String`

The entity name.


---

## IFrameInstance

```haskell
  ent <- Sdk.i_frame_instance sdk VNoval
```

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.i_frame_instance sdk VNoval
  match <- jo [("id", VStr "i_frame_instance_id"), ("account_id", VStr "account_id"), ("payment_iframe_id", VStr "payment_iframe_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `IFrameInstance` entity with the same options.

#### `eName :: String`

The entity name.


---

## Iframe

```haskell
  ent <- Sdk.iframe sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Value` | No |  |
| `allowed_parent_domain` | `[Value]` | Yes |  |
| `allowed_payment_method` | `[Value]` | Yes |  |
| `card_setting` | `Value` | No |  |
| `click_to_pay_setting` | `Value` | No |  |
| `currency` | `String` | No |  |
| `id` | `String` | No |  |
| `label` | `String` | Yes |  |
| `language` | `String` | No |  |
| `timeout` | `Double` | No |  |

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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.iframe sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.iframe sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.iframe sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("iframe_id", VStr "iframe_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eUpdate ent data ctrl :: IO Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```haskell
  ent <- Sdk.iframe sdk VNoval
  d <- jo
    [ ("account_id", VStr "account_id")
    , ("iframe_id", VStr "iframe_id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Iframe` entity with the same options.

#### `eName :: String`

The entity name.


---

## Init

```haskell
  ent <- Sdk.init sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Value` | No |  |
| `description` | `String` | No |  |
| `item` | `[Value]` | No |  |
| `level2` | `Value` | No |  |
| `level3` | `Value` | No |  |
| `shipping_address` | `Value` | Yes |  |
| `trace` | `Value` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.init sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Init` entity with the same options.

#### `eName :: String`

The entity name.


---

## ListApiKeyScopesEntry

```haskell
  ent <- Sdk.list_api_key_scopes_entry sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `String` | No |  |
| `description` | `String` | No |  |
| `enabled` | `Bool` | No |  |
| `level` | `Int` | No |  |
| `scope` | `String` | No |  |

### Operations

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.list_api_key_scopes_entry sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `ListApiKeyScopesEntry` entity with the same options.

#### `eName :: String`

The entity name.


---

## PaymentIframe

```haskell
  ent <- Sdk.payment_iframe sdk VNoval
```

### Operations

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

```haskell
  ent <- Sdk.payment_iframe sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("id", VStr "id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `PaymentIframe` entity with the same options.

#### `eName :: String`

The entity name.


---

## ThreeDSecureAuth

```haskell
  ent <- Sdk.three_d_secure_auth sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Value` | Yes |  |
| `card` | `Value` | Yes |  |
| `challenge` | `Value` | No |  |
| `customer` | `Value` | No |  |
| `purchase` | `Value` | Yes |  |
| `server_transaction_id` | `String` | No |  |
| `shipping` | `Value` | Yes |  |
| `status` | `String` | No |  |
| `three_d_secure_challenge_indicator` | `String` | No |  |
| `three_d_secure_id` | `String` | No |  |
| `trace` | `Value` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.three_d_secure_auth sdk VNoval
  d <- jo
    [ ("3_d_id", VStr "example_3_d_id")   -- String
    , ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `ThreeDSecureAuth` entity with the same options.

#### `eName :: String`

The entity name.


---

## ThreeDSecureBrowserInit

```haskell
  ent <- Sdk.three_d_secure_browser_init sdk VNoval
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

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.three_d_secure_browser_init sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `ThreeDSecureBrowserInit` entity with the same options.

#### `eName :: String`

The entity name.


---

## ThreeDSecureStatus

```haskell
  ent <- Sdk.three_d_secure_status sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Value` | No |  |
| `info` | `Value` | No |  |
| `server_transaction_id` | `String` | No |  |
| `status` | `String` | No |  |
| `three_d_secure` | `Value` | No |  |
| `three_d_secure_id` | `String` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.three_d_secure_status sdk VNoval
  match <- jo [("3_d_id", VStr "3_d_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `ThreeDSecureStatus` entity with the same options.

#### `eName :: String`

The entity name.


---

## TransactionDetail

```haskell
  ent <- Sdk.transaction_detail sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Value` | Yes |  |
| `auth` | `Value` | Yes |  |
| `card` | `Value` | No |  |
| `customer` | `Value` | No |  |
| `description` | `String` | No |  |
| `id` | `String` | No |  |
| `item` | `[Value]` | No |  |
| `level2` | `Value` | No |  |
| `level3` | `Value` | No |  |
| `override` | `Value` | No |  |
| `shipping_address` | `Value` | Yes |  |
| `status` | `String` | Yes |  |
| `timestamp` | `String` | No |  |
| `trace` | `Value` | No |  |

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

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.transaction_detail sdk VNoval
  match <- jo [("account_id", VStr "account_id"), ("transaction_id", VStr "transaction_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eUpdate ent data ctrl :: IO Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```haskell
  ent <- Sdk.transaction_detail sdk VNoval
  d <- jo
    [ ("account_id", VStr "account_id")
    , ("transaction_id", VStr "transaction_id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `TransactionDetail` entity with the same options.

#### `eName :: String`

The entity name.


---

## Webhook

```haskell
  ent <- Sdk.webhook sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `String` | Yes |  |
| `id` | `String` | No |  |
| `url` | `String` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.webhook sdk VNoval
  d <- jo
    [ ("account_id", VStr "example_account_id")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eList ent match ctrl :: IO Value`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.webhook sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.webhook sdk VNoval
  match <- jo [("id", VStr "webhook_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

```haskell
  ent <- Sdk.webhook sdk VNoval
  match <- jo [("id", VStr "webhook_id"), ("account_id", VStr "account_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

#### `eUpdate ent data ctrl :: IO Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```haskell
  ent <- Sdk.webhook sdk VNoval
  d <- jo
    [ ("id", VStr "webhook_id")
    , ("account_id", VStr "account_id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Webhook` entity with the same options.

#### `eName :: String`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("test", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```

