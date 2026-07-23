# BluefinPayconex Zig SDK



The Zig SDK for the BluefinPayconex API — an entity-oriented client following idiomatic Zig conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.account_updater(h.vnull())` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
Zig has no central package registry, so this package is distributed as a
git tag (`zig/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-payconex-sdk/releases)). Add it to
your `build.zig.zon` dependencies, or build from a source checkout:

```bash
cd zig && zig build
```

To depend on it from another project, add the tagged archive to
`build.zig.zon`:

```zig
.dependencies = .{
    .sdk = .{
        .url = "<repo-url>/archive/refs/tags/zig/vX.Y.Z.tar.gz",
        // .hash = "...", // filled in by `zig fetch`
    },
},
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```zig
const std = @import("std");
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinPayconexSDK.new(h.jo(&.{
    .{ "apikey", h.vstr(std.posix.getenv("BLUEFIN_PAYCONEX_APIKEY") orelse "") },
}));
```

### 3. Load an accountupdatersubscriptionwithresult

AccountUpdaterSubscriptionWithResult is nested under account, so provide the `account_id`.
`load()`'s `.ok` carries the bare record.

```zig
switch (client.account_updater_subscription_with_result(h.vnull()).load(h.jo(&.{.{ "account_id", h.vstr("example_account_id") }, .{ "subscription_id", h.vstr("example_subscription_id") }}), h.vnull())) {
    .ok => |account_updater_subscription_with_result| std.debug.print("{s}\n", .{h.stringify(account_updater_subscription_with_result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### 4. Create, update, and remove

```zig
// Remove
switch (client.account_updater(h.vnull()).remove(h.jo(&.{.{ "account_id", h.vstr("example_account_id") }, .{ "subscription_id", h.vstr("example_subscription_id") }}), h.vnull())) {
    .ok => |_| std.debug.print("removed\n", .{}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
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

```zig
const result = client.direct(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("GET") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
}));

if (h.get_bool(result, "ok") orelse false) {
    std.debug.print("{d}\n", .{h.to_int(h.getp(result, "status"))}); // 200
    std.debug.print("{s}\n", .{h.stringify(h.getp(result, "data"))}); // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    std.debug.print("{s}\n", .{h.get_str(result, "err") orelse ""});
}
```

### Prepare a request without sending it

```zig
// prepare() returns the fetch definition (an error union — use `catch`/`try`).
const fetchdef = client.prepare(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("DELETE") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
})) catch unreachable;

std.debug.print("{s}\n", .{h.get_str(fetchdef, "url") orelse ""});
std.debug.print("{s}\n", .{h.get_str(fetchdef, "method") orelse ""});
std.debug.print("{s}\n", .{h.stringify(h.getp(fetchdef, "headers"))});
```

### Use test mode

Create a mock client for unit testing — no server required:

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());

// Entity ops return an OpResult — .ok carries the record, .err the error.
switch (client.three_d_secure_status(h.vnull()).load(h.vnull(), h.vnull())) {
    .ok => |three_d_secure_status| std.debug.print("{s}\n", .{h.stringify(three_d_secure_status)}), // the mock record
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Point at a different server

Override the base URL to reach a local or staging server:

```zig
const client = sdk.BluefinPayconexSDK.new(h.jo(&.{
    .{ "base", h.vstr("http://localhost:8080") },
}));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_PAYCONEX_TEST_LIVE=TRUE
BLUEFIN_PAYCONEX_APIKEY=<your-key>
```

Then run:

```bash
cd zig && zig build test
```


## Reference

### BluefinPayconexSDK

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinPayconexSDK.new(options);
```

