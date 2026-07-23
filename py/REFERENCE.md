# BluefinPayconex Python SDK Reference

Complete API reference for the BluefinPayconex Python SDK.


## BluefinPayconexSDK

### Constructor

```python
from bluefinpayconex_sdk import BluefinPayconexSDK

client = BluefinPayconexSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinPayconexSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = BluefinPayconexSDK.test()
```


### Instance Methods

#### `AccountUpdater(data=None)`

Create a new `AccountUpdaterEntity` instance. Pass `None` for no initial data.

#### `AccountUpdaterSchedule(data=None)`

Create a new `AccountUpdaterScheduleEntity` instance. Pass `None` for no initial data.

#### `AccountUpdaterScheduleWithResult(data=None)`

Create a new `AccountUpdaterScheduleWithResultEntity` instance. Pass `None` for no initial data.

#### `AccountUpdaterSubscriptionWithResult(data=None)`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance. Pass `None` for no initial data.

#### `AccountUpdaterUpdate(data=None)`

Create a new `AccountUpdaterUpdateEntity` instance. Pass `None` for no initial data.

#### `ApiKey(data=None)`

Create a new `ApiKeyEntity` instance. Pass `None` for no initial data.

#### `ApplePayMerchantDetail(data=None)`

Create a new `ApplePayMerchantDetailEntity` instance. Pass `None` for no initial data.

#### `ApplePaySession(data=None)`

Create a new `ApplePaySessionEntity` instance. Pass `None` for no initial data.

#### `DynamicDescriptor(data=None)`

Create a new `DynamicDescriptorEntity` instance. Pass `None` for no initial data.

#### `IFrameCreateInstance(data=None)`

Create a new `IFrameCreateInstanceEntity` instance. Pass `None` for no initial data.

#### `IFrameInstance(data=None)`

Create a new `IFrameInstanceEntity` instance. Pass `None` for no initial data.

#### `Iframe(data=None)`

Create a new `IframeEntity` instance. Pass `None` for no initial data.

#### `Init(data=None)`

Create a new `InitEntity` instance. Pass `None` for no initial data.

#### `ListApiKeyScopesEntry(data=None)`

Create a new `ListApiKeyScopesEntryEntity` instance. Pass `None` for no initial data.

#### `PaymentIframe(data=None)`

Create a new `PaymentIframeEntity` instance. Pass `None` for no initial data.

#### `ThreeDSecureAuth(data=None)`

Create a new `ThreeDSecureAuthEntity` instance. Pass `None` for no initial data.

#### `ThreeDSecureBrowserInit(data=None)`

Create a new `ThreeDSecureBrowserInitEntity` instance. Pass `None` for no initial data.

#### `ThreeDSecureStatus(data=None)`

Create a new `ThreeDSecureStatusEntity` instance. Pass `None` for no initial data.

#### `TransactionDetail(data=None)`

Create a new `TransactionDetailEntity` instance. Pass `None` for no initial data.

#### `Webhook(data=None)`

