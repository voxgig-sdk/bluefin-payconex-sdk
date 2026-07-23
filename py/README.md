# BluefinPayconex Python SDK



The Python SDK for the BluefinPayconex API — an entity-oriented client following Pythonic conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.AccountUpdater()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
import os
from bluefinpayconex_sdk import BluefinPayconexSDK

client = BluefinPayconexSDK({
    "apikey": os.environ.get("BLUEFIN_PAYCONEX_APIKEY"),
})
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()` returns the bare record (a `dict`) and raises on error.

```python
try:
    accountupdatersubscriptionwithresult = client.AccountUpdaterSubscriptionWithResult().load({"account_id": "example_account_id", "subscription_id": "example_subscription_id"})
    print(accountupdatersubscriptionwithresult)
except Exception as err:
    print(f"load failed: {err}")
```

### 4. Create, update, and remove

```python
# Remove
client.AccountUpdater().remove({"account_id": "example_account_id", "subscription_id": "example_subscription_id"})
```


## Error handling

Entity operations raise on failure, so wrap them in `try` / `except`:

```python
try:
    accountupdaterschedulewithresults = client.AccountUpdaterScheduleWithResult().list()
    print(accountupdaterschedulewithresults)
except Exception as err:
    print(f"list failed: {err}")
```

`direct()` does **not** raise — it returns the result envelope. Branch
on `ok`; on failure `status` holds the HTTP status (for error responses)
and `err` holds a transport error, so read both defensively:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example_id"},
})

if not result["ok"]:
    print("request failed:", result.get("status"), result.get("err"))
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    # A non-2xx response carries status + data (the error body); a
    # transport-level failure carries err instead. Only one is present, so
    # read both with .get() rather than indexing a key that may be absent.
    print(result.get("status"), result.get("err"))
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = BluefinPayconexSDK.test()

# Entity ops return the bare record and raise on error.
accountupdaterschedulewithresult = client.AccountUpdaterScheduleWithResult().list()
# accountupdaterschedulewithresult contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = BluefinPayconexSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd py && pytest test/
```


## Reference

### BluefinPayconexSDK

```python
from bluefinpayconex_sdk import BluefinPayconexSDK

client = BluefinPayconexSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `str` | API key for authentication. |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = BluefinPayconexSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
| `AccountUpdater` | `(data) -> AccountUpdaterEntity` | Create an AccountUpdater entity instance. |
| `AccountUpdaterSchedule` | `(data) -> AccountUpdaterScheduleEntity` | Create an AccountUpdaterSchedule entity instance. |
| `AccountUpdaterScheduleWithResult` | `(data) -> AccountUpdaterScheduleWithResultEntity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `AccountUpdaterSubscriptionWithResult` | `(data) -> AccountUpdaterSubscriptionWithResultEntity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `AccountUpdaterUpdate` | `(data) -> AccountUpdaterUpdateEntity` | Create an AccountUpdaterUpdate entity instance. |
| `ApiKey` | `(data) -> ApiKeyEntity` | Create an ApiKey entity instance. |
| `ApplePayMerchantDetail` | `(data) -> ApplePayMerchantDetailEntity` | Create an ApplePayMerchantDetail entity instance. |
| `ApplePaySession` | `(data) -> ApplePaySessionEntity` | Create an ApplePaySession entity instance. |
| `DynamicDescriptor` | `(data) -> DynamicDescriptorEntity` | Create a DynamicDescriptor entity instance. |
| `IFrameCreateInstance` | `(data) -> IFrameCreateInstanceEntity` | Create an IFrameCreateInstance entity instance. |
| `IFrameInstance` | `(data) -> IFrameInstanceEntity` | Create an IFrameInstance entity instance. |
| `Iframe` | `(data) -> IframeEntity` | Create an Iframe entity instance. |
| `Init` | `(data) -> InitEntity` | Create an Init entity instance. |
| `ListApiKeyScopesEntry` | `(data) -> ListApiKeyScopesEntryEntity` | Create a ListApiKeyScopesEntry entity instance. |
| `PaymentIframe` | `(data) -> PaymentIframeEntity` | Create a PaymentIframe entity instance. |
| `ThreeDSecureAuth` | `(data) -> ThreeDSecureAuthEntity` | Create a ThreeDSecureAuth entity instance. |
| `ThreeDSecureBrowserInit` | `(data) -> ThreeDSecureBrowserInitEntity` | Create a ThreeDSecureBrowserInit entity instance. |
| `ThreeDSecureStatus` | `(data) -> ThreeDSecureStatusEntity` | Create a ThreeDSecureStatus entity instance. |
| `TransactionDetail` | `(data) -> TransactionDetailEntity` | Create a TransactionDetail entity instance. |
| `Webhook` | `(data) -> WebhookEntity` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> list` | List entities matching the criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

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

