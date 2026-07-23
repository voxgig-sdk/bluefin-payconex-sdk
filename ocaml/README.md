# BluefinPayconex OCaml SDK



The OCaml SDK for the BluefinPayconex API — an entity-oriented client
following idiomatic OCaml conventions (a dependency-free library that compiles
with the stock `ocamlc`).

The SDK exposes the API as capitalised, semantic **Entities** — for example `Sdk_client.account_updater client Noval` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to the opam registry. Install it from the
GitHub release tag (`ocaml/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases))
or from a source checkout. The SDK is dependency-free and compiles with the
stock `ocamlc` — no opam packages, no dune:

```bash
cd ocaml && make build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make (jo [("apikey", Str (Sys.getenv "BLUEFIN_PAYCONEX_APIKEY"))])
```

### 3. Load an account_updater_subscription_with_result

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`e_load` returns the bare record (a `Map`) and raises on error.

```ocaml
(try
   let account_updater_subscription_with_result = (Sdk_client.account_updater_subscription_with_result client Noval).e_load (jo [("account_id", (Str "example_account_id")); ("subscription_id", (Str "example_subscription_id"))]) Noval in
   print_endline (stringify account_updater_subscription_with_result)
 with Sdk_error.E err -> Printf.eprintf "load failed: %s\n" (Sdk_error.message err))
```

### 4. Create, update, and remove

```ocaml
(* Remove *)
ignore ((Sdk_client.account_updater client Noval).e_remove (jo [("account_id", (Str "example_account_id")); ("subscription_id", (Str "example_subscription_id"))]) Noval)
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

```ocaml
let result = Sdk_client.direct client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "GET");
    ("params", jo [("id", Str "example")]);
]) in
(match getp result "ok" with
 | Bool true ->
   print_endline (stringify (getp result "status"));  (* 200 *)
   print_endline (stringify (getp result "data"))      (* response body *)
 | _ ->
   (* A non-2xx response carries status + data (the error body); a transport
      failure carries err instead. Read whichever is present. *)
   print_endline (stringify (getp result "status"));
   print_endline (stringify (getp result "err")))
```

### Prepare a request without sending it

```ocaml
(* prepare returns the fetch definition and raises on error. *)
let fetchdef = Sdk_client.prepare client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "DELETE");
    ("params", jo [("id", Str "example")]);
]) in
print_endline (stringify (getp fetchdef "url"));
print_endline (stringify (getp fetchdef "method"));
print_endline (stringify (getp fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```ocaml
let () =
  let client = Sdk_client.test () in
  (* Entity ops return the bare record and raise on error. *)
  let three_d_secure_status = (Sdk_client.three_d_secure_status client Noval).e_load (empty_map ()) Noval in
  print_endline (stringify three_d_secure_status)  (* the mock response record *)
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ocaml
let mock_fetch = Func (fun _ _args _ _ ->
    jo [("status", Num 200.); ("statusText", Str "OK"); ("headers", empty_map ());
        ("json", json_thunk (jo [("id", Str "mock01")]))]) in
let client = Sdk_client.make (jo [
    ("base", Str "http://localhost:8080");
    ("system", jo [("fetch", mock_fetch)]);
]) in
ignore client
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd ocaml && make test
```


## Reference

### Sdk_client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Creates a new SDK client from a `value` options map. Use `Sdk_client.make0 ()`
for defaults.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `list` | Additional feature instances to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` function). |

### Sdk_client.test

```ocaml
let client = Sdk_client.test_with testopts sdkopts
```

Creates a test-mode client with mock transport. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults).

### Sdk_client functions

