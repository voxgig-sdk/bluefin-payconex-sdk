# BluefinPayconex Elixir SDK



The Elixir SDK for the BluefinPayconex API — an entity-oriented client
following idiomatic, functional Elixir conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `BluefinPayconex.account_updater(sdk)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to [Hex](https://hex.pm). Install it from
the GitHub release tag (`elixir/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases))
by adding a git dependency to your `mix.exs`:

```elixir
def deps do
  [
    {:bluefin_payconex, git: "https://github.com/voxgig-sdk/bluefin-payconex-sdk.git", tag: "elixir/vX.Y.Z"}
  ]
end
```

Or from a local source checkout:

```elixir
def deps do
  [
    {:bluefin_payconex, path: "../bluefin-payconex-sdk/elixir"}
  ]
end
```

Then run `mix deps.get`.


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```elixir
alias BluefinPayconex.Helpers, as: H

sdk = BluefinPayconex.new(H.deep(%{"apikey" => System.get_env("BLUEFIN_PAYCONEX_APIKEY")}))
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load/2` returns the bare record and raises on error.

```elixir
try do
  account_updater_subscription_with_result = BluefinPayconex.account_updater_subscription_with_result(sdk)
  record = BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult.load(account_updater_subscription_with_result, H.deep(%{"account_id" => "example_account_id", "subscription_id" => "example_subscription_id"}))
  IO.inspect(record)
rescue
  err -> IO.puts("load failed: " <> inspect(err))
end
```

### 4. Create, update, and remove

```elixir
account_updater = BluefinPayconex.account_updater(sdk)

# Remove
BluefinPayconex.Entity.AccountUpdater.remove(account_updater, H.deep(%{"account_id" => "example_account_id", "subscription_id" => "example_subscription_id"}))
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

For endpoints not covered by entity operations. `direct/2` never raises —
it returns a result node you branch on with `Voxgig.Struct.getprop/2`:

```elixir
alias Voxgig.Struct, as: S
alias BluefinPayconex.Helpers, as: H

result = BluefinPayconex.direct(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => %{"id" => "example"}
}))

if S.getprop(result, "ok") do
  IO.inspect(S.getprop(result, "status"))  # 200
  IO.inspect(S.getprop(result, "data"))    # response body
else
  # A non-2xx response carries status + data (the error body); a
  # transport-level failure carries err instead.
  IO.inspect(S.getprop(result, "err"))
end
```

### Prepare a request without sending it

```elixir
alias BluefinPayconex.Helpers, as: H

# prepare/2 returns the fetch definition and raises on error.
fetchdef = BluefinPayconex.prepare(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "DELETE",
  "params" => %{"id" => "example"}
}))

