# BluefinPayconex C SDK



The C SDK for the BluefinPayconex API — an entity-oriented client following idiomatic C conventions (explicit structs, function-pointer vtables, and a trailing `PNError**` out-param for errors).

The SDK exposes the API as capitalised, semantic **Entities** — for example `bluefin_payconex_account_updater(client, NULL)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
C has no central package registry — a release is the git tag
(`c/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)). Build from a
source checkout with the bundled `Makefile`; the voxgig struct library is
vendored under `utility/struct`, so there are no external dependencies to
fetch:

```bash
cd c && make          # builds libsdk.a
cd c && make test     # builds + runs the test binaries
```

Link your program against `libsdk.a` and include `core/api.h`:

```bash
cc -I c/core -I c/utility/struct \
   myapp.c c/libsdk.a -lm -o myapp
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```c
#include "core/api.h"

BluefinPayconexSDK* client = bluefin_payconex_sdk_new(cmap(1,
    "apikey", v_str(getenv("BLUEFIN_PAYCONEX_APIKEY"))));
PNError* err = NULL;
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record and sets `*err` on failure.

```c
Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);
voxgig_value* account_updater_subscription_with_result_rec = account_updater_subscription_with_result->vt->load(account_updater_subscription_with_result, cmap(2, "account_id", v_str("example_account_id"), "subscription_id", v_str("example_subscription_id")), NULL, &err);
if (err) {
    fprintf(stderr, "load failed: %s\n", err->msg);
} else {
    printf("%s\n", voxgig_to_json(account_updater_subscription_with_result_rec));
}
```

### 4. Create, update, and remove

```c
Entity* account_updater = bluefin_payconex_account_updater(client, NULL);
// Remove
account_updater->vt->remove(account_updater, cmap(2, "account_id", v_str("example_account_id"), "subscription_id", v_str("example_subscription_id")), NULL, &err);
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

For endpoints not covered by entity operations:

```c
PNError* err = NULL;
voxgig_value* result = sdk_direct(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("GET"),
    "params", cmap(1, "id", v_str("example"))), &err);

if (voxgig_as_bool(getp(result, "ok"))) {
    printf("%lld\n", (long long)to_int(getp(result, "status")));  // 200
    printf("%s\n", voxgig_to_json(getp(result, "data")));         // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    printf("%s\n", voxgig_to_json(getp(result, "err")));
}
```

`sdk_direct()` never sets `*err` for a non-2xx response — it always returns
a result map you branch on via `getp(result, "ok")`.

### Prepare a request without sending it

```c
PNError* err = NULL;
voxgig_value* fetchdef = sdk_prepare(client, cmap(3,
    "path", v_str("/api/resource/{id}"),
    "method", v_str("DELETE"),
    "params", cmap(1, "id", v_str("example"))), &err);

printf("%s\n", get_str(fetchdef, "url"));
printf("%s\n", get_str(fetchdef, "method"));
printf("%s\n", voxgig_to_json(getp(fetchdef, "headers")));
```

### Use test mode

Create a mock client for unit testing — no server required:

```c
BluefinPayconexSDK* client = test_sdk(NULL, NULL);
PNError* err = NULL;

// Entity ops return the bare record and set *err on failure.
Entity* three_d_secure_status = bluefin_payconex_three_d_secure_status(client, NULL);
voxgig_value* three_d_secure_status_rec = three_d_secure_status->vt->load(three_d_secure_status, NULL, NULL, &err);
// three_d_secure_status_rec contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function (the same shape the test
transport uses):

```c
static voxgig_value* mock_fetch(void* ud, voxgig_value* args) {
    (void)ud; (void)args;
    return cmap(4,
        "status", v_num(200),
        "statusText", v_str("OK"),
        "headers", v_map(),
        "json", json_thunk(cmap(1, "id", v_str("mock01"))));
}

BluefinPayconexSDK* client = bluefin_payconex_sdk_new(cmap(2,
    "base", v_str("http://localhost:8080"),
    "system", cmap(1, "fetch", vfn(mock_fetch, NULL))));
```

### Point at a different server

Override the base URL to reach a local or staging server:

