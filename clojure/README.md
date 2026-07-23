# BluefinPayconex Clojure SDK



The Clojure SDK for the BluefinPayconex API — an entity-oriented client
following idiomatic Clojure conventions (plain functions, immutable data, and
the vendored `voxgig.struct` value model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `(api/account_updater client nil)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Clojars. Depend on it directly from the
GitHub release tag (`clojure/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)),
using a `tools.deps` git dependency:

```clojure
;; deps.edn
{:deps {bluefinpayconex/sdk
        {:git/url "https://github.com/voxgig-sdk/bluefin-payconex-sdk"
         :git/tag "clojure/vX.Y.Z"
         :git/sha "..."
         :deps/root "clojure"}}}
```

Or from a local source checkout:

```clojure
;; deps.edn
{:deps {bluefinpayconex/sdk {:local/root "../clojure"}}}
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.account_updater :as e-account_updater]
         '[sdk.entity.account_updater_subscription_with_result :as e-account_updater_subscription_with_result]
         '[voxgig.struct :as vs])

(def client (api/make-sdk (vs/jm "apikey" (System/getenv "BLUEFIN_PAYCONEX_APIKEY"))))
```

### 3. Load an account_updater_subscription_with_result

AccountUpdaterSubscriptionWithResult is nested under account, so provide the
`account_id`. `load` returns the bare record (a map) and raises on error.

```clojure
(try
  (let [account_updater_subscription_with_result (e-account_updater_subscription_with_result/load (api/account_updater_subscription_with_result client nil) (vs/jm "account_id" "example_account_id" "subscription_id" "example_subscription_id") nil)]
    (println account_updater_subscription_with_result))
  (catch Exception err
    (println "load failed:" (.getMessage err))))
```

### 4. Create, update, and remove

```clojure
;; Remove
(e-account_updater/remove (api/account_updater client nil) (vs/jm "account_id" "example_account_id" "subscription_id" "example_subscription_id") nil)
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

```clojure
(def result
  (api/direct client
    (vs/jm "path" "/api/resource/{id}"
           "method" "GET"
           "params" (vs/jm "id" "example"))))

(if (vs/getprop result "ok")
  (do
    (println (vs/getprop result "status"))  ;; 200
    (println (vs/getprop result "data")))   ;; response body
  ;; A non-2xx response carries status + data (the error body); a
  ;; transport-level failure carries err instead. Only one is present.
  (println (vs/getprop result "status") (vs/getprop result "err")))
```

### Prepare a request without sending it

```clojure
;; prepare returns the fetch definition and raises on error.
(def fetchdef
  (api/prepare client
    (vs/jm "path" "/api/resource/{id}"
           "method" "DELETE"
           "params" (vs/jm "id" "example"))))

