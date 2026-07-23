# BluefinPayconex Golang SDK



The Golang SDK for the BluefinPayconex API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.AccountUpdater(nil)` — each with the same small set of operations (`List`, `Load`, `Create`, `Update`, `Remove`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/bluefin-payconex-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/bluefin-payconex-sdk/go=../bluefin-payconex-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    "os"
    sdk "github.com/voxgig-sdk/bluefin-payconex-sdk/go"
)

func main() {
    client := sdk.NewBluefinPayconexSDK(map[string]any{
        "apikey": os.Getenv("BLUEFIN_PAYCONEX_APIKEY"),
    })

    // Remove a accountUpdater.
    removed, err := client.AccountUpdater(nil).Remove(map[string]any{"account_id": "example_account_id", "subscription_id": "example_subscription_id"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(removed)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
threedsecurestatus, err := client.ThreeDSecureStatus(nil).Load(map[string]any{"3_d_id": "example", "account_id": "example"}, nil)
if err != nil {
    // handle err
    return
}
_ = threedsecurestatus
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

threeDSecureStatus, err := client.ThreeDSecureStatus(nil).Load(
    map[string]any{"3_d_id": "example", "account_id": "example"}, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(threeDSecureStatus) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewBluefinPayconexSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
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
cd go && go test ./test/...
```


## Reference

### NewBluefinPayconexSDK

```go
func NewBluefinPayconexSDK(options map[string]any) *BluefinPayconexSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"apikey"` | `string` | API key for authentication. |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *BluefinPayconexSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `AccountUpdater` | `(data map[string]any) BluefinPayconexEntity` | Create an AccountUpdater entity instance. |
| `AccountUpdaterSchedule` | `(data map[string]any) BluefinPayconexEntity` | Create an AccountUpdaterSchedule entity instance. |
| `AccountUpdaterScheduleWithResult` | `(data map[string]any) BluefinPayconexEntity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `AccountUpdaterSubscriptionWithResult` | `(data map[string]any) BluefinPayconexEntity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `AccountUpdaterUpdate` | `(data map[string]any) BluefinPayconexEntity` | Create an AccountUpdaterUpdate entity instance. |
| `ApiKey` | `(data map[string]any) BluefinPayconexEntity` | Create an ApiKey entity instance. |
| `ApplePayMerchantDetail` | `(data map[string]any) BluefinPayconexEntity` | Create an ApplePayMerchantDetail entity instance. |
| `ApplePaySession` | `(data map[string]any) BluefinPayconexEntity` | Create an ApplePaySession entity instance. |
| `DynamicDescriptor` | `(data map[string]any) BluefinPayconexEntity` | Create a DynamicDescriptor entity instance. |
| `IFrameCreateInstance` | `(data map[string]any) BluefinPayconexEntity` | Create an IFrameCreateInstance entity instance. |
| `IFrameInstance` | `(data map[string]any) BluefinPayconexEntity` | Create an IFrameInstance entity instance. |
| `Iframe` | `(data map[string]any) BluefinPayconexEntity` | Create an Iframe entity instance. |
| `Init` | `(data map[string]any) BluefinPayconexEntity` | Create an Init entity instance. |
| `ListApiKeyScopesEntry` | `(data map[string]any) BluefinPayconexEntity` | Create a ListApiKeyScopesEntry entity instance. |
| `PaymentIframe` | `(data map[string]any) BluefinPayconexEntity` | Create a PaymentIframe entity instance. |
| `ThreeDSecureAuth` | `(data map[string]any) BluefinPayconexEntity` | Create a ThreeDSecureAuth entity instance. |
| `ThreeDSecureBrowserInit` | `(data map[string]any) BluefinPayconexEntity` | Create a ThreeDSecureBrowserInit entity instance. |
| `ThreeDSecureStatus` | `(data map[string]any) BluefinPayconexEntity` | Create a ThreeDSecureStatus entity instance. |
| `TransactionDetail` | `(data map[string]any) BluefinPayconexEntity` | Create a TransactionDetail entity instance. |
| `Webhook` | `(data map[string]any) BluefinPayconexEntity` | Create a Webhook entity instance. |

### Entity interface (BluefinPayconexEntity)