| Function | Signature | Description |
| --- | --- | --- |
| `make` | `value -> sdk_client` | Construct a client from options. |
| `make0` | `unit -> sdk_client` | Construct a client with defaults. |
| `prepare` | `sdk_client -> value -> value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `sdk_client -> value -> value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `account_updater` | `sdk_client -> value -> entity_obj` | An AccountUpdater entity accessor. |
| `account_updater_schedule` | `sdk_client -> value -> entity_obj` | An AccountUpdaterSchedule entity accessor. |
| `account_updater_schedule_with_result` | `sdk_client -> value -> entity_obj` | An AccountUpdaterScheduleWithResult entity accessor. |
| `account_updater_subscription_with_result` | `sdk_client -> value -> entity_obj` | An AccountUpdaterSubscriptionWithResult entity accessor. |
| `account_updater_update` | `sdk_client -> value -> entity_obj` | An AccountUpdaterUpdate entity accessor. |
| `api_key` | `sdk_client -> value -> entity_obj` | An ApiKey entity accessor. |
| `apple_pay_merchant_detail` | `sdk_client -> value -> entity_obj` | An ApplePayMerchantDetail entity accessor. |
| `apple_pay_session` | `sdk_client -> value -> entity_obj` | An ApplePaySession entity accessor. |
| `dynamic_descriptor` | `sdk_client -> value -> entity_obj` | A DynamicDescriptor entity accessor. |
| `i_frame_create_instance` | `sdk_client -> value -> entity_obj` | An IFrameCreateInstance entity accessor. |
| `i_frame_instance` | `sdk_client -> value -> entity_obj` | An IFrameInstance entity accessor. |
| `iframe` | `sdk_client -> value -> entity_obj` | An Iframe entity accessor. |
| `init` | `sdk_client -> value -> entity_obj` | An Init entity accessor. |
| `list_api_key_scopes_entry` | `sdk_client -> value -> entity_obj` | A ListApiKeyScopesEntry entity accessor. |
| `payment_iframe` | `sdk_client -> value -> entity_obj` | A PaymentIframe entity accessor. |
| `three_d_secure_auth` | `sdk_client -> value -> entity_obj` | A ThreeDSecureAuth entity accessor. |
| `three_d_secure_browser_init` | `sdk_client -> value -> entity_obj` | A ThreeDSecureBrowserInit entity accessor. |
| `three_d_secure_status` | `sdk_client -> value -> entity_obj` | A ThreeDSecureStatus entity accessor. |
| `transaction_detail` | `sdk_client -> value -> entity_obj` | A TransactionDetail entity accessor. |
| `webhook` | `sdk_client -> value -> entity_obj` | A Webhook entity accessor. |

### Entity interface

All entities are `entity_obj` records sharing the same fields.

| Field | Signature | Description |
| --- | --- | --- |
| `e_load` | `value -> value -> value` | Load a single entity by match criteria. Raises on error. |
| `e_list` | `value -> value -> value` | List entities matching the criteria (returns a List). Raises on error. |
| `e_create` | `value -> value -> value` | Create a new entity. Raises on error. |
| `e_update` | `value -> value -> value` | Update an existing entity. Raises on error. |
| `e_remove` | `value -> value -> value` | Remove an entity. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations return the bare result value (a `Map` for single-entity
ops, a `List` for `e_list`) and raise `Sdk_error.E` on error. Wrap calls
in `try`/`with` to handle failures.

The `direct` escape hatch never raises — it returns a result `value` map
you branch on via `getp result "ok"`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `Bool true` if the HTTP status is 2xx. |
| `status` | `Num` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `value` | Parsed JSON response body. |

On error, `ok` is `Bool false` and `err` carries the error value.

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

