# BluefinPayconex OCaml SDK Reference

Complete API reference for the BluefinPayconex OCaml SDK.


## Sdk_client

### Constructor

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Create a new SDK client instance from a `value` options map. Use
`Sdk_client.make0 ()` for defaults.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `value` | SDK configuration options (a Map). |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Static constructors

#### `Sdk_client.test testopts sdkopts`

Create a test client with mock features active. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults, `Sdk_client.test_with` takes explicit
options).

```ocaml
let client = Sdk_client.test ()
```


### Instance functions

#### `Sdk_client.account_updater client entopts : entity_obj`

Create a `AccountUpdater` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.account_updater_schedule client entopts : entity_obj`

Create a `AccountUpdaterSchedule` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.account_updater_schedule_with_result client entopts : entity_obj`

Create a `AccountUpdaterScheduleWithResult` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.account_updater_subscription_with_result client entopts : entity_obj`

Create a `AccountUpdaterSubscriptionWithResult` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.account_updater_update client entopts : entity_obj`

Create a `AccountUpdaterUpdate` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.api_key client entopts : entity_obj`

Create a `ApiKey` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.apple_pay_merchant_detail client entopts : entity_obj`

Create a `ApplePayMerchantDetail` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.apple_pay_session client entopts : entity_obj`

Create a `ApplePaySession` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.dynamic_descriptor client entopts : entity_obj`

Create a `DynamicDescriptor` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.i_frame_create_instance client entopts : entity_obj`

Create a `IFrameCreateInstance` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.i_frame_instance client entopts : entity_obj`

Create a `IFrameInstance` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.iframe client entopts : entity_obj`

Create a `Iframe` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.init client entopts : entity_obj`

Create a `Init` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.list_api_key_scopes_entry client entopts : entity_obj`

Create a `ListApiKeyScopesEntry` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.payment_iframe client entopts : entity_obj`

Create a `PaymentIframe` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.three_d_secure_auth client entopts : entity_obj`

Create a `ThreeDSecureAuth` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.three_d_secure_browser_init client entopts : entity_obj`

Create a `ThreeDSecureBrowserInit` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.three_d_secure_status client entopts : entity_obj`

Create a `ThreeDSecureStatus` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.transaction_detail client entopts : entity_obj`

Create a `TransactionDetail` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.webhook client entopts : entity_obj`

Create a `Webhook` entity accessor. Pass `Noval` for no initial options.

#### `Sdk_client.direct client fetchargs : value`

Make a direct HTTP request to any API endpoint. Returns a result `value` map
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch never raises — branch on `getp result "ok"`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `value` | Request body (Maps are JSON-serialized). |

**Returns:** a result `value` map.

#### `Sdk_client.prepare client fetchargs : value`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## AccountUpdater

```ocaml
let account_updater = Sdk_client.account_updater client Noval
```

### Operations

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.account_updater client Noval).e_remove (jo [("account_id", (Str "account_id")); ("subscription_id", (Str "subscription_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `AccountUpdater` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## AccountUpdaterSchedule

```ocaml
let account_updater_schedule = Sdk_client.account_updater_schedule client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `value list` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.account_updater_schedule client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `AccountUpdaterSchedule` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## AccountUpdaterScheduleWithResult