All entities implement the `BluefinPayconexEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Update` | `(reqdata, ctrl map[string]any) (any, error)` | Update an existing entity. |
| `Remove` | `(reqmatch, ctrl map[string]any) (any, error)` | Remove an entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` / `Update` / `Remove` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    accountUpdater, err := client.AccountUpdater(nil).Remove(nil, nil)
    if err != nil { /* handle */ }
    // accountUpdater is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### AccountUpdater

| Field | Description |
| --- | --- |

Operations: Remove.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/records/{recordId}`

#### AccountUpdaterSchedule

| Field | Description |
| --- | --- |
| `"enabled"` |  |
| `"period_date"` |  |
| `"period_id"` |  |
| `"response_format"` |  |
| `"token"` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/account-updater/payconex/subscribe`

#### AccountUpdaterScheduleWithResult

| Field | Description |
| --- | --- |
| `"card"` |  |
| `"created_at"` |  |
| `"enabled"` |  |
| `"expiry"` |  |
| `"id"` |  |
| `"most_recent_update"` |  |
| `"period_date"` |  |
| `"period_id"` |  |
| `"response_format"` |  |
| `"token"` |  |
| `"type"` |  |
| `"updated_at"` |  |

Operations: Create, List.

API path: `/api/v4/accounts/{accountId}/account-updater/pan/subscribe`

#### AccountUpdaterSubscriptionWithResult

| Field | Description |
| --- | --- |
| `"created_at"` |  |
| `"enabled"` |  |
| `"id"` |  |
| `"period_date"` |  |
| `"period_id"` |  |
| `"record"` |  |
| `"response_format"` |  |
| `"template_ref"` |  |
| `"updated_at"` |  |

Operations: Create, Load, Update.

API path: `/api/v4/accounts/{account}/account-updater/subscriptions/{subscriptionId}/pan`

#### AccountUpdaterUpdate

| Field | Description |
| --- | --- |
| `"account_updater_schedule_record_id"` |  |
| `"format"` |  |
| `"id"` |  |
| `"new_expiry"` |  |
| `"new_token"` |  |
| `"old_expiry"` |  |
| `"old_token"` |  |
| `"recurring_schedule"` |  |
| `"status"` |  |
| `"update_id"` |  |
| `"updated_at"` |  |

Operations: Load.

API path: `/api/v4/accounts/{account}/account-updater/updates/{updateId}`

#### ApiKey

| Field | Description |
| --- | --- |
| `"account"` |  |
| `"enabled"` |  |
| `"expires_at"` |  |
| `"expires_in"` |  |
| `"id"` |  |
| `"label"` |  |
| `"method"` |  |
| `"scope"` |  |
| `"secret"` |  |

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/api-keys`

#### ApplePayMerchantDetail

| Field | Description |
| --- | --- |
| `"domain"` |  |
| `"merchant_url"` |  |
| `"partner_merchant_name"` |  |
| `"payconex_account_id"` |  |

Operations: Create, List.

API path: `/api/v4/accounts/{accountId}/applePay/enrollment`

#### ApplePaySession

| Field | Description |
| --- | --- |
| `"display_name"` |  |
| `"domain_name"` |  |
| `"epoch_timestamp"` |  |
| `"expires_at"` |  |
| `"merchant_identifier"` |  |
| `"merchant_session_identifier"` |  |
| `"nonce"` |  |
| `"operational_analytics_identifier"` |  |
| `"referrer"` |  |
| `"retry"` |  |
| `"signature"` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/applePay/session`

#### DynamicDescriptor

| Field | Description |
| --- | --- |
| `"city"` |  |
| `"descriptor"` |  |
| `"id"` |  |
| `"name"` |  |
| `"state"` |  |

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/dynamic_descriptors`

#### IFrameCreateInstance

| Field | Description |
| --- | --- |
| `"amount"` |  |
| `"currency"` |  |
| `"customer"` |  |
| `"initialize_transaction"` |  |
| `"label"` |  |
| `"language"` |  |
| `"reference"` |  |
| `"timeout"` |  |
| `"token"` |  |

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
| `"ach_setting"` |  |
| `"allowed_parent_domain"` |  |
| `"allowed_payment_method"` |  |
| `"card_setting"` |  |
| `"click_to_pay_setting"` |  |
| `"currency"` |  |
| `"id"` |  |
| `"label"` |  |
| `"language"` |  |
| `"timeout"` |  |

Operations: Create, List, Load, Update.

API path: `/api/v4/accounts/{accountId}/payment-iframe`