Create an instance: `account_updater = client.AccountUpdater()`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `account_updater_schedule = client.AccountUpdaterSchedule()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `str` |  |
| `period_id` | `str` |  |
| `response_format` | `str` |  |
| `token` | `list` |  |

#### Example: Create

```python
account_updater_schedule = client.AccountUpdaterSchedule().create({
    "account_id": "example_account_id",  # str
})
```


### AccountUpdaterScheduleWithResult

Create an instance: `account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `list` |  |
| `created_at` | `str` |  |
| `enabled` | `bool` |  |
| `expiry` | `str` |  |
| `id` | `str` |  |
| `most_recent_update` | `dict` |  |
| `period_date` | `str` |  |
| `period_id` | `str` |  |
| `response_format` | `str` |  |
| `token` | `list` |  |
| `type` | `str` |  |
| `updated_at` | `str` |  |

#### Example: List

```python
account_updater_schedule_with_results = client.AccountUpdaterScheduleWithResult().list()
```

#### Example: Create

```python
account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult().create({
    "account_id": "example_account_id",  # str
})
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `str` |  |
| `enabled` | `bool` |  |
| `id` | `str` |  |
| `period_date` | `str` |  |
| `period_id` | `str` |  |
| `record` | `list` |  |
| `response_format` | `str` |  |
| `template_ref` | `str` |  |
| `updated_at` | `str` |  |

#### Example: Load

```python
account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult().load({"account_id": "account_id", "subscription_id": "subscription_id"})
```

#### Example: Create

```python
account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult().create({
    "account_id": "example_account_id",  # str
    "subscription_id": "example_subscription_id",  # str
})
```


### AccountUpdaterUpdate

Create an instance: `account_updater_update = client.AccountUpdaterUpdate()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `str` |  |
| `format` | `str` |  |
| `id` | `str` |  |
| `new_expiry` | `str` |  |
| `new_token` | `str` |  |
| `old_expiry` | `str` |  |
| `old_token` | `str` |  |
| `recurring_schedule` | `list` |  |
| `status` | `str` |  |
| `update_id` | `str` |  |
| `updated_at` | `str` |  |

#### Example: Load

```python
account_updater_update = client.AccountUpdaterUpdate().load({"id": "account_updater_update_id", "account_id": "account_id"})
```


### ApiKey

Create an instance: `api_key = client.ApiKey()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `list` |  |
| `enabled` | `bool` |  |
| `expires_at` | `str` |  |
| `expires_in` | `str` |  |
| `id` | `str` |  |
| `label` | `str` |  |
| `method` | `list` |  |
| `scope` | `list` |  |
| `secret` | `str` |  |

#### Example: Load

```python
api_key = client.ApiKey().load({"id": "api_key_id", "account_id": "account_id"})
```

#### Example: List

```python
api_keys = client.ApiKey().list()
```

#### Example: Create

```python
api_key = client.ApiKey().create({
    "account_id": "example_account_id",  # str
})
```


### ApplePayMerchantDetail

Create an instance: `apple_pay_merchant_detail = client.ApplePayMerchantDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `list` |  |
| `merchant_url` | `str` |  |
| `partner_merchant_name` | `str` |  |
| `payconex_account_id` | `str` |  |

#### Example: List

```python
apple_pay_merchant_details = client.ApplePayMerchantDetail().list()
```

#### Example: Create

```python
apple_pay_merchant_detail = client.ApplePayMerchantDetail().create({
    "account_id": 1,  # int
})
```


### ApplePaySession

Create an instance: `apple_pay_session = client.ApplePaySession()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `str` |  |
| `domain_name` | `str` |  |
| `epoch_timestamp` | `int` |  |
| `expires_at` | `int` |  |
| `merchant_identifier` | `str` |  |
| `merchant_session_identifier` | `str` |  |
| `nonce` | `int` |  |
| `operational_analytics_identifier` | `str` |  |
| `referrer` | `str` |  |
| `retry` | `int` |  |
| `signature` | `str` |  |

#### Example: Create

```python
apple_pay_session = client.ApplePaySession().create({
    "account_id": 1,  # int
})
```


### DynamicDescriptor

Create an instance: `dynamic_descriptor = client.DynamicDescriptor()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `str` |  |
| `descriptor` | `str` |  |
| `id` | `str` |  |
| `name` | `str` |  |
| `state` | `str` |  |

#### Example: Load

```python
dynamic_descriptor = client.DynamicDescriptor().load({"id": "dynamic_descriptor_id", "account_id": "account_id"})
```

#### Example: List

```python
dynamic_descriptors = client.DynamicDescriptor().list()
```

#### Example: Create

```python
dynamic_descriptor = client.DynamicDescriptor().create({
    "account_id": "example_account_id",  # str
})
```


### IFrameCreateInstance

Create an instance: `i_frame_create_instance = client.IFrameCreateInstance()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `str` |  |
| `currency` | `str` |  |
| `customer` | `dict` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `str` |  |
| `language` | `str` |  |
| `reference` | `str` |  |
| `timeout` | `float` |  |
| `token` | `list` |  |

#### Example: Create

```python
i_frame_create_instance = client.IFrameCreateInstance().create({
    "account_id": "example_account_id",  # str
    "payment_iframe_id": "example_payment_iframe_id",  # str
})
```


### IFrameInstance

Create an instance: `i_frame_instance = client.IFrameInstance()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```python
i_frame_instance = client.IFrameInstance().load({"id": "i_frame_instance_id", "account_id": "account_id", "payment_iframe_id": "payment_iframe_id"})
```