Create an instance: `let account_updater = Sdk_client.account_updater client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_remove reqmatch ctrl` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `let account_updater_schedule = Sdk_client.account_updater_schedule client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `value list` |  |

#### Example: Create

```ocaml
let account_updater_schedule = (Sdk_client.account_updater_schedule client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### AccountUpdaterScheduleWithResult

Create an instance: `let account_updater_schedule_with_result = Sdk_client.account_updater_schedule_with_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `value list` |  |
| `created_at` | `string` |  |
| `enabled` | `bool` |  |
| `expiry` | `string` |  |
| `id` | `string` |  |
| `most_recent_update` | `value map` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `value list` |  |
| `type` | `string` |  |
| `updated_at` | `string` |  |

#### Example: List

```ocaml
let account_updater_schedule_with_results = (Sdk_client.account_updater_schedule_with_result client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let account_updater_schedule_with_result = (Sdk_client.account_updater_schedule_with_result client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `let account_updater_subscription_with_result = Sdk_client.account_updater_subscription_with_result client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `string` |  |
| `enabled` | `bool` |  |
| `id` | `string` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `record` | `value list` |  |
| `response_format` | `string` |  |
| `template_ref` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```ocaml
let account_updater_subscription_with_result = (Sdk_client.account_updater_subscription_with_result client Noval).e_load (jo [("account_id", (Str "account_id")); ("subscription_id", (Str "subscription_id"))]) Noval
```

#### Example: Create

```ocaml
let account_updater_subscription_with_result = (Sdk_client.account_updater_subscription_with_result client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
    ("subscription_id", (Str "example_subscription_id"));  (* string *)
]) Noval
```


### AccountUpdaterUpdate

Create an instance: `let account_updater_update = Sdk_client.account_updater_update client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

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
| `recurring_schedule` | `value list` |  |
| `status` | `string` |  |
| `update_id` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```ocaml
let account_updater_update = (Sdk_client.account_updater_update client Noval).e_load (jo [("id", (Str "account_updater_update_id")); ("account_id", (Str "account_id"))]) Noval
```


### ApiKey

Create an instance: `let api_key = Sdk_client.api_key client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `value list` |  |
| `enabled` | `bool` |  |
| `expires_at` | `string` |  |
| `expires_in` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `method` | `value list` |  |
| `scope` | `value list` |  |
| `secret` | `string` |  |

#### Example: Load

```ocaml
let api_key = (Sdk_client.api_key client Noval).e_load (jo [("id", (Str "api_key_id")); ("account_id", (Str "account_id"))]) Noval
```

#### Example: List

```ocaml
let api_keys = (Sdk_client.api_key client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let api_key = (Sdk_client.api_key client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### ApplePayMerchantDetail

Create an instance: `let apple_pay_merchant_detail = Sdk_client.apple_pay_merchant_detail client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `value list` |  |
| `merchant_url` | `string` |  |
| `partner_merchant_name` | `string` |  |
| `payconex_account_id` | `string` |  |

#### Example: List

```ocaml
let apple_pay_merchant_details = (Sdk_client.apple_pay_merchant_detail client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let apple_pay_merchant_detail = (Sdk_client.apple_pay_merchant_detail client Noval).e_create (jo [
    ("account_id", (Num 1.));  (* int *)
]) Noval
```


### ApplePaySession

Create an instance: `let apple_pay_session = Sdk_client.apple_pay_session client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `string` |  |
| `domain_name` | `string` |  |
| `epoch_timestamp` | `int` |  |
| `expires_at` | `int` |  |
| `merchant_identifier` | `string` |  |
| `merchant_session_identifier` | `string` |  |
| `nonce` | `int` |  |
| `operational_analytics_identifier` | `string` |  |
| `referrer` | `string` |  |
| `retry` | `int` |  |
| `signature` | `string` |  |

#### Example: Create

```ocaml
let apple_pay_session = (Sdk_client.apple_pay_session client Noval).e_create (jo [
    ("account_id", (Num 1.));  (* int *)
]) Noval
```


### DynamicDescriptor

Create an instance: `let dynamic_descriptor = Sdk_client.dynamic_descriptor client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `string` |  |
| `descriptor` | `string` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `state` | `string` |  |

#### Example: Load

```ocaml
let dynamic_descriptor = (Sdk_client.dynamic_descriptor client Noval).e_load (jo [("id", (Str "dynamic_descriptor_id")); ("account_id", (Str "account_id"))]) Noval
```

#### Example: List

```ocaml
let dynamic_descriptors = (Sdk_client.dynamic_descriptor client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let dynamic_descriptor = (Sdk_client.dynamic_descriptor client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### IFrameCreateInstance

Create an instance: `let i_frame_create_instance = Sdk_client.i_frame_create_instance client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `string` |  |
| `currency` | `string` |  |
| `customer` | `value map` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `reference` | `string` |  |
| `timeout` | `float` |  |
| `token` | `value list` |  |

#### Example: Create

```ocaml
let i_frame_create_instance = (Sdk_client.i_frame_create_instance client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
    ("payment_iframe_id", (Str "example_payment_iframe_id"));  (* string *)
]) Noval
```


### IFrameInstance

Create an instance: `let i_frame_instance = Sdk_client.i_frame_instance client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Example: Load

```ocaml
let i_frame_instance = (Sdk_client.i_frame_instance client Noval).e_load (jo [("id", (Str "i_frame_instance_id")); ("account_id", (Str "account_id")); ("payment_iframe_id", (Str "payment_iframe_id"))]) Noval
```


### Iframe

Create an instance: `let iframe = Sdk_client.iframe client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `value map` |  |
| `allowed_parent_domain` | `value list` |  |
| `allowed_payment_method` | `value list` |  |
| `card_setting` | `value map` |  |
| `click_to_pay_setting` | `value map` |  |
| `currency` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `timeout` | `float` |  |

#### Example: Load

```ocaml
let iframe = (Sdk_client.iframe client Noval).e_load (jo [("account_id", (Str "account_id")); ("iframe_id", (Str "iframe_id"))]) Noval
```

#### Example: List

```ocaml
let iframes = (Sdk_client.iframe client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let iframe = (Sdk_client.iframe client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### Init

Create an instance: `let init = Sdk_client.init client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `value map` |  |
| `description` | `string` |  |
| `item` | `value list` |  |
| `level2` | `value map` |  |
| `level3` | `value map` |  |
| `shipping_address` | `value map` |  |
| `trace` | `value map` |  |

#### Example: Create

```ocaml
let init = (Sdk_client.init client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### ListApiKeyScopesEntry

Create an instance: `let list_api_key_scopes_entry = Sdk_client.list_api_key_scopes_entry client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `string` |  |
| `description` | `string` |  |
| `enabled` | `bool` |  |
| `level` | `int` |  |
| `scope` | `string` |  |

#### Example: List

```ocaml
let list_api_key_scopes_entrys = (Sdk_client.list_api_key_scopes_entry client Noval).e_list (empty_map ()) Noval
```


### PaymentIframe

Create an instance: `let payment_iframe = Sdk_client.payment_iframe client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_remove reqmatch ctrl` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `let three_d_secure_auth = Sdk_client.three_d_secure_auth client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `value map` |  |
| `card` | `value map` |  |
| `challenge` | `value map` |  |
| `customer` | `value map` |  |
| `purchase` | `value map` |  |
| `server_transaction_id` | `string` |  |
| `shipping` | `value map` |  |
| `status` | `string` |  |
| `three_d_secure_challenge_indicator` | `string` |  |
| `three_d_secure_id` | `string` |  |
| `trace` | `value map` |  |

#### Example: Create

```ocaml
let three_d_secure_auth = (Sdk_client.three_d_secure_auth client Noval).e_create (jo [
    ("3_d_id", (Str "example_3_d_id"));  (* string *)
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### ThreeDSecureBrowserInit

Create an instance: `let three_d_secure_browser_init = Sdk_client.three_d_secure_browser_init client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |

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

```ocaml
let three_d_secure_browser_init = (Sdk_client.three_d_secure_browser_init client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```


### ThreeDSecureStatus

Create an instance: `let three_d_secure_status = Sdk_client.three_d_secure_status client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `value map` |  |
| `info` | `value map` |  |
| `server_transaction_id` | `string` |  |
| `status` | `string` |  |
| `three_d_secure` | `value map` |  |
| `three_d_secure_id` | `string` |  |

#### Example: Load

```ocaml
let three_d_secure_status = (Sdk_client.three_d_secure_status client Noval).e_load (jo [("3_d_id", (Str "3_d_id")); ("account_id", (Str "account_id"))]) Noval
```


### TransactionDetail

Create an instance: `let transaction_detail = Sdk_client.transaction_detail client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `value map` |  |
| `auth` | `value map` |  |
| `card` | `value map` |  |
| `customer` | `value map` |  |
| `description` | `string` |  |
| `id` | `string` |  |
| `item` | `value list` |  |
| `level2` | `value map` |  |
| `level3` | `value map` |  |
| `override` | `value map` |  |
| `shipping_address` | `value map` |  |
| `status` | `string` |  |
| `timestamp` | `string` |  |
| `trace` | `value map` |  |

#### Example: Load

```ocaml
let transaction_detail = (Sdk_client.transaction_detail client Noval).e_load (jo [("account_id", (Str "account_id")); ("transaction_id", (Str "transaction_id"))]) Noval
```


### Webhook

Create an instance: `let webhook = Sdk_client.webhook client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. |
| `e_list reqmatch ctrl` | List entities, optionally matching the given criteria. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. |
| `e_remove reqmatch ctrl` | Remove the matching entity. |
| `e_update reqdata ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `string` |  |
| `id` | `string` |  |
| `url` | `string` |  |

#### Example: Load

```ocaml
let webhook = (Sdk_client.webhook client Noval).e_load (jo [("id", (Str "webhook_id")); ("account_id", (Str "account_id"))]) Noval
```

#### Example: List

```ocaml
let webhooks = (Sdk_client.webhook client Noval).e_list (empty_map ()) Noval
```

#### Example: Create

```ocaml
let webhook = (Sdk_client.webhook client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
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

### Data as `value`

The OCaml SDK uses a single dynamic `value` type throughout rather than a
typed record per entity. `value` is the vendored voxgig struct port (a
JSON-shaped variant: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Module structure

```
ocaml/
├── sdk_client.ml               -- Main SDK client (constructors + accessors)
├── sdk_config.ml               -- Embedded API config + feature factory
├── sdk_error.ml                -- Branded error re-exports
├── sdk_entity_*.ml             -- Per-entity implementations (one each)
├── sdk_types.ml                -- Core pipeline types
├── sdk_helpers.ml              -- jo / ja / getp and friends
├── sdk_runtime.ml              -- Operation pipeline runner
├── sdk_features.ml             -- Built-in features (base, test, log)
├── utility/                    -- Vendored voxgig struct port
└── test/                       -- Test suites
```

The public surface lives in `Sdk_client` (the constructors and per-entity
accessors); `Sdk_helpers` carries the `jo` / `ja` / `getp` value
helpers. Open the runtime modules directly only when needed.

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