IO.inspect(Voxgig.Struct.getprop(fetchdef, "url"))
IO.inspect(Voxgig.Struct.getprop(fetchdef, "method"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```elixir
alias BluefinPayconex.Helpers, as: H

sdk = BluefinPayconex.test()

# Entity ops return the bare record (raise on error).
three_d_secure_status = BluefinPayconex.three_d_secure_status(sdk)
record = BluefinPayconex.Entity.ThreeDSecureStatus.load(three_d_secure_status, H.deep(%{}))
IO.inspect(record)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. It receives `(url,
fetchdef)` and returns a `{response, error}` tuple:

```elixir
alias Voxgig.Struct, as: S
alias BluefinPayconex.Helpers, as: H

mock_fetch = fn _url, _fetchdef ->
  response = H.deep(%{
    "status" => 200,
    "statusText" => "OK",
    "headers" => %{},
    "json" => fn -> %{"id" => "mock01"} end
  })
  {response, nil}
end

sdk = BluefinPayconex.new(H.deep(%{
  "base" => "http://localhost:8080",
  "system" => %{"fetch" => mock_fetch}
}))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd elixir && mix test
```


## Reference

### BluefinPayconex

```elixir
sdk = BluefinPayconex.new(options)
```

Creates a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinPayconex.Helpers.deep/1`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String.t()` | API key for authentication. |
| `base` | `String.t()` | Base URL of the API server. |
| `prefix` | `String.t()` | URL path prefix prepended to all requests. |
| `suffix` | `String.t()` | URL path suffix appended to all requests. |
| `feature` | `map()` | Feature activation flags. |
| `extend` | `list()` | Additional feature instances to load. |
| `system` | `map()` | System overrides (e.g. custom `fetch` function). |

### test

```elixir
sdk = BluefinPayconex.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinPayconex functions

| Function | Signature | Description |
| --- | --- | --- |
| `options_map` | `(client) :: map()` | Deep copy of current SDK options. |
| `get_utility` | `(client) :: map()` | The SDK utility node. |
| `prepare` | `(client, fetchargs) :: map()` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client, fetchargs) :: map()` | Build and send an HTTP request. Returns a result node (branch on `ok`). |
| `account_updater` | `(client, entopts \\ nil) :: entity` | Create an AccountUpdater entity handle. |
| `account_updater_schedule` | `(client, entopts \\ nil) :: entity` | Create an AccountUpdaterSchedule entity handle. |
| `account_updater_schedule_with_result` | `(client, entopts \\ nil) :: entity` | Create an AccountUpdaterScheduleWithResult entity handle. |
| `account_updater_subscription_with_result` | `(client, entopts \\ nil) :: entity` | Create an AccountUpdaterSubscriptionWithResult entity handle. |
| `account_updater_update` | `(client, entopts \\ nil) :: entity` | Create an AccountUpdaterUpdate entity handle. |
| `api_key` | `(client, entopts \\ nil) :: entity` | Create an ApiKey entity handle. |
| `apple_pay_merchant_detail` | `(client, entopts \\ nil) :: entity` | Create an ApplePayMerchantDetail entity handle. |
| `apple_pay_session` | `(client, entopts \\ nil) :: entity` | Create an ApplePaySession entity handle. |
| `dynamic_descriptor` | `(client, entopts \\ nil) :: entity` | Create a DynamicDescriptor entity handle. |
| `i_frame_create_instance` | `(client, entopts \\ nil) :: entity` | Create an IFrameCreateInstance entity handle. |
| `i_frame_instance` | `(client, entopts \\ nil) :: entity` | Create an IFrameInstance entity handle. |
| `iframe` | `(client, entopts \\ nil) :: entity` | Create an Iframe entity handle. |
| `init` | `(client, entopts \\ nil) :: entity` | Create an Init entity handle. |
| `list_api_key_scopes_entry` | `(client, entopts \\ nil) :: entity` | Create a ListApiKeyScopesEntry entity handle. |
| `payment_iframe` | `(client, entopts \\ nil) :: entity` | Create a PaymentIframe entity handle. |
| `three_d_secure_auth` | `(client, entopts \\ nil) :: entity` | Create a ThreeDSecureAuth entity handle. |
| `three_d_secure_browser_init` | `(client, entopts \\ nil) :: entity` | Create a ThreeDSecureBrowserInit entity handle. |
| `three_d_secure_status` | `(client, entopts \\ nil) :: entity` | Create a ThreeDSecureStatus entity handle. |
| `transaction_detail` | `(client, entopts \\ nil) :: entity` | Create a TransactionDetail entity handle. |
| `webhook` | `(client, entopts \\ nil) :: entity` | Create a Webhook entity handle. |

### Entity interface

Every entity's `BluefinPayconex.Entity.<Name>` module shares the same interface.

| Function | Signature | Description |
| --- | --- | --- |
| `load` | `(entity, reqmatch, ctrl \\ nil) :: map()` | Load a single entity by match criteria. Raises on error. |
| `list` | `(entity, reqmatch \\ nil, ctrl \\ nil) :: list()` | List entities matching the criteria. Raises on error. |
| `create` | `(entity, reqdata, ctrl \\ nil) :: map()` | Create a new entity. Raises on error. |
| `update` | `(entity, reqdata, ctrl \\ nil) :: map()` | Update an existing entity. Raises on error. |
| `remove` | `(entity, reqmatch \\ nil, ctrl \\ nil) :: map()` | Remove an entity. Raises on error. |
| `data_get` | `(entity) :: map()` | Get entity data. |
| `data_set` | `(entity, data)` | Set entity data. |
| `match_get` | `(entity) :: map()` | Get entity match criteria. |
| `match_set` | `(entity, match)` | Set entity match criteria. |
| `make` | `(entity) :: entity` | Create a new handle with the same options. |
| `get_name` | `(entity) :: String.t()` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a value node — a map for
single-entity ops, a list for `list`) and raise a `BluefinPayconex.Error` on
failure. Wrap calls in `try`/`rescue` to handle errors.

The `direct/2` escape hatch never raises — it returns a result node you
branch on via `Voxgig.Struct.getprop(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean()` | `true` if the HTTP status is 2xx. |
| `status` | `integer()` | HTTP status code. |
| `headers` | `map()` | Response headers. |
| `data` | `any()` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Every operation lives on the entity's `BluefinPayconex.Entity.<Name>` module and
takes an entity handle built from the client:


### AccountUpdater

Create a handle: `account_updater = BluefinPayconex.account_updater(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `remove(entity, match)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create a handle: `account_updater_schedule = BluefinPayconex.account_updater_schedule(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `boolean()` |  |
| `period_date` | `String.t()` |  |
| `period_id` | `String.t()` |  |
| `response_format` | `String.t()` |  |
| `token` | `list()` |  |

#### Example: Create

```elixir
account_updater_schedule = BluefinPayconex.account_updater_schedule(sdk)
record = BluefinPayconex.Entity.AccountUpdaterSchedule.create(account_updater_schedule, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```


### AccountUpdaterScheduleWithResult

Create a handle: `account_updater_schedule_with_result = BluefinPayconex.account_updater_schedule_with_result(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `list()` |  |
| `created_at` | `String.t()` |  |
| `enabled` | `boolean()` |  |
| `expiry` | `String.t()` |  |
| `id` | `String.t()` |  |
| `most_recent_update` | `map()` |  |
| `period_date` | `String.t()` |  |
| `period_id` | `String.t()` |  |
| `response_format` | `String.t()` |  |
| `token` | `list()` |  |
| `type` | `String.t()` |  |
| `updated_at` | `String.t()` |  |

#### Example: List

```elixir
account_updater_schedule_with_result = BluefinPayconex.account_updater_schedule_with_result(sdk)
records = BluefinPayconex.Entity.AccountUpdaterScheduleWithResult.list(account_updater_schedule_with_result)
```

#### Example: Create

```elixir
account_updater_schedule_with_result = BluefinPayconex.account_updater_schedule_with_result(sdk)
record = BluefinPayconex.Entity.AccountUpdaterScheduleWithResult.create(account_updater_schedule_with_result, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```


### AccountUpdaterSubscriptionWithResult

Create a handle: `account_updater_subscription_with_result = BluefinPayconex.account_updater_subscription_with_result(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `String.t()` |  |
| `enabled` | `boolean()` |  |
| `id` | `String.t()` |  |
| `period_date` | `String.t()` |  |
| `period_id` | `String.t()` |  |
| `record` | `list()` |  |
| `response_format` | `String.t()` |  |
| `template_ref` | `String.t()` |  |
| `updated_at` | `String.t()` |  |

#### Example: Load

```elixir
account_updater_subscription_with_result = BluefinPayconex.account_updater_subscription_with_result(sdk)
record = BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult.load(account_updater_subscription_with_result, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "subscription_id" => "subscription_id"}))
```

#### Example: Create

```elixir
account_updater_subscription_with_result = BluefinPayconex.account_updater_subscription_with_result(sdk)
record = BluefinPayconex.Entity.AccountUpdaterSubscriptionWithResult.create(account_updater_subscription_with_result, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
  "subscription_id" => "example_subscription_id",  # String.t()
}))
```


### AccountUpdaterUpdate

Create a handle: `account_updater_update = BluefinPayconex.account_updater_update(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `String.t()` |  |
| `format` | `String.t()` |  |
| `id` | `String.t()` |  |
| `new_expiry` | `String.t()` |  |
| `new_token` | `String.t()` |  |
| `old_expiry` | `String.t()` |  |
| `old_token` | `String.t()` |  |
| `recurring_schedule` | `list()` |  |
| `status` | `String.t()` |  |
| `update_id` | `String.t()` |  |
| `updated_at` | `String.t()` |  |

#### Example: Load

```elixir
account_updater_update = BluefinPayconex.account_updater_update(sdk)
record = BluefinPayconex.Entity.AccountUpdaterUpdate.load(account_updater_update, BluefinPayconex.Helpers.deep(%{"id" => "account_updater_update_id", "account_id" => "account_id"}))
```


### ApiKey

Create a handle: `api_key = BluefinPayconex.api_key(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `list()` |  |
| `enabled` | `boolean()` |  |
| `expires_at` | `String.t()` |  |
| `expires_in` | `String.t()` |  |
| `id` | `String.t()` |  |
| `label` | `String.t()` |  |
| `method` | `list()` |  |
| `scope` | `list()` |  |
| `secret` | `String.t()` |  |

#### Example: Load

```elixir
api_key = BluefinPayconex.api_key(sdk)
record = BluefinPayconex.Entity.ApiKey.load(api_key, BluefinPayconex.Helpers.deep(%{"id" => "api_key_id", "account_id" => "account_id"}))
```

#### Example: List

```elixir
api_key = BluefinPayconex.api_key(sdk)
records = BluefinPayconex.Entity.ApiKey.list(api_key)
```

#### Example: Create

```elixir
api_key = BluefinPayconex.api_key(sdk)
record = BluefinPayconex.Entity.ApiKey.create(api_key, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```


### ApplePayMerchantDetail

Create a handle: `apple_pay_merchant_detail = BluefinPayconex.apple_pay_merchant_detail(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `list()` |  |
| `merchant_url` | `String.t()` |  |
| `partner_merchant_name` | `String.t()` |  |
| `payconex_account_id` | `String.t()` |  |

#### Example: List

```elixir
apple_pay_merchant_detail = BluefinPayconex.apple_pay_merchant_detail(sdk)
records = BluefinPayconex.Entity.ApplePayMerchantDetail.list(apple_pay_merchant_detail)
```

#### Example: Create

```elixir
apple_pay_merchant_detail = BluefinPayconex.apple_pay_merchant_detail(sdk)
record = BluefinPayconex.Entity.ApplePayMerchantDetail.create(apple_pay_merchant_detail, BluefinPayconex.Helpers.deep(%{
  "account_id" => 1,  # integer()
}))
```


### ApplePaySession

Create a handle: `apple_pay_session = BluefinPayconex.apple_pay_session(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `String.t()` |  |
| `domain_name` | `String.t()` |  |
| `epoch_timestamp` | `integer()` |  |
| `expires_at` | `integer()` |  |
| `merchant_identifier` | `String.t()` |  |
| `merchant_session_identifier` | `String.t()` |  |
| `nonce` | `integer()` |  |
| `operational_analytics_identifier` | `String.t()` |  |
| `referrer` | `String.t()` |  |
| `retry` | `integer()` |  |
| `signature` | `String.t()` |  |

#### Example: Create

```elixir
apple_pay_session = BluefinPayconex.apple_pay_session(sdk)
record = BluefinPayconex.Entity.ApplePaySession.create(apple_pay_session, BluefinPayconex.Helpers.deep(%{
  "account_id" => 1,  # integer()
}))
```


### DynamicDescriptor

Create a handle: `dynamic_descriptor = BluefinPayconex.dynamic_descriptor(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `String.t()` |  |
| `descriptor` | `String.t()` |  |
| `id` | `String.t()` |  |
| `name` | `String.t()` |  |
| `state` | `String.t()` |  |

#### Example: Load

```elixir
dynamic_descriptor = BluefinPayconex.dynamic_descriptor(sdk)
record = BluefinPayconex.Entity.DynamicDescriptor.load(dynamic_descriptor, BluefinPayconex.Helpers.deep(%{"id" => "dynamic_descriptor_id", "account_id" => "account_id"}))
```

#### Example: List

```elixir
dynamic_descriptor = BluefinPayconex.dynamic_descriptor(sdk)
records = BluefinPayconex.Entity.DynamicDescriptor.list(dynamic_descriptor)
```

#### Example: Create

```elixir
dynamic_descriptor = BluefinPayconex.dynamic_descriptor(sdk)
record = BluefinPayconex.Entity.DynamicDescriptor.create(dynamic_descriptor, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```


### IFrameCreateInstance

Create a handle: `i_frame_create_instance = BluefinPayconex.i_frame_create_instance(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `String.t()` |  |
| `currency` | `String.t()` |  |
| `customer` | `map()` |  |
| `initialize_transaction` | `boolean()` |  |
| `label` | `String.t()` |  |
| `language` | `String.t()` |  |
| `reference` | `String.t()` |  |
| `timeout` | `float()` |  |
| `token` | `list()` |  |

#### Example: Create

```elixir
i_frame_create_instance = BluefinPayconex.i_frame_create_instance(sdk)
record = BluefinPayconex.Entity.IFrameCreateInstance.create(i_frame_create_instance, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
  "payment_iframe_id" => "example_payment_iframe_id",  # String.t()
}))
```


### IFrameInstance

Create a handle: `i_frame_instance = BluefinPayconex.i_frame_instance(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Example: Load

```elixir
i_frame_instance = BluefinPayconex.i_frame_instance(sdk)
record = BluefinPayconex.Entity.IFrameInstance.load(i_frame_instance, BluefinPayconex.Helpers.deep(%{"id" => "i_frame_instance_id", "account_id" => "account_id", "payment_iframe_id" => "payment_iframe_id"}))
```


### Iframe

Create a handle: `iframe = BluefinPayconex.iframe(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `map()` |  |
| `allowed_parent_domain` | `list()` |  |
| `allowed_payment_method` | `list()` |  |
| `card_setting` | `map()` |  |
| `click_to_pay_setting` | `map()` |  |
| `currency` | `String.t()` |  |
| `id` | `String.t()` |  |
| `label` | `String.t()` |  |
| `language` | `String.t()` |  |
| `timeout` | `float()` |  |

#### Example: Load

```elixir
iframe = BluefinPayconex.iframe(sdk)
record = BluefinPayconex.Entity.Iframe.load(iframe, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "iframe_id" => "iframe_id"}))
```

#### Example: List

```elixir
iframe = BluefinPayconex.iframe(sdk)
records = BluefinPayconex.Entity.Iframe.list(iframe)
```

#### Example: Create

```elixir
iframe = BluefinPayconex.iframe(sdk)
record = BluefinPayconex.Entity.Iframe.create(iframe, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```


### Init

Create a handle: `init = BluefinPayconex.init(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `map()` |  |
| `description` | `String.t()` |  |
| `item` | `list()` |  |
| `level2` | `map()` |  |
| `level3` | `map()` |  |
| `shipping_address` | `map()` |  |
| `trace` | `map()` |  |

#### Example: Create

```elixir
init = BluefinPayconex.init(sdk)
record = BluefinPayconex.Entity.Init.create(init, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```


### ListApiKeyScopesEntry

Create a handle: `list_api_key_scopes_entry = BluefinPayconex.list_api_key_scopes_entry(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `String.t()` |  |
| `description` | `String.t()` |  |
| `enabled` | `boolean()` |  |
| `level` | `integer()` |  |
| `scope` | `String.t()` |  |

#### Example: List

```elixir
list_api_key_scopes_entry = BluefinPayconex.list_api_key_scopes_entry(sdk)
records = BluefinPayconex.Entity.ListApiKeyScopesEntry.list(list_api_key_scopes_entry)
```


### PaymentIframe

Create a handle: `payment_iframe = BluefinPayconex.payment_iframe(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `remove(entity, match)` | Remove the matching entity. |


### ThreeDSecureAuth

Create a handle: `three_d_secure_auth = BluefinPayconex.three_d_secure_auth(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `map()` |  |
| `card` | `map()` |  |
| `challenge` | `map()` |  |
| `customer` | `map()` |  |
| `purchase` | `map()` |  |
| `server_transaction_id` | `String.t()` |  |
| `shipping` | `map()` |  |
| `status` | `String.t()` |  |
| `three_d_secure_challenge_indicator` | `String.t()` |  |
| `three_d_secure_id` | `String.t()` |  |
| `trace` | `map()` |  |

#### Example: Create

```elixir
three_d_secure_auth = BluefinPayconex.three_d_secure_auth(sdk)
record = BluefinPayconex.Entity.ThreeDSecureAuth.create(three_d_secure_auth, BluefinPayconex.Helpers.deep(%{
  "3_d_id" => "example_3_d_id",  # String.t()
  "account_id" => "example_account_id",  # String.t()
}))
```


### ThreeDSecureBrowserInit

Create a handle: `three_d_secure_browser_init = BluefinPayconex.three_d_secure_browser_init(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `String.t()` |  |
| `acs_url` | `String.t()` |  |
| `cvv` | `String.t()` |  |
| `expiry` | `String.t()` |  |
| `pan` | `String.t()` |  |
| `payment_details_reference` | `String.t()` |  |
| `server_transaction_id` | `String.t()` |  |
| `status` | `String.t()` |  |
| `three_d_secure_data` | `String.t()` |  |
| `three_d_secure_id` | `String.t()` |  |

#### Example: Create

```elixir
three_d_secure_browser_init = BluefinPayconex.three_d_secure_browser_init(sdk)
record = BluefinPayconex.Entity.ThreeDSecureBrowserInit.create(three_d_secure_browser_init, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
```


### ThreeDSecureStatus

Create a handle: `three_d_secure_status = BluefinPayconex.three_d_secure_status(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `map()` |  |
| `info` | `map()` |  |
| `server_transaction_id` | `String.t()` |  |
| `status` | `String.t()` |  |
| `three_d_secure` | `map()` |  |
| `three_d_secure_id` | `String.t()` |  |

#### Example: Load

```elixir
three_d_secure_status = BluefinPayconex.three_d_secure_status(sdk)
record = BluefinPayconex.Entity.ThreeDSecureStatus.load(three_d_secure_status, BluefinPayconex.Helpers.deep(%{"3_d_id" => "3_d_id", "account_id" => "account_id"}))
```


### TransactionDetail

Create a handle: `transaction_detail = BluefinPayconex.transaction_detail(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `map()` |  |
| `auth` | `map()` |  |
| `card` | `map()` |  |
| `customer` | `map()` |  |
| `description` | `String.t()` |  |
| `id` | `String.t()` |  |
| `item` | `list()` |  |
| `level2` | `map()` |  |
| `level3` | `map()` |  |
| `override` | `map()` |  |
| `shipping_address` | `map()` |  |
| `status` | `String.t()` |  |
| `timestamp` | `String.t()` |  |
| `trace` | `map()` |  |

#### Example: Load

```elixir
transaction_detail = BluefinPayconex.transaction_detail(sdk)
record = BluefinPayconex.Entity.TransactionDetail.load(transaction_detail, BluefinPayconex.Helpers.deep(%{"account_id" => "account_id", "transaction_id" => "transaction_id"}))
```


### Webhook

Create a handle: `webhook = BluefinPayconex.webhook(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `String.t()` |  |
| `id` | `String.t()` |  |
| `url` | `String.t()` |  |

#### Example: Load

```elixir
webhook = BluefinPayconex.webhook(sdk)
record = BluefinPayconex.Entity.Webhook.load(webhook, BluefinPayconex.Helpers.deep(%{"id" => "webhook_id", "account_id" => "account_id"}))
```

#### Example: List

```elixir
webhook = BluefinPayconex.webhook(sdk)
records = BluefinPayconex.Entity.Webhook.list(webhook)
```

#### Example: Create

```elixir
webhook = BluefinPayconex.webhook(sdk)
record = BluefinPayconex.Entity.Webhook.create(webhook, BluefinPayconex.Helpers.deep(%{
  "account_id" => "example_account_id",  # String.t()
}))
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

### Data as struct value nodes

The Elixir SDK models every runtime object — clients, contexts, results and
record data — as reference-stable struct value nodes from the vendored
`Voxgig.Struct` library rather than as compile-time structs. This mirrors
the dynamic nature of the API and lets a feature hook mutate a shared node
that every later pipeline stage observes — the immutable-Elixir way to honour
the shared-mutable hook contract.

Build inputs from native Elixir maps with `BluefinPayconex.Helpers.deep/1`,
and read fields off results with `Voxgig.Struct.getprop/2`.

### Module structure

```
elixir/
├── lib/
│   ├── bluefin-payconex.ex                 -- Main SDK module (entity factories)
│   ├── config.ex                 -- Resolved configuration
│   ├── features.ex               -- Feature factory
│   ├── pipeline.ex               -- Operation pipeline
│   └── bluefin-payconex/
│       ├── context.ex            -- Operation context
│       ├── entity_base.ex        -- Shared entity behaviour
│       ├── error.ex              -- SDK error type
│       ├── feature.ex            -- Built-in features
│       ├── helpers.ex            -- Value helpers (deep/1, ...)
│       ├── json.ex               -- JSON encode/decode
│       └── utility.ex            -- Utility functions
│   └── entity/                   -- Per-entity modules
├── mix.exs                       -- Package manifest
└── test/                         -- ExUnit suites
```

The main module `BluefinPayconex` exposes the SDK constructors and one entity
factory function per entity. Call an operation on the matching
`BluefinPayconex.Entity.<Name>` module.

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
