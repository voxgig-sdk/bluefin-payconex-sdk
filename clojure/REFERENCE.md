# BluefinPayconex Clojure SDK Reference

Complete API reference for the BluefinPayconex Clojure SDK.


## Client

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Create a new SDK client instance. `options` is a `voxgig.struct` map.

**Options:**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Test client

#### `(api/test-sdk testopts sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```clojure
(def client (api/test-sdk nil nil))
```


### Client functions

#### `(api/account_updater client data)`

Create a new `AccountUpdater` entity instance. Pass `nil` for no initial data.

#### `(api/account_updater_schedule client data)`

Create a new `AccountUpdaterSchedule` entity instance. Pass `nil` for no initial data.

#### `(api/account_updater_schedule_with_result client data)`

Create a new `AccountUpdaterScheduleWithResult` entity instance. Pass `nil` for no initial data.

#### `(api/account_updater_subscription_with_result client data)`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance. Pass `nil` for no initial data.

#### `(api/account_updater_update client data)`

Create a new `AccountUpdaterUpdate` entity instance. Pass `nil` for no initial data.

#### `(api/api_key client data)`

Create a new `ApiKey` entity instance. Pass `nil` for no initial data.

#### `(api/apple_pay_merchant_detail client data)`

Create a new `ApplePayMerchantDetail` entity instance. Pass `nil` for no initial data.

#### `(api/apple_pay_session client data)`

Create a new `ApplePaySession` entity instance. Pass `nil` for no initial data.

#### `(api/dynamic_descriptor client data)`

Create a new `DynamicDescriptor` entity instance. Pass `nil` for no initial data.

#### `(api/i_frame_create_instance client data)`

Create a new `IFrameCreateInstance` entity instance. Pass `nil` for no initial data.

#### `(api/i_frame_instance client data)`

Create a new `IFrameInstance` entity instance. Pass `nil` for no initial data.

#### `(api/iframe client data)`

Create a new `Iframe` entity instance. Pass `nil` for no initial data.

#### `(api/init client data)`

Create a new `Init` entity instance. Pass `nil` for no initial data.

#### `(api/list_api_key_scopes_entry client data)`

Create a new `ListApiKeyScopesEntry` entity instance. Pass `nil` for no initial data.

#### `(api/payment_iframe client data)`

Create a new `PaymentIframe` entity instance. Pass `nil` for no initial data.

#### `(api/three_d_secure_auth client data)`

Create a new `ThreeDSecureAuth` entity instance. Pass `nil` for no initial data.

#### `(api/three_d_secure_browser_init client data)`

Create a new `ThreeDSecureBrowserInit` entity instance. Pass `nil` for no initial data.

#### `(api/three_d_secure_status client data)`

Create a new `ThreeDSecureStatus` entity instance. Pass `nil` for no initial data.

#### `(api/transaction_detail client data)`

Create a new `TransactionDetail` entity instance. Pass `nil` for no initial data.

#### `(api/webhook client data)`

Create a new `Webhook` entity instance. Pass `nil` for no initial data.

#### `(api/options-map client) -> map`

Return a deep copy of the current SDK options.

#### `(api/get-utility client) -> utility`

Return a copy of the SDK utility object.

#### `(api/direct client fetchargs) -> map`

Make a direct HTTP request to any API endpoint. Returns a result `map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `(vs/getprop result "ok")`.

**Fetch args:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

**Returns:** a result `map`.

#### `(api/prepare client fetchargs) -> map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AccountUpdater

```clojure
(require '[sdk.entity.account_updater :as e-account_updater])

(def account_updater (api/account_updater client nil))
```