```ocaml
let account_updater_schedule_with_result = Sdk_client.account_updater_schedule_with_result client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `value list` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `value map` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `value list` | Yes |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.account_updater_schedule_with_result client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.account_updater_schedule_with_result client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `AccountUpdaterScheduleWithResult` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## AccountUpdaterSubscriptionWithResult

```ocaml
let account_updater_subscription_with_result = Sdk_client.account_updater_subscription_with_result client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `value list` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.account_updater_subscription_with_result client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
    ("subscription_id", (Str "example_subscription_id"));  (* string *)
]) Noval
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.account_updater_subscription_with_result client Noval).e_load (jo [("account_id", (Str "account_id")); ("subscription_id", (Str "subscription_id"))]) Noval
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.account_updater_subscription_with_result client Noval).e_update (jo [
    ("account_id", (Str "account_id"));
    ("subscription_id", (Str "subscription_id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `AccountUpdaterSubscriptionWithResult` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## AccountUpdaterUpdate

```ocaml
let account_updater_update = Sdk_client.account_updater_update client Noval
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
| `recurring_schedule` | `value list` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.account_updater_update client Noval).e_load (jo [("id", (Str "account_updater_update_id")); ("account_id", (Str "account_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `AccountUpdaterUpdate` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## ApiKey

```ocaml
let api_key = Sdk_client.api_key client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `value list` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `value list` | No |  |
| `scope` | `value list` | No |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.api_key client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.api_key client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.api_key client Noval).e_load (jo [("id", (Str "api_key_id")); ("account_id", (Str "account_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.api_key client Noval).e_remove (jo [("id", (Str "api_key_id")); ("account_id", (Str "account_id"))]) Noval
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.api_key client Noval).e_update (jo [
    ("id", (Str "api_key_id"));
    ("account_id", (Str "account_id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `ApiKey` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## ApplePayMerchantDetail

```ocaml
let apple_pay_merchant_detail = Sdk_client.apple_pay_merchant_detail client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `value list` | Yes |  |
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.apple_pay_merchant_detail client Noval).e_create (jo [
    ("account_id", (Num 1.));  (* int *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.apple_pay_merchant_detail client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `ApplePayMerchantDetail` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## ApplePaySession

```ocaml
let apple_pay_session = Sdk_client.apple_pay_session client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `string` | No |  |
| `domain_name` | `string` | No |  |
| `epoch_timestamp` | `int` | No |  |
| `expires_at` | `int` | No |  |
| `merchant_identifier` | `string` | No |  |
| `merchant_session_identifier` | `string` | No |  |
| `nonce` | `int` | No |  |
| `operational_analytics_identifier` | `string` | No |  |
| `referrer` | `string` | Yes |  |
| `retry` | `int` | No |  |
| `signature` | `string` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.apple_pay_session client Noval).e_create (jo [
    ("account_id", (Num 1.));  (* int *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `ApplePaySession` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## DynamicDescriptor

```ocaml
let dynamic_descriptor = Sdk_client.dynamic_descriptor client Noval
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.dynamic_descriptor client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.dynamic_descriptor client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.dynamic_descriptor client Noval).e_load (jo [("id", (Str "dynamic_descriptor_id")); ("account_id", (Str "account_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.dynamic_descriptor client Noval).e_remove (jo [("id", (Str "dynamic_descriptor_id")); ("account_id", (Str "account_id"))]) Noval
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.dynamic_descriptor client Noval).e_update (jo [
    ("id", (Str "dynamic_descriptor_id"));
    ("account_id", (Str "account_id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `DynamicDescriptor` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## IFrameCreateInstance

```ocaml
let i_frame_create_instance = Sdk_client.i_frame_create_instance client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `value map` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `float` | No |  |
| `token` | `value list` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.i_frame_create_instance client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
    ("payment_iframe_id", (Str "example_payment_iframe_id"));  (* string *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `IFrameCreateInstance` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## IFrameInstance

```ocaml
let i_frame_instance = Sdk_client.i_frame_instance client Noval
```

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.i_frame_instance client Noval).e_load (jo [("id", (Str "i_frame_instance_id")); ("account_id", (Str "account_id")); ("payment_iframe_id", (Str "payment_iframe_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `IFrameInstance` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Iframe

```ocaml
let iframe = Sdk_client.iframe client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `value map` | No |  |
| `allowed_parent_domain` | `value list` | Yes |  |
| `allowed_payment_method` | `value list` | Yes |  |
| `card_setting` | `value map` | No |  |
| `click_to_pay_setting` | `value map` | No |  |
| `currency` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `timeout` | `float` | No |  |

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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.iframe client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.iframe client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.iframe client Noval).e_load (jo [("account_id", (Str "account_id")); ("iframe_id", (Str "iframe_id"))]) Noval
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.iframe client Noval).e_update (jo [
    ("account_id", (Str "account_id"));
    ("iframe_id", (Str "iframe_id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Iframe` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Init

```ocaml
let init = Sdk_client.init client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `value map` | No |  |
| `description` | `string` | No |  |
| `item` | `value list` | No |  |
| `level2` | `value map` | No |  |
| `level3` | `value map` | No |  |
| `shipping_address` | `value map` | Yes |  |
| `trace` | `value map` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.init client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Init` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## ListApiKeyScopesEntry

```ocaml
let list_api_key_scopes_entry = Sdk_client.list_api_key_scopes_entry client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `description` | `string` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `int` | No |  |
| `scope` | `string` | No |  |

### Operations

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.list_api_key_scopes_entry client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `ListApiKeyScopesEntry` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## PaymentIframe

```ocaml
let payment_iframe = Sdk_client.payment_iframe client Noval
```

### Operations

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.payment_iframe client Noval).e_remove (jo [("account_id", (Str "account_id")); ("id", (Str "id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `PaymentIframe` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## ThreeDSecureAuth

```ocaml
let three_d_secure_auth = Sdk_client.three_d_secure_auth client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `value map` | Yes |  |
| `card` | `value map` | Yes |  |
| `challenge` | `value map` | No |  |
| `customer` | `value map` | No |  |
| `purchase` | `value map` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `value map` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `value map` | No |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.three_d_secure_auth client Noval).e_create (jo [
    ("3_d_id", (Str "example_3_d_id"));  (* string *)
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `ThreeDSecureAuth` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## ThreeDSecureBrowserInit

```ocaml
let three_d_secure_browser_init = Sdk_client.three_d_secure_browser_init client Noval
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

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.three_d_secure_browser_init client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `ThreeDSecureBrowserInit` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## ThreeDSecureStatus

```ocaml
let three_d_secure_status = Sdk_client.three_d_secure_status client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `value map` | No |  |
| `info` | `value map` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `value map` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.three_d_secure_status client Noval).e_load (jo [("3_d_id", (Str "3_d_id")); ("account_id", (Str "account_id"))]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `ThreeDSecureStatus` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## TransactionDetail

```ocaml
let transaction_detail = Sdk_client.transaction_detail client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `value map` | Yes |  |
| `auth` | `value map` | Yes |  |
| `card` | `value map` | No |  |
| `customer` | `value map` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `value list` | No |  |
| `level2` | `value map` | No |  |
| `level3` | `value map` | No |  |
| `override` | `value map` | No |  |
| `shipping_address` | `value map` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `value map` | No |  |

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

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.transaction_detail client Noval).e_load (jo [("account_id", (Str "account_id")); ("transaction_id", (Str "transaction_id"))]) Noval
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.transaction_detail client Noval).e_update (jo [
    ("account_id", (Str "account_id"));
    ("transaction_id", (Str "transaction_id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `TransactionDetail` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Webhook

```ocaml
let webhook = Sdk_client.webhook client Noval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `e_create reqdata ctrl : value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```ocaml
let result = (Sdk_client.webhook client Noval).e_create (jo [
    ("account_id", (Str "example_account_id"));  (* string *)
]) Noval
```

#### `e_list reqmatch ctrl : value`

List entities matching the given criteria. The match is optional — pass `(empty_map ())` to list all records. Returns a List and raises on error.

```ocaml
let results = (Sdk_client.webhook client Noval).e_list (empty_map ()) Noval in
(match results with
 | List items -> List.iter (fun r -> print_endline (stringify r)) !items
 | _ -> ())
```

#### `e_load reqmatch ctrl : value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```ocaml
let result = (Sdk_client.webhook client Noval).e_load (jo [("id", (Str "webhook_id")); ("account_id", (Str "account_id"))]) Noval
```

#### `e_remove reqmatch ctrl : value`

Remove the entity matching the given criteria. Raises on error.

```ocaml
let result = (Sdk_client.webhook client Noval).e_remove (jo [("id", (Str "webhook_id")); ("account_id", (Str "account_id"))]) Noval
```

#### `e_update reqdata ctrl : value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```ocaml
let result = (Sdk_client.webhook client Noval).e_update (jo [
    ("id", (Str "webhook_id"));
    ("account_id", (Str "account_id"));
    (* Fields to update *)
]) Noval
```

### Common Fields

#### `e_data_get : unit -> value`

Get the entity data.

#### `e_data_set : value -> unit`

Set the entity data.

#### `e_match_get : unit -> value`

Get the entity match criteria.

#### `e_match_set : value -> unit`

Set the entity match criteria.

#### `e_make : unit -> entity_obj`

Create a new `Webhook` entity accessor with the same options.

#### `e_name : string`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ocaml
let client = Sdk_client.make (jo [
    ("feature", jo [
        ("test", jo [("active", Bool true)]);
    ]);
])
```

