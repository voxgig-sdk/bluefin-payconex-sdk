# BluefinPayconex C SDK Reference

Complete API reference for the BluefinPayconex C SDK.


## BluefinPayconexSDK

### Constructor

```c
#include "core/api.h"

BluefinPayconexSDK* client = bluefin_payconex_sdk_new(options);
```

Create a new SDK client instance. `options` is a `voxgig_value*` map
(`NULL` for none).

**Parameters (`options` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Test Constructor

#### `BluefinPayconexSDK* test_sdk(voxgig_value* testopts, voxgig_value* sdkopts)`

Create a test client with mock features active. Both arguments may be
`NULL`.

```c
BluefinPayconexSDK* client = test_sdk(NULL, NULL);
```


### Entity Accessors

#### `Entity* bluefin_payconex_account_updater(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `AccountUpdater` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_account_updater_schedule(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `AccountUpdaterSchedule` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_account_updater_schedule_with_result(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `AccountUpdaterScheduleWithResult` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_account_updater_subscription_with_result(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_account_updater_update(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `AccountUpdaterUpdate` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_api_key(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `ApiKey` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_apple_pay_merchant_detail(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `ApplePayMerchantDetail` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_apple_pay_session(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `ApplePaySession` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_dynamic_descriptor(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `DynamicDescriptor` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_i_frame_create_instance(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `IFrameCreateInstance` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_i_frame_instance(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `IFrameInstance` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_iframe(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `Iframe` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_init(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `Init` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_list_api_key_scopes_entry(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `ListApiKeyScopesEntry` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_payment_iframe(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `PaymentIframe` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_three_d_secure_auth(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `ThreeDSecureAuth` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_three_d_secure_browser_init(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `ThreeDSecureBrowserInit` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_three_d_secure_status(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `ThreeDSecureStatus` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_transaction_detail(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `TransactionDetail` entity instance. Pass `NULL` for no initial
options.

#### `Entity* bluefin_payconex_webhook(BluefinPayconexSDK* client, voxgig_value* entopts)`

Create a new `Webhook` entity instance. Pass `NULL` for no initial
options.

#### `voxgig_value* sdk_direct(BluefinPayconexSDK* client, voxgig_value* fetchargs, PNError** err)`

Make a direct HTTP request to any API endpoint. Returns a result map with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never sets `*err` for a non-2xx response — branch on
`getp(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `voxgig_value* sdk_prepare(BluefinPayconexSDK* client, voxgig_value* fetchargs, PNError** err)`

Prepare a fetch definition without sending. Returns the fetchdef and sets
`*err` on failure.


---

## AccountUpdater

```c
Entity* account_updater = bluefin_payconex_account_updater(client, NULL);
```

### Operations

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* account_updater = bluefin_payconex_account_updater(client, NULL);
voxgig_value* result = account_updater->vt->remove(account_updater, cmap(2, "account_id", v_str("account_id"), "subscription_id", v_str("subscription_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `AccountUpdater` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## AccountUpdaterSchedule

```c
Entity* account_updater_schedule = bluefin_payconex_account_updater_schedule(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `char*` | No |  |
| `period_id` | `char*` | Yes |  |
| `response_format` | `char*` | No |  |
| `token` | `voxgig_value* (list)` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* account_updater_schedule = bluefin_payconex_account_updater_schedule(client, NULL);
voxgig_value* result = account_updater_schedule->vt->create(account_updater_schedule, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## AccountUpdaterScheduleWithResult

```c
Entity* account_updater_schedule_with_result = bluefin_payconex_account_updater_schedule_with_result(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `voxgig_value* (list)` | Yes |  |
| `created_at` | `char*` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `char*` | No |  |
| `id` | `char*` | Yes |  |
| `most_recent_update` | `voxgig_value* (map)` | No |  |
| `period_date` | `char*` | No |  |
| `period_id` | `char*` | Yes |  |
| `response_format` | `char*` | No |  |
| `token` | `voxgig_value* (list)` | Yes |  |
| `type` | `char*` | Yes |  |
| `updated_at` | `char*` | Yes |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* account_updater_schedule_with_result = bluefin_payconex_account_updater_schedule_with_result(client, NULL);
voxgig_value* result = account_updater_schedule_with_result->vt->create(account_updater_schedule_with_result, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* account_updater_schedule_with_result = bluefin_payconex_account_updater_schedule_with_result(client, NULL);
voxgig_value* results = account_updater_schedule_with_result->vt->list(account_updater_schedule_with_result, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResult

```c
Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `char*` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `char*` | No |  |
| `period_date` | `char*` | No |  |
| `period_id` | `char*` | No |  |
| `record` | `voxgig_value* (list)` | No |  |
| `response_format` | `char*` | No |  |
| `template_ref` | `char*` | No |  |
| `updated_at` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);
voxgig_value* result = account_updater_subscription_with_result->vt->create(account_updater_subscription_with_result, cmap(2,
    "account_id", v_str("example_account_id"),  // char*
    "subscription_id", v_str("example_subscription_id"))  // char*
, NULL, &err);
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);
voxgig_value* result = account_updater_subscription_with_result->vt->load(account_updater_subscription_with_result, cmap(2, "account_id", v_str("account_id"), "subscription_id", v_str("subscription_id")), NULL, &err);
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* account_updater_subscription_with_result = bluefin_payconex_account_updater_subscription_with_result(client, NULL);
voxgig_value* result = account_updater_subscription_with_result->vt->update(account_updater_subscription_with_result, cmap(2, "account_id", v_str("account_id"), "subscription_id", v_str("subscription_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## AccountUpdaterUpdate

```c
Entity* account_updater_update = bluefin_payconex_account_updater_update(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `char*` | No |  |
| `format` | `char*` | No |  |
| `id` | `char*` | No |  |
| `new_expiry` | `char*` | No |  |
| `new_token` | `char*` | No |  |
| `old_expiry` | `char*` | No |  |
| `old_token` | `char*` | No |  |
| `recurring_schedule` | `voxgig_value* (list)` | No |  |
| `status` | `char*` | No |  |
| `update_id` | `char*` | No |  |
| `updated_at` | `char*` | No |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* account_updater_update = bluefin_payconex_account_updater_update(client, NULL);
voxgig_value* result = account_updater_update->vt->load(account_updater_update, cmap(2, "id", v_str("account_updater_update_id"), "account_id", v_str("account_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## ApiKey

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `voxgig_value* (list)` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `char*` | No |  |
| `expires_in` | `char*` | No |  |
| `id` | `char*` | No |  |
| `label` | `char*` | No |  |
| `method` | `voxgig_value* (list)` | No |  |
| `scope` | `voxgig_value* (list)` | No |  |
| `secret` | `char*` | No |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* result = api_key->vt->create(api_key, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* results = api_key->vt->list(api_key, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* result = api_key->vt->load(api_key, cmap(2, "id", v_str("api_key_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* result = api_key->vt->remove(api_key, cmap(2, "id", v_str("api_key_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* api_key = bluefin_payconex_api_key(client, NULL);
voxgig_value* result = api_key->vt->update(api_key, cmap(2, "id", v_str("api_key_id"), "account_id", v_str("account_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `ApiKey` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## ApplePayMerchantDetail

```c
Entity* apple_pay_merchant_detail = bluefin_payconex_apple_pay_merchant_detail(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `voxgig_value* (list)` | Yes |  |
| `merchant_url` | `char*` | Yes |  |
| `partner_merchant_name` | `char*` | No |  |
| `payconex_account_id` | `char*` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `domain` | - | - |
| `merchant_url` | - | Yes |
| `partner_merchant_name` | - | - |
| `payconex_account_id` | - | - |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* apple_pay_merchant_detail = bluefin_payconex_apple_pay_merchant_detail(client, NULL);
voxgig_value* result = apple_pay_merchant_detail->vt->create(apple_pay_merchant_detail, cmap(1,
    "account_id", v_num(1))  // int64_t
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* apple_pay_merchant_detail = bluefin_payconex_apple_pay_merchant_detail(client, NULL);
voxgig_value* results = apple_pay_merchant_detail->vt->list(apple_pay_merchant_detail, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## ApplePaySession

```c
Entity* apple_pay_session = bluefin_payconex_apple_pay_session(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `char*` | No |  |
| `domain_name` | `char*` | No |  |
| `epoch_timestamp` | `int64_t` | No |  |
| `expires_at` | `int64_t` | No |  |
| `merchant_identifier` | `char*` | No |  |
| `merchant_session_identifier` | `char*` | No |  |
| `nonce` | `int64_t` | No |  |
| `operational_analytics_identifier` | `char*` | No |  |
| `referrer` | `char*` | Yes |  |
| `retry` | `int64_t` | No |  |
| `signature` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* apple_pay_session = bluefin_payconex_apple_pay_session(client, NULL);
voxgig_value* result = apple_pay_session->vt->create(apple_pay_session, cmap(1,
    "account_id", v_num(1))  // int64_t
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `ApplePaySession` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## DynamicDescriptor

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `char*` | No |  |
| `descriptor` | `char*` | No |  |
| `id` | `char*` | No |  |
| `name` | `char*` | No |  |
| `state` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* result = dynamic_descriptor->vt->create(dynamic_descriptor, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* results = dynamic_descriptor->vt->list(dynamic_descriptor, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* result = dynamic_descriptor->vt->load(dynamic_descriptor, cmap(2, "id", v_str("dynamic_descriptor_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* result = dynamic_descriptor->vt->remove(dynamic_descriptor, cmap(2, "id", v_str("dynamic_descriptor_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* dynamic_descriptor = bluefin_payconex_dynamic_descriptor(client, NULL);
voxgig_value* result = dynamic_descriptor->vt->update(dynamic_descriptor, cmap(2, "id", v_str("dynamic_descriptor_id"), "account_id", v_str("account_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## IFrameCreateInstance

```c
Entity* i_frame_create_instance = bluefin_payconex_i_frame_create_instance(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `char*` | No |  |
| `currency` | `char*` | No |  |
| `customer` | `voxgig_value* (map)` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `char*` | Yes |  |
| `language` | `char*` | No |  |
| `reference` | `char*` | No |  |
| `timeout` | `double` | No |  |
| `token` | `voxgig_value* (list)` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* i_frame_create_instance = bluefin_payconex_i_frame_create_instance(client, NULL);
voxgig_value* result = i_frame_create_instance->vt->create(i_frame_create_instance, cmap(2,
    "account_id", v_str("example_account_id"),  // char*
    "payment_iframe_id", v_str("example_payment_iframe_id"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## IFrameInstance

```c
Entity* i_frame_instance = bluefin_payconex_i_frame_instance(client, NULL);
```

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* i_frame_instance = bluefin_payconex_i_frame_instance(client, NULL);
voxgig_value* result = i_frame_instance->vt->load(i_frame_instance, cmap(3, "id", v_str("i_frame_instance_id"), "account_id", v_str("account_id"), "payment_iframe_id", v_str("payment_iframe_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `IFrameInstance` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Iframe

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `voxgig_value* (map)` | No |  |
| `allowed_parent_domain` | `voxgig_value* (list)` | Yes |  |
| `allowed_payment_method` | `voxgig_value* (list)` | Yes |  |
| `card_setting` | `voxgig_value* (map)` | No |  |
| `click_to_pay_setting` | `voxgig_value* (map)` | No |  |
| `currency` | `char*` | No |  |
| `id` | `char*` | No |  |
| `label` | `char*` | Yes |  |
| `language` | `char*` | No |  |
| `timeout` | `double` | No |  |

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

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
voxgig_value* result = iframe->vt->create(iframe, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
voxgig_value* results = iframe->vt->list(iframe, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
voxgig_value* result = iframe->vt->load(iframe, cmap(2, "account_id", v_str("account_id"), "iframe_id", v_str("iframe_id")), NULL, &err);
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* iframe = bluefin_payconex_iframe(client, NULL);
voxgig_value* result = iframe->vt->update(iframe, cmap(2, "account_id", v_str("account_id"), "iframe_id", v_str("iframe_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Iframe` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Init

```c
Entity* init = bluefin_payconex_init(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `voxgig_value* (map)` | No |  |
| `description` | `char*` | No |  |
| `item` | `voxgig_value* (list)` | No |  |
| `level2` | `voxgig_value* (map)` | No |  |
| `level3` | `voxgig_value* (map)` | No |  |
| `shipping_address` | `voxgig_value* (map)` | Yes |  |
| `trace` | `voxgig_value* (map)` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* init = bluefin_payconex_init(client, NULL);
voxgig_value* result = init->vt->create(init, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Init` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## ListApiKeyScopesEntry

```c
Entity* list_api_key_scopes_entry = bluefin_payconex_list_api_key_scopes_entry(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `char*` | No |  |
| `description` | `char*` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `int64_t` | No |  |
| `scope` | `char*` | No |  |

### Operations

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* list_api_key_scopes_entry = bluefin_payconex_list_api_key_scopes_entry(client, NULL);
voxgig_value* results = list_api_key_scopes_entry->vt->list(list_api_key_scopes_entry, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## PaymentIframe

```c
Entity* payment_iframe = bluefin_payconex_payment_iframe(client, NULL);
```

### Operations

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* payment_iframe = bluefin_payconex_payment_iframe(client, NULL);
voxgig_value* result = payment_iframe->vt->remove(payment_iframe, cmap(2, "account_id", v_str("account_id"), "id", v_str("id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `PaymentIframe` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## ThreeDSecureAuth

```c
Entity* three_d_secure_auth = bluefin_payconex_three_d_secure_auth(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `voxgig_value* (map)` | Yes |  |
| `card` | `voxgig_value* (map)` | Yes |  |
| `challenge` | `voxgig_value* (map)` | No |  |
| `customer` | `voxgig_value* (map)` | No |  |
| `purchase` | `voxgig_value* (map)` | Yes |  |
| `server_transaction_id` | `char*` | No |  |
| `shipping` | `voxgig_value* (map)` | Yes |  |
| `status` | `char*` | No |  |
| `three_d_secure_challenge_indicator` | `char*` | No |  |
| `three_d_secure_id` | `char*` | No |  |
| `trace` | `voxgig_value* (map)` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* three_d_secure_auth = bluefin_payconex_three_d_secure_auth(client, NULL);
voxgig_value* result = three_d_secure_auth->vt->create(three_d_secure_auth, cmap(2,
    "3_d_id", v_str("example_3_d_id"),  // char*
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## ThreeDSecureBrowserInit

```c
Entity* three_d_secure_browser_init = bluefin_payconex_three_d_secure_browser_init(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `char*` | No |  |
| `acs_url` | `char*` | No |  |
| `cvv` | `char*` | No |  |
| `expiry` | `char*` | Yes |  |
| `pan` | `char*` | Yes |  |
| `payment_details_reference` | `char*` | No |  |
| `server_transaction_id` | `char*` | No |  |
| `status` | `char*` | No |  |
| `three_d_secure_data` | `char*` | No |  |
| `three_d_secure_id` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* three_d_secure_browser_init = bluefin_payconex_three_d_secure_browser_init(client, NULL);
voxgig_value* result = three_d_secure_browser_init->vt->create(three_d_secure_browser_init, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## ThreeDSecureStatus

```c
Entity* three_d_secure_status = bluefin_payconex_three_d_secure_status(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `voxgig_value* (map)` | No |  |
| `info` | `voxgig_value* (map)` | No |  |
| `server_transaction_id` | `char*` | No |  |
| `status` | `char*` | No |  |
| `three_d_secure` | `voxgig_value* (map)` | No |  |
| `three_d_secure_id` | `char*` | No |  |

### Operations

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* three_d_secure_status = bluefin_payconex_three_d_secure_status(client, NULL);
voxgig_value* result = three_d_secure_status->vt->load(three_d_secure_status, cmap(2, "3_d_id", v_str("3_d_id"), "account_id", v_str("account_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## TransactionDetail

```c
Entity* transaction_detail = bluefin_payconex_transaction_detail(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `voxgig_value* (map)` | Yes |  |
| `auth` | `voxgig_value* (map)` | Yes |  |
| `card` | `voxgig_value* (map)` | No |  |
| `customer` | `voxgig_value* (map)` | No |  |
| `description` | `char*` | No |  |
| `id` | `char*` | No |  |
| `item` | `voxgig_value* (list)` | No |  |
| `level2` | `voxgig_value* (map)` | No |  |
| `level3` | `voxgig_value* (map)` | No |  |
| `override` | `voxgig_value* (map)` | No |  |
| `shipping_address` | `voxgig_value* (map)` | Yes |  |
| `status` | `char*` | Yes |  |
| `timestamp` | `char*` | No |  |
| `trace` | `voxgig_value* (map)` | No |  |

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

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* transaction_detail = bluefin_payconex_transaction_detail(client, NULL);
voxgig_value* result = transaction_detail->vt->load(transaction_detail, cmap(2, "account_id", v_str("account_id"), "transaction_id", v_str("transaction_id")), NULL, &err);
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* transaction_detail = bluefin_payconex_transaction_detail(client, NULL);
voxgig_value* result = transaction_detail->vt->update(transaction_detail, cmap(2, "account_id", v_str("account_id"), "transaction_id", v_str("transaction_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `TransactionDetail` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Webhook

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `char*` | Yes |  |
| `id` | `char*` | No |  |
| `url` | `char*` | Yes |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* result = webhook->vt->create(webhook, cmap(1,
    "account_id", v_str("example_account_id"))  // char*
, NULL, &err);
```

#### `vt->list(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

List entities matching the given criteria. The match is optional — pass `NULL` to list all records. Returns a List.

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* results = webhook->vt->list(webhook, NULL, NULL, &err);
for (size_t i = 0; i < (size_t)voxgig_size(results); i++) {
    printf("%s\n", voxgig_to_json(voxgig_getelem(results, v_int(i), NULL)));
}
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* result = webhook->vt->load(webhook, cmap(2, "id", v_str("webhook_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* result = webhook->vt->remove(webhook, cmap(2, "id", v_str("webhook_id"), "account_id", v_str("account_id")), NULL, &err);
```

#### `vt->update(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Update an existing entity. The data must include the entity id. Returns the updated entity data.

```c
Entity* webhook = bluefin_payconex_webhook(client, NULL);
voxgig_value* result = webhook->vt->update(webhook, cmap(2, "id", v_str("webhook_id"), "account_id", v_str("account_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `Webhook` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```c
BluefinPayconexSDK* client = bluefin_payconex_sdk_new(cmap(1,
    "feature", cmap(1,
        "test", cmap(1, "active", v_bool(true)))
));
```