### Operations

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-account_updater/remove (api/account_updater client nil) (vs/jm "account_id" "account_id" "subscription_id" "subscription_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `AccountUpdater` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## AccountUpdaterSchedule

```clojure
(require '[sdk.entity.account_updater_schedule :as e-account_updater_schedule])

(def account_updater_schedule (api/account_updater_schedule client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `boolean` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `vector` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-account_updater_schedule/create (api/account_updater_schedule client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `AccountUpdaterSchedule` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## AccountUpdaterScheduleWithResult

```clojure
(require '[sdk.entity.account_updater_schedule_with_result :as e-account_updater_schedule_with_result])

(def account_updater_schedule_with_result (api/account_updater_schedule_with_result client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `vector` | Yes |  |
| `created_at` | `string` | Yes |  |
| `enabled` | `boolean` | No |  |
| `expiry` | `string` | No |  |
| `id` | `string` | Yes |  |
| `most_recent_update` | `map` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | Yes |  |
| `response_format` | `string` | No |  |
| `token` | `vector` | Yes |  |
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-account_updater_schedule_with_result/create (api/account_updater_schedule_with_result client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [account_updater_schedule_with_result (e-account_updater_schedule_with_result/list (api/account_updater_schedule_with_result client nil) nil nil)]
  (println account_updater_schedule_with_result))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `AccountUpdaterScheduleWithResult` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResult

```clojure
(require '[sdk.entity.account_updater_subscription_with_result :as e-account_updater_subscription_with_result])

(def account_updater_subscription_with_result (api/account_updater_subscription_with_result client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `string` | No |  |
| `enabled` | `boolean` | No |  |
| `id` | `string` | No |  |
| `period_date` | `string` | No |  |
| `period_id` | `string` | No |  |
| `record` | `vector` | No |  |
| `response_format` | `string` | No |  |
| `template_ref` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-account_updater_subscription_with_result/create (api/account_updater_subscription_with_result client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      "subscription_id" "example_subscription_id"  ;; string
      )
    nil))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-account_updater_subscription_with_result/load (api/account_updater_subscription_with_result client nil) (vs/jm "account_id" "account_id" "subscription_id" "subscription_id") nil))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-account_updater_subscription_with_result/update (api/account_updater_subscription_with_result client nil)
    (vs/jm
      "account_id" "account_id"
      "subscription_id" "subscription_id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `AccountUpdaterSubscriptionWithResult` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## AccountUpdaterUpdate

```clojure
(require '[sdk.entity.account_updater_update :as e-account_updater_update])

(def account_updater_update (api/account_updater_update client nil))
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
| `recurring_schedule` | `vector` | No |  |
| `status` | `string` | No |  |
| `update_id` | `string` | No |  |
| `updated_at` | `string` | No |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-account_updater_update/load (api/account_updater_update client nil) (vs/jm "id" "account_updater_update_id" "account_id" "account_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `AccountUpdaterUpdate` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## ApiKey

```clojure
(require '[sdk.entity.api_key :as e-api_key])

(def api_key (api/api_key client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `vector` | No |  |
| `enabled` | `boolean` | No |  |
| `expires_at` | `string` | No |  |
| `expires_in` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | No |  |
| `method` | `vector` | No |  |
| `scope` | `vector` | No |  |
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-api_key/create (api/api_key client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [api_key (e-api_key/list (api/api_key client nil) nil nil)]
  (println api_key))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-api_key/load (api/api_key client nil) (vs/jm "id" "api_key_id" "account_id" "account_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-api_key/remove (api/api_key client nil) (vs/jm "id" "api_key_id" "account_id" "account_id") nil))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-api_key/update (api/api_key client nil)
    (vs/jm
      "id" "api_key_id"
      "account_id" "account_id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `ApiKey` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## ApplePayMerchantDetail

```clojure
(require '[sdk.entity.apple_pay_merchant_detail :as e-apple_pay_merchant_detail])

(def apple_pay_merchant_detail (api/apple_pay_merchant_detail client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `vector` | Yes |  |
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-apple_pay_merchant_detail/create (api/apple_pay_merchant_detail client nil)
    (vs/jm
      "account_id" 1  ;; long
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [apple_pay_merchant_detail (e-apple_pay_merchant_detail/list (api/apple_pay_merchant_detail client nil) nil nil)]
  (println apple_pay_merchant_detail))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `ApplePayMerchantDetail` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## ApplePaySession

```clojure
(require '[sdk.entity.apple_pay_session :as e-apple_pay_session])

(def apple_pay_session (api/apple_pay_session client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `string` | No |  |
| `domain_name` | `string` | No |  |
| `epoch_timestamp` | `long` | No |  |
| `expires_at` | `long` | No |  |
| `merchant_identifier` | `string` | No |  |
| `merchant_session_identifier` | `string` | No |  |
| `nonce` | `long` | No |  |
| `operational_analytics_identifier` | `string` | No |  |
| `referrer` | `string` | Yes |  |
| `retry` | `long` | No |  |
| `signature` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-apple_pay_session/create (api/apple_pay_session client nil)
    (vs/jm
      "account_id" 1  ;; long
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `ApplePaySession` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DynamicDescriptor

```clojure
(require '[sdk.entity.dynamic_descriptor :as e-dynamic_descriptor])

(def dynamic_descriptor (api/dynamic_descriptor client nil))
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-dynamic_descriptor/create (api/dynamic_descriptor client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [dynamic_descriptor (e-dynamic_descriptor/list (api/dynamic_descriptor client nil) nil nil)]
  (println dynamic_descriptor))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-dynamic_descriptor/load (api/dynamic_descriptor client nil) (vs/jm "id" "dynamic_descriptor_id" "account_id" "account_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-dynamic_descriptor/remove (api/dynamic_descriptor client nil) (vs/jm "id" "dynamic_descriptor_id" "account_id" "account_id") nil))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-dynamic_descriptor/update (api/dynamic_descriptor client nil)
    (vs/jm
      "id" "dynamic_descriptor_id"
      "account_id" "account_id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DynamicDescriptor` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## IFrameCreateInstance

```clojure
(require '[sdk.entity.i_frame_create_instance :as e-i_frame_create_instance])

(def i_frame_create_instance (api/i_frame_create_instance client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `string` | No |  |
| `currency` | `string` | No |  |
| `customer` | `map` | No |  |
| `initialize_transaction` | `boolean` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
| `reference` | `string` | No |  |
| `timeout` | `double` | No |  |
| `token` | `vector` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-i_frame_create_instance/create (api/i_frame_create_instance client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      "payment_iframe_id" "example_payment_iframe_id"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `IFrameCreateInstance` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## IFrameInstance

```clojure
(require '[sdk.entity.i_frame_instance :as e-i_frame_instance])

(def i_frame_instance (api/i_frame_instance client nil))
```

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-i_frame_instance/load (api/i_frame_instance client nil) (vs/jm "id" "i_frame_instance_id" "account_id" "account_id" "payment_iframe_id" "payment_iframe_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `IFrameInstance` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Iframe

```clojure
(require '[sdk.entity.iframe :as e-iframe])

(def iframe (api/iframe client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `map` | No |  |
| `allowed_parent_domain` | `vector` | Yes |  |
| `allowed_payment_method` | `vector` | Yes |  |
| `card_setting` | `map` | No |  |
| `click_to_pay_setting` | `map` | No |  |
| `currency` | `string` | No |  |
| `id` | `string` | No |  |
| `label` | `string` | Yes |  |
| `language` | `string` | No |  |
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-iframe/create (api/iframe client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [iframe (e-iframe/list (api/iframe client nil) nil nil)]
  (println iframe))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-iframe/load (api/iframe client nil) (vs/jm "account_id" "account_id" "iframe_id" "iframe_id") nil))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-iframe/update (api/iframe client nil)
    (vs/jm
      "account_id" "account_id"
      "iframe_id" "iframe_id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Iframe` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Init

```clojure
(require '[sdk.entity.init :as e-init])

(def init (api/init client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `map` | No |  |
| `description` | `string` | No |  |
| `item` | `vector` | No |  |
| `level2` | `map` | No |  |
| `level3` | `map` | No |  |
| `shipping_address` | `map` | Yes |  |
| `trace` | `map` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-init/create (api/init client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Init` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## ListApiKeyScopesEntry

```clojure
(require '[sdk.entity.list_api_key_scopes_entry :as e-list_api_key_scopes_entry])

(def list_api_key_scopes_entry (api/list_api_key_scopes_entry client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `string` | No |  |
| `description` | `string` | No |  |
| `enabled` | `boolean` | No |  |
| `level` | `long` | No |  |
| `scope` | `string` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [list_api_key_scopes_entry (e-list_api_key_scopes_entry/list (api/list_api_key_scopes_entry client nil) nil nil)]
  (println list_api_key_scopes_entry))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `ListApiKeyScopesEntry` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## PaymentIframe

```clojure
(require '[sdk.entity.payment_iframe :as e-payment_iframe])

(def payment_iframe (api/payment_iframe client nil))
```

### Operations

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-payment_iframe/remove (api/payment_iframe client nil) (vs/jm "account_id" "account_id" "id" "id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `PaymentIframe` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## ThreeDSecureAuth

```clojure
(require '[sdk.entity.three_d_secure_auth :as e-three_d_secure_auth])

(def three_d_secure_auth (api/three_d_secure_auth client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `map` | Yes |  |
| `card` | `map` | Yes |  |
| `challenge` | `map` | No |  |
| `customer` | `map` | No |  |
| `purchase` | `map` | Yes |  |
| `server_transaction_id` | `string` | No |  |
| `shipping` | `map` | Yes |  |
| `status` | `string` | No |  |
| `three_d_secure_challenge_indicator` | `string` | No |  |
| `three_d_secure_id` | `string` | No |  |
| `trace` | `map` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-three_d_secure_auth/create (api/three_d_secure_auth client nil)
    (vs/jm
      "3_d_id" "example_3_d_id"  ;; string
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `ThreeDSecureAuth` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## ThreeDSecureBrowserInit

```clojure
(require '[sdk.entity.three_d_secure_browser_init :as e-three_d_secure_browser_init])

(def three_d_secure_browser_init (api/three_d_secure_browser_init client nil))
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-three_d_secure_browser_init/create (api/three_d_secure_browser_init client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `ThreeDSecureBrowserInit` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## ThreeDSecureStatus

```clojure
(require '[sdk.entity.three_d_secure_status :as e-three_d_secure_status])

(def three_d_secure_status (api/three_d_secure_status client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `map` | No |  |
| `info` | `map` | No |  |
| `server_transaction_id` | `string` | No |  |
| `status` | `string` | No |  |
| `three_d_secure` | `map` | No |  |
| `three_d_secure_id` | `string` | No |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-three_d_secure_status/load (api/three_d_secure_status client nil) (vs/jm "3_d_id" "3_d_id" "account_id" "account_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `ThreeDSecureStatus` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## TransactionDetail

```clojure
(require '[sdk.entity.transaction_detail :as e-transaction_detail])

(def transaction_detail (api/transaction_detail client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `map` | Yes |  |
| `auth` | `map` | Yes |  |
| `card` | `map` | No |  |
| `customer` | `map` | No |  |
| `description` | `string` | No |  |
| `id` | `string` | No |  |
| `item` | `vector` | No |  |
| `level2` | `map` | No |  |
| `level3` | `map` | No |  |
| `override` | `map` | No |  |
| `shipping_address` | `map` | Yes |  |
| `status` | `string` | Yes |  |
| `timestamp` | `string` | No |  |
| `trace` | `map` | No |  |

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

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-transaction_detail/load (api/transaction_detail client nil) (vs/jm "account_id" "account_id" "transaction_id" "transaction_id") nil))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-transaction_detail/update (api/transaction_detail client nil)
    (vs/jm
      "account_id" "account_id"
      "transaction_id" "transaction_id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `TransactionDetail` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Webhook

```clojure
(require '[sdk.entity.webhook :as e-webhook])

(def webhook (api/webhook client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `string` | Yes |  |
| `id` | `string` | No |  |
| `url` | `string` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-webhook/create (api/webhook client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [webhook (e-webhook/list (api/webhook client nil) nil nil)]
  (println webhook))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-webhook/load (api/webhook client nil) (vs/jm "id" "webhook_id" "account_id" "account_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-webhook/remove (api/webhook client nil) (vs/jm "id" "webhook_id" "account_id" "account_id") nil))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-webhook/update (api/webhook client nil)
    (vs/jm
      "id" "webhook_id"
      "account_id" "account_id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Webhook` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```clojure
(def client
  (api/make-sdk
    (vs/jm "feature"
      (vs/jm
        "test" (vs/jm "active" true)
        ))))
```