Creates a new SDK client. `options` is a `Value` map (`h.vnull()` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```zig
const client = sdk.test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`h.vnull()`.

### BluefinPayconexSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() Value` | Deep copy of the current SDK options. |
| `get_utility` | `() *Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) E!Value` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) Value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `account_updater` | `(entopts: Value) *AccountUpdaterEntity` | Create an AccountUpdater entity instance. |
| `account_updater_schedule` | `(entopts: Value) *AccountUpdaterScheduleEntity` | Create an AccountUpdaterSchedule entity instance. |
| `account_updater_schedule_with_result` | `(entopts: Value) *AccountUpdaterScheduleWithResultEntity` | Create an AccountUpdaterScheduleWithResult entity instance. |
| `account_updater_subscription_with_result` | `(entopts: Value) *AccountUpdaterSubscriptionWithResultEntity` | Create an AccountUpdaterSubscriptionWithResult entity instance. |
| `account_updater_update` | `(entopts: Value) *AccountUpdaterUpdateEntity` | Create an AccountUpdaterUpdate entity instance. |
| `api_key` | `(entopts: Value) *ApiKeyEntity` | Create an ApiKey entity instance. |
| `apple_pay_merchant_detail` | `(entopts: Value) *ApplePayMerchantDetailEntity` | Create an ApplePayMerchantDetail entity instance. |
| `apple_pay_session` | `(entopts: Value) *ApplePaySessionEntity` | Create an ApplePaySession entity instance. |
| `dynamic_descriptor` | `(entopts: Value) *DynamicDescriptorEntity` | Create a DynamicDescriptor entity instance. |
| `i_frame_create_instance` | `(entopts: Value) *IFrameCreateInstanceEntity` | Create an IFrameCreateInstance entity instance. |
| `i_frame_instance` | `(entopts: Value) *IFrameInstanceEntity` | Create an IFrameInstance entity instance. |
| `iframe` | `(entopts: Value) *IframeEntity` | Create an Iframe entity instance. |
| `init` | `(entopts: Value) *InitEntity` | Create an Init entity instance. |
| `list_api_key_scopes_entry` | `(entopts: Value) *ListApiKeyScopesEntryEntity` | Create a ListApiKeyScopesEntry entity instance. |
| `payment_iframe` | `(entopts: Value) *PaymentIframeEntity` | Create a PaymentIframe entity instance. |
| `three_d_secure_auth` | `(entopts: Value) *ThreeDSecureAuthEntity` | Create a ThreeDSecureAuth entity instance. |
| `three_d_secure_browser_init` | `(entopts: Value) *ThreeDSecureBrowserInitEntity` | Create a ThreeDSecureBrowserInit entity instance. |
| `three_d_secure_status` | `(entopts: Value) *ThreeDSecureStatusEntity` | Create a ThreeDSecureStatus entity instance. |
| `transaction_detail` | `(entopts: Value) *TransactionDetailEntity` | Create a TransactionDetail entity instance. |
| `webhook` | `(entopts: Value) *WebhookEntity` | Create a Webhook entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) OpResult` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) OpResult` | List entities matching the criteria (`.ok` is a `Value` array). |
| `create` | `(reqdata: Value, ctrl: Value) OpResult` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) OpResult` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) OpResult` | Remove an entity. |
| `stream` | `(action: []const u8, args: Value, callopts: Value) []Value` | Run an op through the pipeline and materialise its result items. |
| `data` | `(args: ?Value) Value` | Get entity data (pass a map to set). |
| `matchv` | `(args: ?Value) Value` | Get entity match criteria (pass a map to set). |
| `get_name` | `() []const u8` | Return the entity name. |

### Result shape

Entity operations return an `OpResult` union — `switch` on it: `.ok`
carries the bare result data (a `Value` object for single-entity ops, a
`Value` array for `list`), `.err` carries the branded error pointer.