Create a new `WebhookEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AccountUpdaterEntity

```python
account_updater = client.AccountUpdater()
```

### Operations

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.AccountUpdater().remove({"account_id": "account_id", "subscription_id": "subscription_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```python
account_updater_schedule = client.AccountUpdaterSchedule()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `str` | No |  |
| `period_id` | `str` | Yes |  |
| `response_format` | `str` | No |  |
| `token` | `list` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.AccountUpdaterSchedule().create({
    "account_id": "example_account_id",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```python
account_updater_schedule_with_result = client.AccountUpdaterScheduleWithResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `list` | Yes |  |
| `created_at` | `str` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `str` | No |  |
| `id` | `str` | Yes |  |
| `most_recent_update` | `dict` | No |  |
| `period_date` | `str` | No |  |
| `period_id` | `str` | Yes |  |
| `response_format` | `str` | No |  |
| `token` | `list` | Yes |  |
| `type` | `str` | Yes |  |
| `updated_at` | `str` | Yes |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.AccountUpdaterScheduleWithResult().create({
    "account_id": "example_account_id",  # str
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.AccountUpdaterScheduleWithResult().list()
for account_updater_schedule_with_result in results:
    print(account_updater_schedule_with_result)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterScheduleWithResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```python
account_updater_subscription_with_result = client.AccountUpdaterSubscriptionWithResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `str` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `str` | No |  |
| `period_date` | `str` | No |  |
| `period_id` | `str` | No |  |
| `record` | `list` | No |  |
| `response_format` | `str` | No |  |
| `template_ref` | `str` | No |  |
| `updated_at` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.AccountUpdaterSubscriptionWithResult().create({
    "account_id": "example_account_id",  # str
    "subscription_id": "example_subscription_id",  # str
})
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.AccountUpdaterSubscriptionWithResult().load({"account_id": "account_id", "subscription_id": "subscription_id"})
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.AccountUpdaterSubscriptionWithResult().update({
    "account_id": "account_id",
    "subscription_id": "subscription_id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```python
account_updater_update = client.AccountUpdaterUpdate()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `str` | No |  |
| `format` | `str` | No |  |
| `id` | `str` | No |  |
| `new_expiry` | `str` | No |  |
| `new_token` | `str` | No |  |
| `old_expiry` | `str` | No |  |
| `old_token` | `str` | No |  |
| `recurring_schedule` | `list` | No |  |
| `status` | `str` | No |  |
| `update_id` | `str` | No |  |
| `updated_at` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.AccountUpdaterUpdate().load({"id": "account_updater_update_id", "account_id": "account_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AccountUpdaterUpdateEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ApiKeyEntity

```python
api_key = client.ApiKey()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `list` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `str` | No |  |
| `expires_in` | `str` | No |  |
| `id` | `str` | No |  |
| `label` | `str` | No |  |
| `method` | `list` | No |  |
| `scope` | `list` | No |  |
| `secret` | `str` | No |  |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.ApiKey().create({
    "account_id": "example_account_id",  # str
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.ApiKey().list()
for api_key in results:
    print(api_key)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.ApiKey().load({"id": "api_key_id", "account_id": "account_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.ApiKey().remove({"id": "api_key_id", "account_id": "account_id"})
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.ApiKey().update({
    "id": "api_key_id",
    "account_id": "account_id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ApiKeyEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```python
apple_pay_merchant_detail = client.ApplePayMerchantDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `list` | Yes |  |
| `merchant_url` | `str` | Yes |  |
| `partner_merchant_name` | `str` | No |  |
| `payconex_account_id` | `str` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `domain` | - | - |
| `merchant_url` | - | Yes |
| `partner_merchant_name` | - | - |
| `payconex_account_id` | - | - |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.ApplePayMerchantDetail().create({
    "account_id": 1,  # int
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.ApplePayMerchantDetail().list()
for apple_pay_merchant_detail in results:
    print(apple_pay_merchant_detail)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePayMerchantDetailEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ApplePaySessionEntity

```python
apple_pay_session = client.ApplePaySession()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `str` | No |  |
| `domain_name` | `str` | No |  |
| `epoch_timestamp` | `int` | No |  |
| `expires_at` | `int` | No |  |
| `merchant_identifier` | `str` | No |  |
| `merchant_session_identifier` | `str` | No |  |
| `nonce` | `int` | No |  |
| `operational_analytics_identifier` | `str` | No |  |
| `referrer` | `str` | Yes |  |
| `retry` | `int` | No |  |
| `signature` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.ApplePaySession().create({
    "account_id": 1,  # int
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ApplePaySessionEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## DynamicDescriptorEntity

```python
dynamic_descriptor = client.DynamicDescriptor()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `str` | No |  |
| `descriptor` | `str` | No |  |
| `id` | `str` | No |  |
| `name` | `str` | No |  |
| `state` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.DynamicDescriptor().create({
    "account_id": "example_account_id",  # str
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.DynamicDescriptor().list()
for dynamic_descriptor in results:
    print(dynamic_descriptor)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.DynamicDescriptor().load({"id": "dynamic_descriptor_id", "account_id": "account_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.DynamicDescriptor().remove({"id": "dynamic_descriptor_id", "account_id": "account_id"})
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.DynamicDescriptor().update({
    "id": "dynamic_descriptor_id",
    "account_id": "account_id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DynamicDescriptorEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## IFrameCreateInstanceEntity

```python
i_frame_create_instance = client.IFrameCreateInstance()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `str` | No |  |
| `currency` | `str` | No |  |
| `customer` | `dict` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `str` | Yes |  |
| `language` | `str` | No |  |
| `reference` | `str` | No |  |
| `timeout` | `float` | No |  |
| `token` | `list` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.IFrameCreateInstance().create({
    "account_id": "example_account_id",  # str
    "payment_iframe_id": "example_payment_iframe_id",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameCreateInstanceEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## IFrameInstanceEntity

```python
i_frame_instance = client.IFrameInstance()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.IFrameInstance().load({"id": "i_frame_instance_id", "account_id": "account_id", "payment_iframe_id": "payment_iframe_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IFrameInstanceEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## IframeEntity

```python
iframe = client.Iframe()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `dict` | No |  |
| `allowed_parent_domain` | `list` | Yes |  |
| `allowed_payment_method` | `list` | Yes |  |
| `card_setting` | `dict` | No |  |
| `click_to_pay_setting` | `dict` | No |  |
| `currency` | `str` | No |  |
| `id` | `str` | No |  |
| `label` | `str` | Yes |  |
| `language` | `str` | No |  |
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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Iframe().create({
    "account_id": "example_account_id",  # str
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Iframe().list()
for iframe in results:
    print(iframe)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Iframe().load({"account_id": "account_id", "iframe_id": "iframe_id"})
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.Iframe().update({
    "account_id": "account_id",
    "iframe_id": "iframe_id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `IframeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## InitEntity

```python
init = client.Init()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `dict` | No |  |
| `description` | `str` | No |  |
| `item` | `list` | No |  |
| `level2` | `dict` | No |  |
| `level3` | `dict` | No |  |
| `shipping_address` | `dict` | Yes |  |
| `trace` | `dict` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Init().create({
    "account_id": "example_account_id",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `InitEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```python
list_api_key_scopes_entry = client.ListApiKeyScopesEntry()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `str` | No |  |
| `description` | `str` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `int` | No |  |
| `scope` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.ListApiKeyScopesEntry().list()
for list_api_key_scopes_entry in results:
    print(list_api_key_scopes_entry)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ListApiKeyScopesEntryEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PaymentIframeEntity

```python
payment_iframe = client.PaymentIframe()
```

### Operations

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.PaymentIframe().remove({"account_id": "account_id", "id": "id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PaymentIframeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ThreeDSecureAuthEntity

```python
three_d_secure_auth = client.ThreeDSecureAuth()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `dict` | Yes |  |
| `card` | `dict` | Yes |  |
| `challenge` | `dict` | No |  |
| `customer` | `dict` | No |  |
| `purchase` | `dict` | Yes |  |
| `server_transaction_id` | `str` | No |  |
| `shipping` | `dict` | Yes |  |
| `status` | `str` | No |  |
| `three_d_secure_challenge_indicator` | `str` | No |  |
| `three_d_secure_id` | `str` | No |  |
| `trace` | `dict` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.ThreeDSecureAuth().create({
    "3_d_id": "example_3_d_id",  # str
    "account_id": "example_account_id",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureAuthEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```python
three_d_secure_browser_init = client.ThreeDSecureBrowserInit()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `str` | No |  |
| `acs_url` | `str` | No |  |
| `cvv` | `str` | No |  |
| `expiry` | `str` | Yes |  |
| `pan` | `str` | Yes |  |
| `payment_details_reference` | `str` | No |  |
| `server_transaction_id` | `str` | No |  |
| `status` | `str` | No |  |
| `three_d_secure_data` | `str` | No |  |
| `three_d_secure_id` | `str` | No |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.ThreeDSecureBrowserInit().create({
    "account_id": "example_account_id",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureBrowserInitEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ThreeDSecureStatusEntity

```python
three_d_secure_status = client.ThreeDSecureStatus()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `dict` | No |  |
| `info` | `dict` | No |  |
| `server_transaction_id` | `str` | No |  |
| `status` | `str` | No |  |
| `three_d_secure` | `dict` | No |  |
| `three_d_secure_id` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.ThreeDSecureStatus().load({"3_d_id": "3_d_id", "account_id": "account_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ThreeDSecureStatusEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TransactionDetailEntity

```python
transaction_detail = client.TransactionDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `dict` | Yes |  |
| `auth` | `dict` | Yes |  |
| `card` | `dict` | No |  |
| `customer` | `dict` | No |  |
| `description` | `str` | No |  |
| `id` | `str` | No |  |
| `item` | `list` | No |  |
| `level2` | `dict` | No |  |
| `level3` | `dict` | No |  |
| `override` | `dict` | No |  |
| `shipping_address` | `dict` | Yes |  |
| `status` | `str` | Yes |  |
| `timestamp` | `str` | No |  |
| `trace` | `dict` | No |  |

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

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.TransactionDetail().load({"account_id": "account_id", "transaction_id": "transaction_id"})
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.TransactionDetail().update({
    "account_id": "account_id",
    "transaction_id": "transaction_id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionDetailEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## WebhookEntity

```python
webhook = client.Webhook()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `str` | Yes |  |
| `id` | `str` | No |  |
| `url` | `str` | Yes |  |

### Operations

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Webhook().create({
    "account_id": "example_account_id",  # str
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Webhook().list()
for webhook in results:
    print(webhook)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Webhook().load({"id": "webhook_id", "account_id": "account_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Webhook().remove({"id": "webhook_id", "account_id": "account_id"})
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.Webhook().update({
    "id": "webhook_id",
    "account_id": "account_id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `WebhookEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = BluefinPayconexSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