#### Init

| Field | Description |
| --- | --- |
| `"customer"` |  |
| `"description"` |  |
| `"item"` |  |
| `"level2"` |  |
| `"level3"` |  |
| `"shipping_address"` |  |
| `"trace"` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/payments/init`

#### ListApiKeyScopesEntry

| Field | Description |
| --- | --- |
| `"category"` |  |
| `"description"` |  |
| `"enabled"` |  |
| `"level"` |  |
| `"scope"` |  |

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
| `"browser"` |  |
| `"card"` |  |
| `"challenge"` |  |
| `"customer"` |  |
| `"purchase"` |  |
| `"server_transaction_id"` |  |
| `"shipping"` |  |
| `"status"` |  |
| `"three_d_secure_challenge_indicator"` |  |
| `"three_d_secure_id"` |  |
| `"trace"` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/3DS/{resourceId}/browser-authenticate`

#### ThreeDSecureBrowserInit

| Field | Description |
| --- | --- |
| `"acs_result_url"` |  |
| `"acs_url"` |  |
| `"cvv"` |  |
| `"expiry"` |  |
| `"pan"` |  |
| `"payment_details_reference"` |  |
| `"server_transaction_id"` |  |
| `"status"` |  |
| `"three_d_secure_data"` |  |
| `"three_d_secure_id"` |  |

Operations: Create.

API path: `/api/v4/accounts/{accountId}/3DS/init-card-details`

#### ThreeDSecureStatus

| Field | Description |
| --- | --- |
| `"error"` |  |
| `"info"` |  |
| `"server_transaction_id"` |  |
| `"status"` |  |
| `"three_d_secure"` |  |
| `"three_d_secure_id"` |  |

Operations: Load.

API path: `/api/v4/accounts/{accountId}/3DS/{resourceId}/status`

#### TransactionDetail

| Field | Description |
| --- | --- |
| `"amount"` |  |
| `"auth"` |  |
| `"card"` |  |
| `"customer"` |  |
| `"description"` |  |
| `"id"` |  |
| `"item"` |  |
| `"level2"` |  |
| `"level3"` |  |
| `"override"` |  |
| `"shipping_address"` |  |
| `"status"` |  |
| `"timestamp"` |  |
| `"trace"` |  |

Operations: Load, Update.

API path: `/api/v4/accounts/{accountId}/payments/{transactionId}`

#### Webhook

| Field | Description |
| --- | --- |
| `"event"` |  |
| `"id"` |  |
| `"url"` |  |

Operations: Create, List, Load, Remove, Update.

API path: `/api/v4/accounts/{accountId}/webhooks`



## Entities


### AccountUpdater

Create an instance: `accountUpdater := client.AccountUpdater(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Remove(match, ctrl)` | Remove the matching entity. |


### AccountUpdaterSchedule