The `direct()` escape hatch returns a result `Value` map directly (no
error union) — even on a non-2xx response — that you branch on via
`h.get_bool(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error message.

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

Create an instance: `const account_updater = client.account_updater(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.


### AccountUpdaterSchedule

Create an instance: `const account_updater_schedule = client.account_updater_schedule(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `enabled` | `bool` |  |
| `period_date` | `[]const u8` |  |
| `period_id` | `[]const u8` |  |
| `response_format` | `[]const u8` |  |
| `token` | `Value (array)` |  |

#### Example: Create

```zig
switch (client.account_updater_schedule(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |account_updater_schedule| std.debug.print("{s}\n", .{h.stringify(account_updater_schedule)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### AccountUpdaterScheduleWithResult

Create an instance: `const account_updater_schedule_with_result = client.account_updater_schedule_with_result(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `Value (array)` |  |
| `created_at` | `[]const u8` |  |
| `enabled` | `bool` |  |
| `expiry` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `most_recent_update` | `Value (object)` |  |
| `period_date` | `[]const u8` |  |
| `period_id` | `[]const u8` |  |
| `response_format` | `[]const u8` |  |
| `token` | `Value (array)` |  |
| `type` | `[]const u8` |  |
| `updated_at` | `[]const u8` |  |

#### Example: List

```zig
switch (client.account_updater_schedule_with_result(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |account_updater_schedule_with_results| std.debug.print("{s}\n", .{h.stringify(account_updater_schedule_with_results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.account_updater_schedule_with_result(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |account_updater_schedule_with_result| std.debug.print("{s}\n", .{h.stringify(account_updater_schedule_with_result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### AccountUpdaterSubscriptionWithResult

Create an instance: `const account_updater_subscription_with_result = client.account_updater_subscription_with_result(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created_at` | `[]const u8` |  |
| `enabled` | `bool` |  |
| `id` | `[]const u8` |  |
| `period_date` | `[]const u8` |  |
| `period_id` | `[]const u8` |  |
| `record` | `Value (array)` |  |
| `response_format` | `[]const u8` |  |
| `template_ref` | `[]const u8` |  |
| `updated_at` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.account_updater_subscription_with_result(h.vnull()).load(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "subscription_id", h.vstr("subscription_id") }}), h.vnull())) {
    .ok => |account_updater_subscription_with_result| std.debug.print("{s}\n", .{h.stringify(account_updater_subscription_with_result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.account_updater_subscription_with_result(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
    .{ "subscription_id", h.vstr("example_subscription_id") }, // []const u8
}), h.vnull())) {
    .ok => |account_updater_subscription_with_result| std.debug.print("{s}\n", .{h.stringify(account_updater_subscription_with_result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### AccountUpdaterUpdate

Create an instance: `const account_updater_update = client.account_updater_update(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account_updater_schedule_record_id` | `[]const u8` |  |
| `format` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `new_expiry` | `[]const u8` |  |
| `new_token` | `[]const u8` |  |
| `old_expiry` | `[]const u8` |  |
| `old_token` | `[]const u8` |  |
| `recurring_schedule` | `Value (array)` |  |
| `status` | `[]const u8` |  |
| `update_id` | `[]const u8` |  |
| `updated_at` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.account_updater_update(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("account_updater_update_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |account_updater_update| std.debug.print("{s}\n", .{h.stringify(account_updater_update)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### ApiKey

Create an instance: `const api_key = client.api_key(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `account` | `Value (array)` |  |
| `enabled` | `bool` |  |
| `expires_at` | `[]const u8` |  |
| `expires_in` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `label` | `[]const u8` |  |
| `method` | `Value (array)` |  |
| `scope` | `Value (array)` |  |
| `secret` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.api_key(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("api_key_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |api_key| std.debug.print("{s}\n", .{h.stringify(api_key)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.api_key(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |api_keys| std.debug.print("{s}\n", .{h.stringify(api_keys)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.api_key(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |api_key| std.debug.print("{s}\n", .{h.stringify(api_key)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### ApplePayMerchantDetail

Create an instance: `const apple_pay_merchant_detail = client.apple_pay_merchant_detail(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `domain` | `Value (array)` |  |
| `merchant_url` | `[]const u8` |  |
| `partner_merchant_name` | `[]const u8` |  |
| `payconex_account_id` | `[]const u8` |  |

#### Example: List

```zig
switch (client.apple_pay_merchant_detail(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |apple_pay_merchant_details| std.debug.print("{s}\n", .{h.stringify(apple_pay_merchant_details)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.apple_pay_merchant_detail(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vnum(1) }, // i64
}), h.vnull())) {
    .ok => |apple_pay_merchant_detail| std.debug.print("{s}\n", .{h.stringify(apple_pay_merchant_detail)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### ApplePaySession

Create an instance: `const apple_pay_session = client.apple_pay_session(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `display_name` | `[]const u8` |  |
| `domain_name` | `[]const u8` |  |
| `epoch_timestamp` | `i64` |  |
| `expires_at` | `i64` |  |
| `merchant_identifier` | `[]const u8` |  |
| `merchant_session_identifier` | `[]const u8` |  |
| `nonce` | `i64` |  |
| `operational_analytics_identifier` | `[]const u8` |  |
| `referrer` | `[]const u8` |  |
| `retry` | `i64` |  |
| `signature` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.apple_pay_session(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vnum(1) }, // i64
}), h.vnull())) {
    .ok => |apple_pay_session| std.debug.print("{s}\n", .{h.stringify(apple_pay_session)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### DynamicDescriptor

Create an instance: `const dynamic_descriptor = client.dynamic_descriptor(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `city` | `[]const u8` |  |
| `descriptor` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `state` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.dynamic_descriptor(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("dynamic_descriptor_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |dynamic_descriptor| std.debug.print("{s}\n", .{h.stringify(dynamic_descriptor)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.dynamic_descriptor(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |dynamic_descriptors| std.debug.print("{s}\n", .{h.stringify(dynamic_descriptors)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.dynamic_descriptor(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |dynamic_descriptor| std.debug.print("{s}\n", .{h.stringify(dynamic_descriptor)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### IFrameCreateInstance

Create an instance: `const i_frame_create_instance = client.i_frame_create_instance(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `[]const u8` |  |
| `currency` | `[]const u8` |  |
| `customer` | `Value (object)` |  |
| `initialize_transaction` | `bool` |  |
| `label` | `[]const u8` |  |
| `language` | `[]const u8` |  |
| `reference` | `[]const u8` |  |
| `timeout` | `f64` |  |
| `token` | `Value (array)` |  |

#### Example: Create

```zig
switch (client.i_frame_create_instance(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
    .{ "payment_iframe_id", h.vstr("example_payment_iframe_id") }, // []const u8
}), h.vnull())) {
    .ok => |i_frame_create_instance| std.debug.print("{s}\n", .{h.stringify(i_frame_create_instance)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### IFrameInstance

Create an instance: `const i_frame_instance = client.i_frame_instance(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Example: Load

```zig
switch (client.i_frame_instance(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("i_frame_instance_id") }, .{ "account_id", h.vstr("account_id") }, .{ "payment_iframe_id", h.vstr("payment_iframe_id") }}), h.vnull())) {
    .ok => |i_frame_instance| std.debug.print("{s}\n", .{h.stringify(i_frame_instance)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### Iframe

Create an instance: `const iframe = client.iframe(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ach_setting` | `Value (object)` |  |
| `allowed_parent_domain` | `Value (array)` |  |
| `allowed_payment_method` | `Value (array)` |  |
| `card_setting` | `Value (object)` |  |
| `click_to_pay_setting` | `Value (object)` |  |
| `currency` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `label` | `[]const u8` |  |
| `language` | `[]const u8` |  |
| `timeout` | `f64` |  |

#### Example: Load

```zig
switch (client.iframe(h.vnull()).load(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "iframe_id", h.vstr("iframe_id") }}), h.vnull())) {
    .ok => |iframe| std.debug.print("{s}\n", .{h.stringify(iframe)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.iframe(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |iframes| std.debug.print("{s}\n", .{h.stringify(iframes)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.iframe(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |iframe| std.debug.print("{s}\n", .{h.stringify(iframe)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Init

Create an instance: `const init = client.init(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `customer` | `Value (object)` |  |
| `description` | `[]const u8` |  |
| `item` | `Value (array)` |  |
| `level2` | `Value (object)` |  |
| `level3` | `Value (object)` |  |
| `shipping_address` | `Value (object)` |  |
| `trace` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.init(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |init| std.debug.print("{s}\n", .{h.stringify(init)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### ListApiKeyScopesEntry

Create an instance: `const list_api_key_scopes_entry = client.list_api_key_scopes_entry(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `category` | `[]const u8` |  |
| `description` | `[]const u8` |  |
| `enabled` | `bool` |  |
| `level` | `i64` |  |
| `scope` | `[]const u8` |  |

#### Example: List

```zig
switch (client.list_api_key_scopes_entry(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |list_api_key_scopes_entrys| std.debug.print("{s}\n", .{h.stringify(list_api_key_scopes_entrys)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### PaymentIframe

Create an instance: `const payment_iframe = client.payment_iframe(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.


### ThreeDSecureAuth

Create an instance: `const three_d_secure_auth = client.three_d_secure_auth(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `browser` | `Value (object)` |  |
| `card` | `Value (object)` |  |
| `challenge` | `Value (object)` |  |
| `customer` | `Value (object)` |  |
| `purchase` | `Value (object)` |  |
| `server_transaction_id` | `[]const u8` |  |
| `shipping` | `Value (object)` |  |
| `status` | `[]const u8` |  |
| `three_d_secure_challenge_indicator` | `[]const u8` |  |
| `three_d_secure_id` | `[]const u8` |  |
| `trace` | `Value (object)` |  |

#### Example: Create

```zig
switch (client.three_d_secure_auth(h.vnull()).create(h.jo(&.{
    .{ "3_d_id", h.vstr("example_3_d_id") }, // []const u8
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |three_d_secure_auth| std.debug.print("{s}\n", .{h.stringify(three_d_secure_auth)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### ThreeDSecureBrowserInit

Create an instance: `const three_d_secure_browser_init = client.three_d_secure_browser_init(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `acs_result_url` | `[]const u8` |  |
| `acs_url` | `[]const u8` |  |
| `cvv` | `[]const u8` |  |
| `expiry` | `[]const u8` |  |
| `pan` | `[]const u8` |  |
| `payment_details_reference` | `[]const u8` |  |
| `server_transaction_id` | `[]const u8` |  |
| `status` | `[]const u8` |  |
| `three_d_secure_data` | `[]const u8` |  |
| `three_d_secure_id` | `[]const u8` |  |

#### Example: Create

```zig
switch (client.three_d_secure_browser_init(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |three_d_secure_browser_init| std.debug.print("{s}\n", .{h.stringify(three_d_secure_browser_init)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### ThreeDSecureStatus

Create an instance: `const three_d_secure_status = client.three_d_secure_status(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `error` | `Value (object)` |  |
| `info` | `Value (object)` |  |
| `server_transaction_id` | `[]const u8` |  |
| `status` | `[]const u8` |  |
| `three_d_secure` | `Value (object)` |  |
| `three_d_secure_id` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.three_d_secure_status(h.vnull()).load(h.jo(&.{.{ "3_d_id", h.vstr("3_d_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |three_d_secure_status| std.debug.print("{s}\n", .{h.stringify(three_d_secure_status)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### TransactionDetail

Create an instance: `const transaction_detail = client.transaction_detail(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `amount` | `Value (object)` |  |
| `auth` | `Value (object)` |  |
| `card` | `Value (object)` |  |
| `customer` | `Value (object)` |  |
| `description` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `item` | `Value (array)` |  |
| `level2` | `Value (object)` |  |
| `level3` | `Value (object)` |  |
| `override` | `Value (object)` |  |
| `shipping_address` | `Value (object)` |  |
| `status` | `[]const u8` |  |
| `timestamp` | `[]const u8` |  |
| `trace` | `Value (object)` |  |

#### Example: Load

```zig
switch (client.transaction_detail(h.vnull()).load(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "transaction_id", h.vstr("transaction_id") }}), h.vnull())) {
    .ok => |transaction_detail| std.debug.print("{s}\n", .{h.stringify(transaction_detail)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### Webhook

Create an instance: `const webhook = client.webhook(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `event` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `url` | `[]const u8` |  |

#### Example: Load

```zig
switch (client.webhook(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("webhook_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |webhook| std.debug.print("{s}\n", .{h.stringify(webhook)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.webhook(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |webhooks| std.debug.print("{s}\n", .{h.stringify(webhooks)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.webhook(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |webhook| std.debug.print("{s}\n", .{h.stringify(webhook)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
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

### Data as `Value`

The Zig SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port's
`JsonValue` (a JSON-shaped tagged union: `.string`, `.integer`,
`.float`, `.bool`, `.array`, `.object`, `.null`). This mirrors the
dynamic nature of the API and keeps the SDK flexible — no code generation is
needed when the API schema changes.

Build request maps with the `h.jo` / `h.ja` helpers and read fields back
with `h.getp` (or the typed `h.get_str` / `h.get_bool` / `h.to_int`
accessors); use `h.to_map` to safely coerce a value to a map.

### Module structure

```
zig/
├── root.zig                     -- Module root (re-exports the public surface)
├── build.zig                    -- Build + test wiring
├── core/                        -- Pipeline types, config, client (sdk.zig)
├── entity/                      -- Per-entity clients (one file each)
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utilities + the vendored voxgig struct port
└── test/                        -- Test suites
```

The public API is re-exported from `root.zig`, so `@import("sdk")` reaches
the SDK client, `Value`, and the `h` (helpers) namespace directly. Import
entity or utility modules only when needed.

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