### Iframe

Create an instance: `iframe = client.Iframe()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `dict` |  |
| `allowed_parent_domain` | `list` |  |
| `allowed_payment_method` | `list` |  |
| `card_setting` | `dict` |  |
| `click_to_pay_setting` | `dict` |  |
| `currency` | `str` |  |
| `id` | `str` |  |
| `label` | `str` |  |
| `language` | `str` |  |
| `timeout` | `float` |  |

#### Example: Load

```python
iframe = client.Iframe().load({"account_id": "account_id", "iframe_id": "iframe_id"})
```

#### Example: List

```python
iframes = client.Iframe().list()
```

#### Example: Create

```python
iframe = client.Iframe().create({
    "account_id": "example_account_id",  # str
})
```


### Init

Create an instance: `init = client.Init()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `dict` |  |
| `description` | `str` |  |
| `item` | `list` |  |
| `level2` | `dict` |  |
| `level3` | `dict` |  |
| `shipping_address` | `dict` |  |
| `trace` | `dict` |  |

#### Example: Create

```python
init = client.Init().create({
    "account_id": "example_account_id",  # str
})
```


### ListApiKeyScopesEntry

Create an instance: `list_api_key_scopes_entry = client.ListApiKeyScopesEntry()`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `str` |  |
| `description` | `str` |  |
| `enabled` | `bool` |  |
| `level` | `int` |  |
| `scope` | `str` |  |

#### Example: List

```python
list_api_key_scopes_entrys = client.ListApiKeyScopesEntry().list()
```


### PaymentIframe

Create an instance: `payment_iframe = client.PaymentIframe()`

#### Operations

| Method | Description |
| --- | --- |
| `remove(match)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `three_d_secure_auth = client.ThreeDSecureAuth()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `dict` |  |
| `card` | `dict` |  |
| `challenge` | `dict` |  |
| `customer` | `dict` |  |
| `purchase` | `dict` |  |
| `server_transaction_id` | `str` |  |
| `shipping` | `dict` |  |
| `status` | `str` |  |
| `three_d_secure_challenge_indicator` | `str` |  |
| `three_d_secure_id` | `str` |  |
| `trace` | `dict` |  |

#### Example: Create

```python
three_d_secure_auth = client.ThreeDSecureAuth().create({
    "3_d_id": "example_3_d_id",  # str
    "account_id": "example_account_id",  # str
})
```


### ThreeDSecureBrowserInit

Create an instance: `three_d_secure_browser_init = client.ThreeDSecureBrowserInit()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `str` |  |
| `acs_url` | `str` |  |
| `cvv` | `str` |  |
| `expiry` | `str` |  |
| `pan` | `str` |  |
| `payment_details_reference` | `str` |  |
| `server_transaction_id` | `str` |  |
| `status` | `str` |  |
| `three_d_secure_data` | `str` |  |
| `three_d_secure_id` | `str` |  |

#### Example: Create

```python
three_d_secure_browser_init = client.ThreeDSecureBrowserInit().create({
    "account_id": "example_account_id",  # str
})
```


### ThreeDSecureStatus

Create an instance: `three_d_secure_status = client.ThreeDSecureStatus()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `dict` |  |
| `info` | `dict` |  |
| `server_transaction_id` | `str` |  |
| `status` | `str` |  |
| `three_d_secure` | `dict` |  |
| `three_d_secure_id` | `str` |  |

#### Example: Load

```python
three_d_secure_status = client.ThreeDSecureStatus().load({"3_d_id": "3_d_id", "account_id": "account_id"})
```


### TransactionDetail

Create an instance: `transaction_detail = client.TransactionDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `dict` |  |
| `auth` | `dict` |  |
| `card` | `dict` |  |
| `customer` | `dict` |  |
| `description` | `str` |  |
| `id` | `str` |  |
| `item` | `list` |  |
| `level2` | `dict` |  |
| `level3` | `dict` |  |
| `override` | `dict` |  |
| `shipping_address` | `dict` |  |
| `status` | `str` |  |
| `timestamp` | `str` |  |
| `trace` | `dict` |  |

#### Example: Load

```python
transaction_detail = client.TransactionDetail().load({"account_id": "account_id", "transaction_id": "transaction_id"})
```


### Webhook

Create an instance: `webhook = client.Webhook()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `str` |  |
| `id` | `str` |  |
| `url` | `str` |  |

#### Example: Load

```python
webhook = client.Webhook().load({"id": "webhook_id", "account_id": "account_id"})
```

#### Example: List

```python
webhooks = client.Webhook().list()
```

#### Example: Create

```python
webhook = client.Webhook().create({
    "account_id": "example_account_id",  # str
})
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

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── bluefinpayconex_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`bluefinpayconex_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```python
accountupdaterschedulewithresult = client.AccountUpdaterScheduleWithResult()
accountupdaterschedulewithresult.list()

# accountupdaterschedulewithresult.data_get() now returns the accountupdaterschedulewithresult data from the last list
# accountupdaterschedulewithresult.match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