```c
BluefinPayconexSDK* client = bluefin_payconex_sdk_new(cmap(1,
    "base", v_str("http://localhost:8080")));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd c && make test
```


## Reference

### BluefinPayconexSDK

```c
#include "core/api.h"

BluefinPayconexSDK* client = bluefin_payconex_sdk_new(options);
```

Creates a new SDK client. `options` is a `voxgig_value*` map (`NULL` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom `fetch`). |

### test_sdk

```c
BluefinPayconexSDK* client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`NULL`.

### BluefinPayconexSDK functions

| Function | Signature | Description |
| --- | --- | --- |
| `sdk_prepare` | `(BluefinPayconexSDK*, fetchargs, PNError**) -> voxgig_value*` | Build an HTTP request definition without sending. |
| `sdk_direct` | `(BluefinPayconexSDK*, fetchargs, PNError**) -> voxgig_value*` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `bluefin_payconex_account_updater` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an AccountUpdater entity instance. |
| `bluefin_payconex_account_updater_schedule` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an AccountUpdaterSchedule entity instance. |
| `bluefin_payconex_account_updater_schedule_with_result` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `bluefin_payconex_account_updater_subscription_with_result` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `bluefin_payconex_account_updater_update` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an AccountUpdaterUpdate entity instance. |
| `bluefin_payconex_api_key` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an ApiKey entity instance. |
| `bluefin_payconex_apple_pay_merchant_detail` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an ApplePayMerchantDetail entity instance. |
| `bluefin_payconex_apple_pay_session` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an ApplePaySession entity instance. |
| `bluefin_payconex_dynamic_descriptor` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a DynamicDescriptor entity instance. |
| `bluefin_payconex_i_frame_create_instance` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an IFrameCreateInstance entity instance. |
| `bluefin_payconex_i_frame_instance` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an IFrameInstance entity instance. |
| `bluefin_payconex_iframe` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an Iframe entity instance. |
| `bluefin_payconex_init` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create an Init entity instance. |
| `bluefin_payconex_list_api_key_scopes_entry` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a ListApiKeyScopesEntry entity instance. |
| `bluefin_payconex_payment_iframe` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a PaymentIframe entity instance. |
| `bluefin_payconex_three_d_secure_auth` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a ThreeDSecureAuth entity instance. |
| `bluefin_payconex_three_d_secure_browser_init` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a ThreeDSecureBrowserInit entity instance. |
| `bluefin_payconex_three_d_secure_status` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a ThreeDSecureStatus entity instance. |
| `bluefin_payconex_transaction_detail` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a TransactionDetail entity instance. |
| `bluefin_payconex_webhook` | `(BluefinPayconexSDK*, entopts) -> Entity*` | Create a Webhook entity instance. |

### Entity interface (vtable)

All entities share the same `EntityVT` vtable, reached via `e->vt->...`.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | Load a single entity by match criteria. |
| `list` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | List entities matching the criteria (a List). |
| `create` | `(Entity*, reqdata, ctrl, PNError**) -> voxgig_value*` | Create a new entity. |
| `update` | `(Entity*, reqdata, ctrl, PNError**) -> voxgig_value*` | Update an existing entity. |
| `remove` | `(Entity*, reqmatch, ctrl, PNError**) -> voxgig_value*` | Remove an entity. |
| `data` | `(Entity*, args) -> voxgig_value*` | Get entity data (pass a map to set). |
| `matchv` | `(Entity*, args) -> voxgig_value*` | Get entity match criteria (pass a map to set). |
| `make` | `(Entity*) -> Entity*` | Create a new instance with the same options. |
| `get_name` | `(Entity*) -> const char*` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `voxgig_value` map for
single-entity ops, a List for `list`) and set `*err` to a `PNError*` on
failure. Always initialise `PNError* err = NULL;` and check it after the
call.

The `sdk_direct()` escape hatch never sets `*err` for a non-2xx response —
it returns a result map you branch on via `getp(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

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


### AccountUpdater

Create an instance: `Entity* account_updater = bluefin_payconex_account_updater(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `Entity* account_updater_schedule = bluefin_payconex_account_updater_schedule(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `char*` |  |
| `period_id` | `char*` |  |
| `response_format` | `char*` |  |
| `token` | `voxgig_value* (list)` |  |

#### Example: Create

```c
Entity* account_updater_schedule = bluefin_payconex_account_updater_schedule(client, NULL);
voxgig_value* account_updater_schedule_rec = account_updater_schedule->vt->create(account_updater_schedule, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### AccountUpdaterScheduleWithResult

Create an instance: `Entity* account_updater_schedule_with_result = bluefin_payconex_account_updater_schedule_with_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `voxgig_value* (list)` |  |
| `created_at` | `char*` |  |
| `enabled` | `bool` |  |
| `expiry` | `char*` |  |
| `id` | `char*` |  |
| `most_recent_update` | `voxgig_value* (map)` |  |
| `period_date` | `char*` |  |
| `period_id` | `char*` |  |
| `response_format` | `char*` |  |
| `token` | `voxgig_value* (list)` |  |
| `type` | `char*` |  |
| `updated_at` | `char*` |  |

#### Example: List

```c
Entity* account_updater_schedule_with_result = bluefin_payconex_account_updater_schedule_with_result(client, NULL);
voxgig_value* account_updater_schedule_with_results = account_updater_schedule_with_result->vt->list(account_updater_schedule_with_result, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* account_updater_schedule_with_result = bluefin_payconex_account_updater_schedule_with_result(client, NULL);
voxgig_value* account_updater_schedule_with_result_rec = account_updater_schedule_with_result->vt->create(account_updater_schedule_with_result, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `char*` |  |
| `enabled` | `bool` |  |
| `id` | `char*` |  |
| `period_date` | `char*` |  |
| `period_id` | `char*` |  |
| `record` | `voxgig_value* (list)` |  |
| `response_format` | `char*` |  |
| `template_ref` | `char*` |  |
| `updated_at` | `char*` |  |

#### Example: Load

```c
Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);
voxgig_value* account_updater_subscription_with_result_rec = account_updater_subscription_with_result->vt->load(account_updater_subscription_with_result, cmap(2, "account_id", v_str("account_id"), "subscription_id", v_str("subscription_id")), NULL, &err);
```

#### Example: Create

```c
Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);
voxgig_value* account_updater_subscription_with_result_rec = account_updater_subscription_with_result->vt->create(account_updater_subscription_with_result, cmap(2,
    "account_id", v_str("example_account_id"),  // char*
    "subscription_id", v_str("example_subscription_id"))  // char*
, NULL, &err);
```


### AccountUpdaterUpdate

Create an instance: `Entity* account_updater_update = bluefin_payconex_account_updater_update(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `char*` |  |
| `format` | `char*` |  |
| `id` | `char*` |  |
| `new_expiry` | `char*` |  |
| `new_token` | `char*` |  |
| `old_expiry` | `char*` |  |
| `old_token` | `char*` |  |
| `recurring_schedule` | `voxgig_value* (list)` |  |
| `status` | `char*` |  |
| `update_id` | `char*` |  |
| `updated_at` | `char*` |  |

#### Example: Load

```c
Entity* account_updater_update = bluefin_payconex_account_updater_update(client, NULL);
voxgig_value* account_updater_update_rec = account_updater_update->vt->load(account_updater_update, cmap(2, "id", v_str("account_updater_update_id"), "account_id", v_str("account_id")), NULL, &err);
```


### ApiKey

Create an instance: `Entity* api_key = bluefin_payconex_api_key(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `voxgig_value* (list)` |  |
| `enabled` | `bool` |  |
| `expires_at` | `char*` |  |
| `expires_in` | `char*` |  |
| `id` | `char*` |  |
| `label` | `char*` |  |
| `method` | `voxgig_value* (list)` |  |
| `scope` | `voxgig_value* (list)` |  |
| `secret` | `char*` |  |

#### Example: Load

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* api_key_rec = api_key->vt->load(api_key, cmap(2, "id", v_str("api_key_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### Example: List

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* api_keys = api_key->vt->list(api_key, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* api_key_rec = api_key->vt->create(api_key, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### ApplePayMerchantDetail

Create an instance: `Entity* apple_pay_merchant_detail = bluefin_payconex_apple_pay_merchant_detail(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `voxgig_value* (list)` |  |
| `merchant_url` | `char*` |  |
| `partner_merchant_name` | `char*` |  |
| `payconex_account_id` | `char*` |  |

#### Example: List

```c
Entity* apple_pay_merchant_detail = bluefin_payconex_apple_pay_merchant_detail(client, NULL);
voxgig_value* apple_pay_merchant_details = apple_pay_merchant_detail->vt->list(apple_pay_merchant_detail, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* apple_pay_merchant_detail = bluefin_payconex_apple_pay_merchant_detail(client, NULL);
voxgig_value* apple_pay_merchant_detail_rec = apple_pay_merchant_detail->vt->create(apple_pay_merchant_detail, cmap(1,
    "account_id", v_num(1))  // int64_t
, NULL, &err);
```


### ApplePaySession

Create an instance: `Entity* apple_pay_session = bluefin_payconex_apple_pay_session(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `char*` |  |
| `domain_name` | `char*` |  |
| `epoch_timestamp` | `int64_t` |  |
| `expires_at` | `int64_t` |  |
| `merchant_identifier` | `char*` |  |
| `merchant_session_identifier` | `char*` |  |
| `nonce` | `int64_t` |  |
| `operational_analytics_identifier` | `char*` |  |
| `referrer` | `char*` |  |
| `retry` | `int64_t` |  |
| `signature` | `char*` |  |

#### Example: Create

```c
Entity* apple_pay_session = bluefin_payconex_apple_pay_session(client, NULL);
voxgig_value* apple_pay_session_rec = apple_pay_session->vt->create(apple_pay_session, cmap(1,
    "account_id", v_num(1))  // int64_t
, NULL, &err);
```


### DynamicDescriptor

Create an instance: `Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `char*` |  |
| `descriptor` | `char*` |  |
| `id` | `char*` |  |
| `name` | `char*` |  |
| `state` | `char*` |  |

#### Example: Load

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* dynamic_descriptor_rec = dynamic_descriptor->vt->load(dynamic_descriptor, cmap(2, "id", v_str("dynamic_descriptor_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### Example: List

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* dynamic_descriptors = dynamic_descriptor->vt->list(dynamic_descriptor, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* dynamic_descriptor_rec = dynamic_descriptor->vt->create(dynamic_descriptor, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### IFrameCreateInstance

Create an instance: `Entity* i_frame_create_instance = bluefin_payconex_i_frame_create_instance(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `char*` |  |
| `currency` | `char*` |  |
| `customer` | `voxgig_value* (map)` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `char*` |  |
| `language` | `char*` |  |
| `reference` | `char*` |  |
| `timeout` | `double` |  |
| `token` | `voxgig_value* (list)` |  |

#### Example: Create

```c
Entity* i_frame_create_instance = bluefin_payconex_i_frame_create_instance(client, NULL);
voxgig_value* i_frame_create_instance_rec = i_frame_create_instance->vt->create(i_frame_create_instance, cmap(2,
    "account_id", v_str("example_account_id"),  // char*
    "payment_iframe_id", v_str("example_payment_iframe_id"))  // char*
, NULL, &err);
```


### IFrameInstance

Create an instance: `Entity* i_frame_instance = bluefin_payconex_i_frame_instance(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Example: Load

```c
Entity* i_frame_instance = bluefin_payconex_i_frame_instance(client, NULL);
voxgig_value* i_frame_instance_rec = i_frame_instance->vt->load(i_frame_instance, cmap(3, "id", v_str("i_frame_instance_id"), "account_id", v_str("account_id"), "payment_iframe_id", v_str("payment_iframe_id")), NULL, &err);
```


### Iframe

Create an instance: `Entity* iframe = bluefin_payconex_iframe(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `voxgig_value* (map)` |  |
| `allowed_parent_domain` | `voxgig_value* (list)` |  |
| `allowed_payment_method` | `voxgig_value* (list)` |  |
| `card_setting` | `voxgig_value* (map)` |  |
| `click_to_pay_setting` | `voxgig_value* (map)` |  |
| `currency` | `char*` |  |
| `id` | `char*` |  |
| `label` | `char*` |  |
| `language` | `char*` |  |
| `timeout` | `double` |  |

#### Example: Load

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
voxgig_value* iframe_rec = iframe->vt->load(iframe, cmap(2, "account_id", v_str("account_id"), "iframe_id", v_str("iframe_id")), NULL, &err);
```

#### Example: List

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
voxgig_value* iframes = iframe->vt->list(iframe, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
voxgig_value* iframe_rec = iframe->vt->create(iframe, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### Init

Create an instance: `Entity* init = bluefin_payconex_init(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `voxgig_value* (map)` |  |
| `description` | `char*` |  |
| `item` | `voxgig_value* (list)` |  |
| `level2` | `voxgig_value* (map)` |  |
| `level3` | `voxgig_value* (map)` |  |
| `shipping_address` | `voxgig_value* (map)` |  |
| `trace` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* init = bluefin_payconex_init(client, NULL);
voxgig_value* init_rec = init->vt->create(init, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### ListApiKeyScopesEntry

Create an instance: `Entity* list_api_key_scopes_entry = bluefin_payconex_list_api_key_scopes_entry(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `char*` |  |
| `description` | `char*` |  |
| `enabled` | `bool` |  |
| `level` | `int64_t` |  |
| `scope` | `char*` |  |

#### Example: List

```c
Entity* list_api_key_scopes_entry = bluefin_payconex_list_api_key_scopes_entry(client, NULL);
voxgig_value* list_api_key_scopes_entrys = list_api_key_scopes_entry->vt->list(list_api_key_scopes_entry, NULL, NULL, &err);
```


### PaymentIframe

Create an instance: `Entity* payment_iframe = bluefin_payconex_payment_iframe(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `Entity* three_d_secure_auth = bluefin_payconex_three_d_secure_auth(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `voxgig_value* (map)` |  |
| `card` | `voxgig_value* (map)` |  |
| `challenge` | `voxgig_value* (map)` |  |
| `customer` | `voxgig_value* (map)` |  |
| `purchase` | `voxgig_value* (map)` |  |
| `server_transaction_id` | `char*` |  |
| `shipping` | `voxgig_value* (map)` |  |
| `status` | `char*` |  |
| `three_d_secure_challenge_indicator` | `char*` |  |
| `three_d_secure_id` | `char*` |  |
| `trace` | `voxgig_value* (map)` |  |

#### Example: Create

```c
Entity* three_d_secure_auth = bluefin_payconex_three_d_secure_auth(client, NULL);
voxgig_value* three_d_secure_auth_rec = three_d_secure_auth->vt->create(three_d_secure_auth, cmap(2,
    "3_d_id", v_str("example_3_d_id"),  // char*
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### ThreeDSecureBrowserInit

Create an instance: `Entity* three_d_secure_browser_init = bluefin_payconex_three_d_secure_browser_init(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `char*` |  |
| `acs_url` | `char*` |  |
| `cvv` | `char*` |  |
| `expiry` | `char*` |  |
| `pan` | `char*` |  |
| `payment_details_reference` | `char*` |  |
| `server_transaction_id` | `char*` |  |
| `status` | `char*` |  |
| `three_d_secure_data` | `char*` |  |
| `three_d_secure_id` | `char*` |  |

#### Example: Create

```c
Entity* three_d_secure_browser_init = bluefin_payconex_three_d_secure_browser_init(client, NULL);
voxgig_value* three_d_secure_browser_init_rec = three_d_secure_browser_init->vt->create(three_d_secure_browser_init, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```


### ThreeDSecureStatus

Create an instance: `Entity* three_d_secure_status = bluefin_payconex_three_d_secure_status(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `voxgig_value* (map)` |  |
| `info` | `voxgig_value* (map)` |  |
| `server_transaction_id` | `char*` |  |
| `status` | `char*` |  |
| `three_d_secure` | `voxgig_value* (map)` |  |
| `three_d_secure_id` | `char*` |  |

#### Example: Load

```c
Entity* three_d_secure_status = bluefin_payconex_three_d_secure_status(client, NULL);
voxgig_value* three_d_secure_status_rec = three_d_secure_status->vt->load(three_d_secure_status, cmap(2, "3_d_id", v_str("3_d_id"), "account_id", v_str("account_id")), NULL, &err);
```


### TransactionDetail

Create an instance: `Entity* transaction_detail = bluefin_payconex_transaction_detail(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `voxgig_value* (map)` |  |
| `auth` | `voxgig_value* (map)` |  |
| `card` | `voxgig_value* (map)` |  |
| `customer` | `voxgig_value* (map)` |  |
| `description` | `char*` |  |
| `id` | `char*` |  |
| `item` | `voxgig_value* (list)` |  |
| `level2` | `voxgig_value* (map)` |  |
| `level3` | `voxgig_value* (map)` |  |
| `override` | `voxgig_value* (map)` |  |
| `shipping_address` | `voxgig_value* (map)` |  |
| `status` | `char*` |  |
| `timestamp` | `char*` |  |
| `trace` | `voxgig_value* (map)` |  |

#### Example: Load

```c
Entity* transaction_detail = bluefin_payconex_transaction_detail(client, NULL);
voxgig_value* transaction_detail_rec = transaction_detail->vt->load(transaction_detail, cmap(2, "account_id", v_str("account_id"), "transaction_id", v_str("transaction_id")), NULL, &err);
```


### Webhook

Create an instance: `Entity* webhook = bluefin_payconex_webhook(client, NULL);`

#### Operations

| Method | Description |
| --- | --- |
| `vt->create(e, reqdata, ctrl, &err)` | Create a new entity with the given data. |
| `vt->list(e, reqmatch, ctrl, &err)` | List entities, optionally matching the given criteria. |
| `vt->load(e, reqmatch, ctrl, &err)` | Load a single entity by match criteria. |
| `vt->remove(e, reqmatch, ctrl, &err)` | Remove the matching entity. |
| `vt->update(e, reqdata, ctrl, &err)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `char*` |  |
| `id` | `char*` |  |
| `url` | `char*` |  |

#### Example: Load

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* webhook_rec = webhook->vt->load(webhook, cmap(2, "id", v_str("webhook_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### Example: List

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* webhooks = webhook->vt->list(webhook, NULL, NULL, &err);
```

#### Example: Create

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* webhook_rec = webhook->vt->create(webhook, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
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

### Data as `voxgig_value*`

The C SDK uses a single dynamic `voxgig_value*` type throughout rather than
a typed struct per entity. `voxgig_value` is the vendored voxgig struct
port (a JSON-shaped tagged union: string, number, bool, list, map, null,
undef). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `cmap` / `clist` / `v_str` / `v_num` /
`v_bool` helper builders, and read fields back with `getp` (or the typed
`get_str` / `get_bool` / `to_int`); use `to_map` to safely coerce a
value to a map.

Memory follows a retain-heavy, never-free discipline — pipeline values are
never released. This is safe (no use-after-free) and leaks are acceptable
for the short-lived SDK and test binaries.

### Error handling

Fallible functions return a `voxgig_value*` (or a struct pointer) and take a
trailing `PNError** err` out-param. On success `*err` is left `NULL`; on
failure `*err` points to a heap `PNError` carrying `code` and `msg`.
Always initialise `PNError* err = NULL;` and branch on it after each call.

### Project structure

```
c/
├── core/          -- Pipeline types, config, client (client.c), api.h + sdk.h
├── entity/        -- Per-entity implementations (one .c each)
├── feature/       -- Built-in features (base, test, log, ...)
├── utility/       -- Utilities + the vendored voxgig struct port (utility/struct)
├── tests/         -- Test binaries (each a standalone main())
└── Makefile       -- Builds libsdk.a and runs every tests/*.c
```

The public entry header is `core/api.h` — it includes `core/sdk.h` (the
umbrella runtime header) and declares each entity's constructor and SDK
accessor. Include it and link against `libsdk.a`.

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