(println (vs/getprop fetchdef "url"))
(println (vs/getprop fetchdef "method"))
(println (vs/getprop fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.three_d_secure_status :as e-three_d_secure_status]
         '[voxgig.struct :as vs])

(def client (api/test-sdk nil nil))

;; Entity ops return the bare record and raise on error.
(def three_d_secure_status (e-three_d_secure_status/load (api/three_d_secure_status client nil) nil nil))
;; three_d_secure_status contains the mock response record
(println three_d_secure_status)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. A fetch fn takes the
URL and fetch definition and returns a `[response err]` pair; `response`
is a struct map carrying `status`, `headers`, and a `json` thunk:

```clojure
(defn mock-fetch [url fetchdef]
  [(vs/jm "status" 200
          "statusText" "OK"
          "headers" (vs/jm)
          "json" (fn [] (vs/jm "id" "mock01")))
   nil])

(def client
  (api/make-sdk
    (vs/jm "base" "http://localhost:8080"
           "system" (vs/jm "fetch" mock-fetch))))
```

### Run the test suite

The generated suite (pipeline, features, netsim, primary utility and the
vendored struct corpus) runs offline through a single `tools.deps` entry
point:

```bash
cd clojure && make test
```

To exercise the SDK against the live API, construct a client with real
credentials and call its operations directly.


## Reference

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Creates a new SDK client. `options` is a `voxgig.struct` map (or `nil`).

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `vector` | Additional feature atoms to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` fn). |

### test-sdk

```clojure
(def client (api/test-sdk testopts sdkopts))
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `options-map` | `(client) -> map` | Deep copy of current SDK options. |
| `get-utility` | `(client) -> utility` | Copy of the SDK utility object. |
| `prepare` | `(client fetchargs) -> map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client fetchargs) -> map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `account_updater` | `(client data) -> AccountUpdater entity` | Create an AccountUpdater entity instance. |
| `account_updater_schedule` | `(client data) -> AccountUpdaterSchedule entity` | Create an AccountUpdaterSchedule entity instance. |
| `account_updater_schedule_with_result` | `(client data) -> AccountUpdaterScheduleWithResult entity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `account_updater_subscription_with_result` | `(client data) -> AccountUpdaterSubscriptionWithResult entity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `account_updater_update` | `(client data) -> AccountUpdaterUpdate entity` | Create an AccountUpdaterUpdate entity instance. |
| `api_key` | `(client data) -> ApiKey entity` | Create an ApiKey entity instance. |
| `apple_pay_merchant_detail` | `(client data) -> ApplePayMerchantDetail entity` | Create an ApplePayMerchantDetail entity instance. |
| `apple_pay_session` | `(client data) -> ApplePaySession entity` | Create an ApplePaySession entity instance. |
| `dynamic_descriptor` | `(client data) -> DynamicDescriptor entity` | Create a DynamicDescriptor entity instance. |
| `i_frame_create_instance` | `(client data) -> IFrameCreateInstance entity` | Create an IFrameCreateInstance entity instance. |
| `i_frame_instance` | `(client data) -> IFrameInstance entity` | Create an IFrameInstance entity instance. |
| `iframe` | `(client data) -> Iframe entity` | Create an Iframe entity instance. |
| `init` | `(client data) -> Init entity` | Create an Init entity instance. |
| `list_api_key_scopes_entry` | `(client data) -> ListApiKeyScopesEntry entity` | Create a ListApiKeyScopesEntry entity instance. |
| `payment_iframe` | `(client data) -> PaymentIframe entity` | Create a PaymentIframe entity instance. |
| `three_d_secure_auth` | `(client data) -> ThreeDSecureAuth entity` | Create a ThreeDSecureAuth entity instance. |
| `three_d_secure_browser_init` | `(client data) -> ThreeDSecureBrowserInit entity` | Create a ThreeDSecureBrowserInit entity instance. |
| `three_d_secure_status` | `(client data) -> ThreeDSecureStatus entity` | Create a ThreeDSecureStatus entity instance. |
| `transaction_detail` | `(client data) -> TransactionDetail entity` | Create a TransactionDetail entity instance. |
| `webhook` | `(client data) -> Webhook entity` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface. Operations are functions in the
entity namespace (`sdk.entity.<name>`); state accessors are stored on the
entity map and are called via keyword lookup.

| Member | Signature | Description |
| --- | --- | --- |
| `load` | `(ent reqmatch ctrl) -> map` | Load a single entity by match criteria. Raises on error. |
| `list` | `(ent reqmatch ctrl) -> vector` | List entities matching the criteria. Raises on error. |
| `create` | `(ent reqdata ctrl) -> map` | Create a new entity. Raises on error. |
| `update` | `(ent reqdata ctrl) -> map` | Update an existing entity. Raises on error. |
| `remove` | `(ent reqmatch ctrl) -> map` | Remove an entity. Raises on error. |
| `:data-get` | `() -> map` | Get entity data. |
| `:data-set` | `(data)` | Set entity data. |
| `:match-get` | `() -> map` | Get entity match criteria. |
| `:match-set` | `(match)` | Set entity match criteria. |
| `:make` | `() -> entity` | Create a new instance with the same options. |
| `:get-name` | `() -> string` | Return the entity name. |

State accessors are called by looking up the fn and applying it, e.g.
`((:data-get ent))` or `((:data-set ent) (vs/jm "k" "v"))`.

### Result shape

Entity operations return the bare result data (a `map` for single-entity
ops, a `vector` for `list`) and raise (via `ex-info`) on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct` escape hatch never raises — it returns a result `map` you
branch on via `(vs/getprop result "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | `true` if the HTTP status is 2xx. |
| `status` | `long` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Create an instance: `(def account_updater (api/account_updater client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(remove ent match ctrl)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `(def account_updater_schedule (api/account_updater_schedule client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `boolean` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `vector` |  |

#### Example: Create

```clojure
(def account_updater_schedule
  (e-account_updater_schedule/create (api/account_updater_schedule client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### AccountUpdaterScheduleWithResult

Create an instance: `(def account_updater_schedule_with_result (api/account_updater_schedule_with_result client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `vector` |  |
| `created_at` | `string` |  |
| `enabled` | `boolean` |  |
| `expiry` | `string` |  |
| `id` | `string` |  |
| `most_recent_update` | `map` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `vector` |  |
| `type` | `string` |  |
| `updated_at` | `string` |  |

#### Example: List

```clojure
(def account_updater_schedule_with_results (e-account_updater_schedule_with_result/list (api/account_updater_schedule_with_result client nil) nil nil))
```

#### Example: Create

```clojure
(def account_updater_schedule_with_result
  (e-account_updater_schedule_with_result/create (api/account_updater_schedule_with_result client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `(def account_updater_subscription_with_result (api/account_updater_subscription_with_result client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `string` |  |
| `enabled` | `boolean` |  |
| `id` | `string` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `record` | `vector` |  |
| `response_format` | `string` |  |
| `template_ref` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```clojure
(def account_updater_subscription_with_result (e-account_updater_subscription_with_result/load (api/account_updater_subscription_with_result client nil) (vs/jm "account_id" "account_id" "subscription_id" "subscription_id") nil))
```

#### Example: Create

```clojure
(def account_updater_subscription_with_result
  (e-account_updater_subscription_with_result/create (api/account_updater_subscription_with_result client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      "subscription_id" "example_subscription_id"  ;; string
      )
    nil))
```


### AccountUpdaterUpdate

Create an instance: `(def account_updater_update (api/account_updater_update client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

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
| `recurring_schedule` | `vector` |  |
| `status` | `string` |  |
| `update_id` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```clojure
(def account_updater_update (e-account_updater_update/load (api/account_updater_update client nil) (vs/jm "id" "account_updater_update_id" "account_id" "account_id") nil))
```


### ApiKey

Create an instance: `(def api_key (api/api_key client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `vector` |  |
| `enabled` | `boolean` |  |
| `expires_at` | `string` |  |
| `expires_in` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `method` | `vector` |  |
| `scope` | `vector` |  |
| `secret` | `string` |  |

#### Example: Load

```clojure
(def api_key (e-api_key/load (api/api_key client nil) (vs/jm "id" "api_key_id" "account_id" "account_id") nil))
```

#### Example: List

```clojure
(def api_keys (e-api_key/list (api/api_key client nil) nil nil))
```

#### Example: Create

```clojure
(def api_key
  (e-api_key/create (api/api_key client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### ApplePayMerchantDetail

Create an instance: `(def apple_pay_merchant_detail (api/apple_pay_merchant_detail client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `vector` |  |
| `merchant_url` | `string` |  |
| `partner_merchant_name` | `string` |  |
| `payconex_account_id` | `string` |  |

#### Example: List

```clojure
(def apple_pay_merchant_details (e-apple_pay_merchant_detail/list (api/apple_pay_merchant_detail client nil) nil nil))
```

#### Example: Create

```clojure
(def apple_pay_merchant_detail
  (e-apple_pay_merchant_detail/create (api/apple_pay_merchant_detail client nil)
    (vs/jm
      "account_id" 1  ;; long
      )
    nil))
```


### ApplePaySession

Create an instance: `(def apple_pay_session (api/apple_pay_session client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `string` |  |
| `domain_name` | `string` |  |
| `epoch_timestamp` | `long` |  |
| `expires_at` | `long` |  |
| `merchant_identifier` | `string` |  |
| `merchant_session_identifier` | `string` |  |
| `nonce` | `long` |  |
| `operational_analytics_identifier` | `string` |  |
| `referrer` | `string` |  |
| `retry` | `long` |  |
| `signature` | `string` |  |

#### Example: Create

```clojure
(def apple_pay_session
  (e-apple_pay_session/create (api/apple_pay_session client nil)
    (vs/jm
      "account_id" 1  ;; long
      )
    nil))
```


### DynamicDescriptor

Create an instance: `(def dynamic_descriptor (api/dynamic_descriptor client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `string` |  |
| `descriptor` | `string` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `state` | `string` |  |

#### Example: Load

```clojure
(def dynamic_descriptor (e-dynamic_descriptor/load (api/dynamic_descriptor client nil) (vs/jm "id" "dynamic_descriptor_id" "account_id" "account_id") nil))
```

#### Example: List

```clojure
(def dynamic_descriptors (e-dynamic_descriptor/list (api/dynamic_descriptor client nil) nil nil))
```

#### Example: Create

```clojure
(def dynamic_descriptor
  (e-dynamic_descriptor/create (api/dynamic_descriptor client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### IFrameCreateInstance

Create an instance: `(def i_frame_create_instance (api/i_frame_create_instance client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `string` |  |
| `currency` | `string` |  |
| `customer` | `map` |  |
| `initialize_transaction` | `boolean` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `reference` | `string` |  |
| `timeout` | `double` |  |
| `token` | `vector` |  |

#### Example: Create

```clojure
(def i_frame_create_instance
  (e-i_frame_create_instance/create (api/i_frame_create_instance client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      "payment_iframe_id" "example_payment_iframe_id"  ;; string
      )
    nil))
```


### IFrameInstance

Create an instance: `(def i_frame_instance (api/i_frame_instance client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```clojure
(def i_frame_instance (e-i_frame_instance/load (api/i_frame_instance client nil) (vs/jm "id" "i_frame_instance_id" "account_id" "account_id" "payment_iframe_id" "payment_iframe_id") nil))
```


### Iframe

Create an instance: `(def iframe (api/iframe client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `map` |  |
| `allowed_parent_domain` | `vector` |  |
| `allowed_payment_method` | `vector` |  |
| `card_setting` | `map` |  |
| `click_to_pay_setting` | `map` |  |
| `currency` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `timeout` | `double` |  |

#### Example: Load

```clojure
(def iframe (e-iframe/load (api/iframe client nil) (vs/jm "account_id" "account_id" "iframe_id" "iframe_id") nil))
```

#### Example: List

```clojure
(def iframes (e-iframe/list (api/iframe client nil) nil nil))
```

#### Example: Create

```clojure
(def iframe
  (e-iframe/create (api/iframe client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### Init

Create an instance: `(def init (api/init client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `map` |  |
| `description` | `string` |  |
| `item` | `vector` |  |
| `level2` | `map` |  |
| `level3` | `map` |  |
| `shipping_address` | `map` |  |
| `trace` | `map` |  |

#### Example: Create

```clojure
(def init
  (e-init/create (api/init client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### ListApiKeyScopesEntry

Create an instance: `(def list_api_key_scopes_entry (api/list_api_key_scopes_entry client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `string` |  |
| `description` | `string` |  |
| `enabled` | `boolean` |  |
| `level` | `long` |  |
| `scope` | `string` |  |

#### Example: List

```clojure
(def list_api_key_scopes_entrys (e-list_api_key_scopes_entry/list (api/list_api_key_scopes_entry client nil) nil nil))
```


### PaymentIframe

Create an instance: `(def payment_iframe (api/payment_iframe client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(remove ent match ctrl)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `(def three_d_secure_auth (api/three_d_secure_auth client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `map` |  |
| `card` | `map` |  |
| `challenge` | `map` |  |
| `customer` | `map` |  |
| `purchase` | `map` |  |
| `server_transaction_id` | `string` |  |
| `shipping` | `map` |  |
| `status` | `string` |  |
| `three_d_secure_challenge_indicator` | `string` |  |
| `three_d_secure_id` | `string` |  |
| `trace` | `map` |  |

#### Example: Create

```clojure
(def three_d_secure_auth
  (e-three_d_secure_auth/create (api/three_d_secure_auth client nil)
    (vs/jm
      "3_d_id" "example_3_d_id"  ;; string
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### ThreeDSecureBrowserInit

Create an instance: `(def three_d_secure_browser_init (api/three_d_secure_browser_init client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

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

```clojure
(def three_d_secure_browser_init
  (e-three_d_secure_browser_init/create (api/three_d_secure_browser_init client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
```


### ThreeDSecureStatus

Create an instance: `(def three_d_secure_status (api/three_d_secure_status client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `map` |  |
| `info` | `map` |  |
| `server_transaction_id` | `string` |  |
| `status` | `string` |  |
| `three_d_secure` | `map` |  |
| `three_d_secure_id` | `string` |  |

#### Example: Load

```clojure
(def three_d_secure_status (e-three_d_secure_status/load (api/three_d_secure_status client nil) (vs/jm "3_d_id" "3_d_id" "account_id" "account_id") nil))
```


### TransactionDetail

Create an instance: `(def transaction_detail (api/transaction_detail client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `map` |  |
| `auth` | `map` |  |
| `card` | `map` |  |
| `customer` | `map` |  |
| `description` | `string` |  |
| `id` | `string` |  |
| `item` | `vector` |  |
| `level2` | `map` |  |
| `level3` | `map` |  |
| `override` | `map` |  |
| `shipping_address` | `map` |  |
| `status` | `string` |  |
| `timestamp` | `string` |  |
| `trace` | `map` |  |

#### Example: Load

```clojure
(def transaction_detail (e-transaction_detail/load (api/transaction_detail client nil) (vs/jm "account_id" "account_id" "transaction_id" "transaction_id") nil))
```


### Webhook

Create an instance: `(def webhook (api/webhook client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `string` |  |
| `id` | `string` |  |
| `url` | `string` |  |

#### Example: Load

```clojure
(def webhook (e-webhook/load (api/webhook client nil) (vs/jm "id" "webhook_id" "account_id" "account_id") nil))
```

#### Example: List

```clojure
(def webhooks (e-webhook/list (api/webhook client nil) nil nil))
```

#### Example: Create

```clojure
(def webhook
  (e-webhook/create (api/webhook client nil)
    (vs/jm
      "account_id" "example_account_id"  ;; string
      )
    nil))
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

### Data as struct value maps

The Clojure SDK represents API data with the vendored `voxgig.struct`
value model (ordered, Java-backed maps and lists) rather than typed
records. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with `(vs/jm "k" v ...)` and lists with
`(vs/jt v ...)`; read values with `(vs/getprop m "k")`. Use
`(vs/ismap x)` to safely check that a value is a map.

### Namespace structure

```
clojure/
├── src/sdk/api.clj        -- public API namespace (entity accessors)
├── src/sdk/client.clj     -- client constructors (make-sdk, test-sdk)
├── src/sdk/config.clj     -- generated configuration
├── src/sdk/core.clj       -- core types, context and pipeline
├── src/sdk/features.clj   -- feature factory
├── src/sdk/entity/        -- entity namespaces (one per entity)
├── src/voxgig/struct.clj  -- vendored struct value library
└── test/                  -- test suites
```

Require `[sdk.api :as api]` for the public surface, and an entity
namespace (e.g. `[sdk.entity.bluefinpayconex :as e-bluefinpayconex]`)
only when you call its operations directly.

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