Create an instance: `accountUpdaterSchedule := client.AccountUpdaterSchedule(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `[]any` |  |

#### Example: Create

```go
result, err := client.AccountUpdaterSchedule(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### AccountUpdaterScheduleWithResult

Create an instance: `accountUpdaterScheduleWithResult := client.AccountUpdaterScheduleWithResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `[]any` |  |
| `created_at` | `string` |  |
| `enabled` | `bool` |  |
| `expiry` | `string` |  |
| `id` | `string` |  |
| `most_recent_update` | `map[string]any` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `response_format` | `string` |  |
| `token` | `[]any` |  |
| `type` | `string` |  |
| `updated_at` | `string` |  |

#### Example: List

```go
accountUpdaterScheduleWithResults, err := client.AccountUpdaterScheduleWithResult(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(accountUpdaterScheduleWithResults) // the array of records
```

#### Example: Create

```go
result, err := client.AccountUpdaterScheduleWithResult(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `accountUpdaterSubscriptionWithResult := client.AccountUpdaterSubscriptionWithResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `string` |  |
| `enabled` | `bool` |  |
| `id` | `string` |  |
| `period_date` | `string` |  |
| `period_id` | `string` |  |
| `record` | `[]any` |  |
| `response_format` | `string` |  |
| `template_ref` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```go
accountUpdaterSubscriptionWithResult, err := client.AccountUpdaterSubscriptionWithResult(nil).Load(map[string]any{"account_id": "account_id", "subscription_id": "subscription_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(accountUpdaterSubscriptionWithResult) // the loaded record
```

#### Example: Create

```go
result, err := client.AccountUpdaterSubscriptionWithResult(nil).Create(map[string]any{
    "account_id": "example_account_id",
    "subscription_id": "example_subscription_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### AccountUpdaterUpdate

Create an instance: `accountUpdaterUpdate := client.AccountUpdaterUpdate(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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
| `recurring_schedule` | `[]any` |  |
| `status` | `string` |  |
| `update_id` | `string` |  |
| `updated_at` | `string` |  |

#### Example: Load

```go
accountUpdaterUpdate, err := client.AccountUpdaterUpdate(nil).Load(map[string]any{"id": "account_updater_update_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(accountUpdaterUpdate) // the loaded record
```


### ApiKey

Create an instance: `apiKey := client.ApiKey(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Update(data, ctrl)` | Update an existing entity. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `[]any` |  |
| `enabled` | `bool` |  |
| `expires_at` | `string` |  |
| `expires_in` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `method` | `[]any` |  |
| `scope` | `[]any` |  |
| `secret` | `string` |  |

#### Example: Load

```go
apiKey, err := client.ApiKey(nil).Load(map[string]any{"id": "api_key_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(apiKey) // the loaded record
```

#### Example: List

```go
apiKeys, err := client.ApiKey(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(apiKeys) // the array of records
```

#### Example: Create

```go
result, err := client.ApiKey(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### ApplePayMerchantDetail

Create an instance: `applePayMerchantDetail := client.ApplePayMerchantDetail(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `[]any` |  |
| `merchant_url` | `string` |  |
| `partner_merchant_name` | `string` |  |
| `payconex_account_id` | `string` |  |

#### Example: List

```go
applePayMerchantDetails, err := client.ApplePayMerchantDetail(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(applePayMerchantDetails) // the array of records
```

#### Example: Create

```go
result, err := client.ApplePayMerchantDetail(nil).Create(map[string]any{
    "account_id": 1,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### ApplePaySession

Create an instance: `applePaySession := client.ApplePaySession(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

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

```go
result, err := client.ApplePaySession(nil).Create(map[string]any{
    "account_id": 1,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### DynamicDescriptor

Create an instance: `dynamicDescriptor := client.DynamicDescriptor(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Update(data, ctrl)` | Update an existing entity. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `string` |  |
| `descriptor` | `string` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `state` | `string` |  |

#### Example: Load

```go
dynamicDescriptor, err := client.DynamicDescriptor(nil).Load(map[string]any{"id": "dynamic_descriptor_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(dynamicDescriptor) // the loaded record
```

#### Example: List

```go
dynamicDescriptors, err := client.DynamicDescriptor(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(dynamicDescriptors) // the array of records
```

#### Example: Create

```go
result, err := client.DynamicDescriptor(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### IFrameCreateInstance

Create an instance: `iFrameCreateInstance := client.IFrameCreateInstance(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `string` |  |
| `currency` | `string` |  |
| `customer` | `map[string]any` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `reference` | `string` |  |
| `timeout` | `float64` |  |
| `token` | `[]any` |  |

#### Example: Create

```go
result, err := client.IFrameCreateInstance(nil).Create(map[string]any{
    "account_id": "example_account_id",
    "payment_iframe_id": "example_payment_iframe_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### IFrameInstance

Create an instance: `iFrameInstance := client.IFrameInstance(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Example: Load

```go
iFrameInstance, err := client.IFrameInstance(nil).Load(map[string]any{"id": "i_frame_instance_id", "account_id": "account_id", "payment_iframe_id": "payment_iframe_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(iFrameInstance) // the loaded record
```


### Iframe

Create an instance: `iframe := client.Iframe(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `map[string]any` |  |
| `allowed_parent_domain` | `[]any` |  |
| `allowed_payment_method` | `[]any` |  |
| `card_setting` | `map[string]any` |  |
| `click_to_pay_setting` | `map[string]any` |  |
| `currency` | `string` |  |
| `id` | `string` |  |
| `label` | `string` |  |
| `language` | `string` |  |
| `timeout` | `float64` |  |

#### Example: Load

```go
iframe, err := client.Iframe(nil).Load(map[string]any{"account_id": "account_id", "iframe_id": "iframe_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(iframe) // the loaded record
```

#### Example: List

```go
iframes, err := client.Iframe(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(iframes) // the array of records
```

#### Example: Create

```go
result, err := client.Iframe(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Init

Create an instance: `init := client.Init(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `map[string]any` |  |
| `description` | `string` |  |
| `item` | `[]any` |  |
| `level2` | `map[string]any` |  |
| `level3` | `map[string]any` |  |
| `shipping_address` | `map[string]any` |  |
| `trace` | `map[string]any` |  |

#### Example: Create

```go
result, err := client.Init(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### ListApiKeyScopesEntry

Create an instance: `listApiKeyScopesEntry := client.ListApiKeyScopesEntry(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `string` |  |
| `description` | `string` |  |
| `enabled` | `bool` |  |
| `level` | `int` |  |
| `scope` | `string` |  |

#### Example: List

```go
listApiKeyScopesEntrys, err := client.ListApiKeyScopesEntry(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(listApiKeyScopesEntrys) // the array of records
```


### PaymentIframe

Create an instance: `paymentIframe := client.PaymentIframe(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Remove(match, ctrl)` | Remove the matching entity. |


### ThreeDSecureAuth

Create an instance: `threeDSecureAuth := client.ThreeDSecureAuth(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `map[string]any` |  |
| `card` | `map[string]any` |  |
| `challenge` | `map[string]any` |  |
| `customer` | `map[string]any` |  |
| `purchase` | `map[string]any` |  |
| `server_transaction_id` | `string` |  |
| `shipping` | `map[string]any` |  |
| `status` | `string` |  |
| `three_d_secure_challenge_indicator` | `string` |  |
| `three_d_secure_id` | `string` |  |
| `trace` | `map[string]any` |  |

#### Example: Create

```go
result, err := client.ThreeDSecureAuth(nil).Create(map[string]any{
    "3_d_id": "example_3_d_id",
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### ThreeDSecureBrowserInit

Create an instance: `threeDSecureBrowserInit := client.ThreeDSecureBrowserInit(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

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

```go
result, err := client.ThreeDSecureBrowserInit(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### ThreeDSecureStatus

Create an instance: `threeDSecureStatus := client.ThreeDSecureStatus(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `map[string]any` |  |
| `info` | `map[string]any` |  |
| `server_transaction_id` | `string` |  |
| `status` | `string` |  |
| `three_d_secure` | `map[string]any` |  |
| `three_d_secure_id` | `string` |  |

#### Example: Load

```go
threeDSecureStatus, err := client.ThreeDSecureStatus(nil).Load(map[string]any{"3_d_id": "3_d_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(threeDSecureStatus) // the loaded record
```


### TransactionDetail

Create an instance: `transactionDetail := client.TransactionDetail(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `map[string]any` |  |
| `auth` | `map[string]any` |  |
| `card` | `map[string]any` |  |
| `customer` | `map[string]any` |  |
| `description` | `string` |  |
| `id` | `string` |  |
| `item` | `[]any` |  |
| `level2` | `map[string]any` |  |
| `level3` | `map[string]any` |  |
| `override` | `map[string]any` |  |
| `shipping_address` | `map[string]any` |  |
| `status` | `string` |  |
| `timestamp` | `string` |  |
| `trace` | `map[string]any` |  |

#### Example: Load

```go
transactionDetail, err := client.TransactionDetail(nil).Load(map[string]any{"account_id": "account_id", "transaction_id": "transaction_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(transactionDetail) // the loaded record
```


### Webhook

Create an instance: `webhook := client.Webhook(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Update(data, ctrl)` | Update an existing entity. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `string` |  |
| `id` | `string` |  |
| `url` | `string` |  |

#### Example: Load

```go
webhook, err := client.Webhook(nil).Load(map[string]any{"id": "webhook_id", "account_id": "account_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(webhook) // the loaded record
```

#### Example: List

```go
webhooks, err := client.Webhook(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(webhooks) // the array of records
```

#### Example: Create

```go
result, err := client.Webhook(nil).Create(map[string]any{
    "account_id": "example_account_id",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/bluefin-payconex-sdk/go/
├── bluefin-payconex.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/bluefin-payconex-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
threedsecurestatus := client.ThreeDSecureStatus(nil)
threedsecurestatus.Load(map[string]any{"3_d_id": "example", "account_id": "example"}, nil)

// threedsecurestatus.Data() now returns the threedsecurestatus data from the last load
// threedsecurestatus.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
