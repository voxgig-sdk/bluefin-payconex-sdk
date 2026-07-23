# BluefinPayconex Zig SDK Reference

Complete API reference for the BluefinPayconex Zig SDK.


## BluefinPayconexSDK

### Constructor

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinPayconexSDK.new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`h.vnull()` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) *BluefinPayconexSDK`

Create a test client with mock features active. Both arguments may be
`h.vnull()`.

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());
```


### Instance Methods

#### `account_updater(entopts: Value) *AccountUpdaterEntity`

Create a new `AccountUpdaterEntity` instance. Pass `h.vnull()` for no
initial options.

#### `account_updater_schedule(entopts: Value) *AccountUpdaterScheduleEntity`

Create a new `AccountUpdaterScheduleEntity` instance. Pass `h.vnull()` for no
initial options.

#### `account_updater_schedule_with_result(entopts: Value) *AccountUpdaterScheduleWithResultEntity`

Create a new `AccountUpdaterScheduleWithResultEntity` instance. Pass `h.vnull()` for no
initial options.

#### `account_updater_subscription_with_result(entopts: Value) *AccountUpdaterSubscriptionWithResultEntity`

Create a new `AccountUpdaterSubscriptionWithResultEntity` instance. Pass `h.vnull()` for no
initial options.

#### `account_updater_update(entopts: Value) *AccountUpdaterUpdateEntity`

Create a new `AccountUpdaterUpdateEntity` instance. Pass `h.vnull()` for no
initial options.

#### `api_key(entopts: Value) *ApiKeyEntity`

Create a new `ApiKeyEntity` instance. Pass `h.vnull()` for no
initial options.

#### `apple_pay_merchant_detail(entopts: Value) *ApplePayMerchantDetailEntity`

Create a new `ApplePayMerchantDetailEntity` instance. Pass `h.vnull()` for no
initial options.

#### `apple_pay_session(entopts: Value) *ApplePaySessionEntity`

Create a new `ApplePaySessionEntity` instance. Pass `h.vnull()` for no
initial options.

#### `dynamic_descriptor(entopts: Value) *DynamicDescriptorEntity`

Create a new `DynamicDescriptorEntity` instance. Pass `h.vnull()` for no
initial options.

#### `i_frame_create_instance(entopts: Value) *IFrameCreateInstanceEntity`

Create a new `IFrameCreateInstanceEntity` instance. Pass `h.vnull()` for no
initial options.

#### `i_frame_instance(entopts: Value) *IFrameInstanceEntity`

Create a new `IFrameInstanceEntity` instance. Pass `h.vnull()` for no
initial options.

#### `iframe(entopts: Value) *IframeEntity`

Create a new `IframeEntity` instance. Pass `h.vnull()` for no
initial options.

#### `init(entopts: Value) *InitEntity`

Create a new `InitEntity` instance. Pass `h.vnull()` for no
initial options.

#### `list_api_key_scopes_entry(entopts: Value) *ListApiKeyScopesEntryEntity`

Create a new `ListApiKeyScopesEntryEntity` instance. Pass `h.vnull()` for no
initial options.

#### `payment_iframe(entopts: Value) *PaymentIframeEntity`

Create a new `PaymentIframeEntity` instance. Pass `h.vnull()` for no
initial options.

#### `three_d_secure_auth(entopts: Value) *ThreeDSecureAuthEntity`

Create a new `ThreeDSecureAuthEntity` instance. Pass `h.vnull()` for no
initial options.

#### `three_d_secure_browser_init(entopts: Value) *ThreeDSecureBrowserInitEntity`

Create a new `ThreeDSecureBrowserInitEntity` instance. Pass `h.vnull()` for no
initial options.

#### `three_d_secure_status(entopts: Value) *ThreeDSecureStatusEntity`

Create a new `ThreeDSecureStatusEntity` instance. Pass `h.vnull()` for no
initial options.

#### `transaction_detail(entopts: Value) *TransactionDetailEntity`

Create a new `TransactionDetailEntity` instance. Pass `h.vnull()` for no
initial options.

#### `webhook(entopts: Value) *WebhookEntity`

Create a new `WebhookEntity` instance. Pass `h.vnull()` for no
initial options.

#### `options_map() Value`

Return a deep copy of the current SDK options.

#### `get_utility() *Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value`
map with `ok`, `status`, `headers`, and `data` (or `err` on failure).
This escape hatch returns a map even on a non-2xx response — branch on
`h.get_bool(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) E!Value`

Prepare a fetch definition without sending. Returns the fetchdef (use
`catch`/`try` to handle the error union).


---

## AccountUpdaterEntity

```zig
const account_updater = client.account_updater(h.vnull());
```

### Operations

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.account_updater(h.vnull()).remove(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "subscription_id", h.vstr("subscription_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## AccountUpdaterScheduleEntity

```zig
const account_updater_schedule = client.account_updater_schedule(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `enabled` | `bool` | No |  |
| `period_date` | `[]const u8` | No |  |
| `period_id` | `[]const u8` | Yes |  |
| `response_format` | `[]const u8` | No |  |
| `token` | `Value (array)` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.account_updater_schedule(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## AccountUpdaterScheduleWithResultEntity

```zig
const account_updater_schedule_with_result = client.account_updater_schedule_with_result(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Value (array)` | Yes |  |
| `created_at` | `[]const u8` | Yes |  |
| `enabled` | `bool` | No |  |
| `expiry` | `[]const u8` | No |  |
| `id` | `[]const u8` | Yes |  |
| `most_recent_update` | `Value (object)` | No |  |
| `period_date` | `[]const u8` | No |  |
| `period_id` | `[]const u8` | Yes |  |
| `response_format` | `[]const u8` | No |  |
| `token` | `Value (array)` | Yes |  |
| `type` | `[]const u8` | Yes |  |
| `updated_at` | `[]const u8` | Yes |  |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.account_updater_schedule_with_result(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.account_updater_schedule_with_result(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## AccountUpdaterSubscriptionWithResultEntity

```zig
const account_updater_subscription_with_result = client.account_updater_subscription_with_result(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created_at` | `[]const u8` | No |  |
| `enabled` | `bool` | No |  |
| `id` | `[]const u8` | No |  |
| `period_date` | `[]const u8` | No |  |
| `period_id` | `[]const u8` | No |  |
| `record` | `Value (array)` | No |  |
| `response_format` | `[]const u8` | No |  |
| `template_ref` | `[]const u8` | No |  |
| `updated_at` | `[]const u8` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.account_updater_subscription_with_result(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
    .{ "subscription_id", h.vstr("example_subscription_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.account_updater_subscription_with_result(h.vnull()).load(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "subscription_id", h.vstr("subscription_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.account_updater_subscription_with_result(h.vnull()).update(h.jo(&.{
    .{ "account_id", h.vstr("account_id") },
    .{ "subscription_id", h.vstr("subscription_id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## AccountUpdaterUpdateEntity

```zig
const account_updater_update = client.account_updater_update(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account_updater_schedule_record_id` | `[]const u8` | No |  |
| `format` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `new_expiry` | `[]const u8` | No |  |
| `new_token` | `[]const u8` | No |  |
| `old_expiry` | `[]const u8` | No |  |
| `old_token` | `[]const u8` | No |  |
| `recurring_schedule` | `Value (array)` | No |  |
| `status` | `[]const u8` | No |  |
| `update_id` | `[]const u8` | No |  |
| `updated_at` | `[]const u8` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.account_updater_update(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("account_updater_update_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ApiKeyEntity

```zig
const api_key = client.api_key(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `account` | `Value (array)` | No |  |
| `enabled` | `bool` | No |  |
| `expires_at` | `[]const u8` | No |  |
| `expires_in` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `label` | `[]const u8` | No |  |
| `method` | `Value (array)` | No |  |
| `scope` | `Value (array)` | No |  |
| `secret` | `[]const u8` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.api_key(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.api_key(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.api_key(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("api_key_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.api_key(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("api_key_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.api_key(h.vnull()).update(h.jo(&.{
    .{ "id", h.vstr("api_key_id") },
    .{ "account_id", h.vstr("account_id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ApplePayMerchantDetailEntity

```zig
const apple_pay_merchant_detail = client.apple_pay_merchant_detail(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `domain` | `Value (array)` | Yes |  |
| `merchant_url` | `[]const u8` | Yes |  |
| `partner_merchant_name` | `[]const u8` | No |  |
| `payconex_account_id` | `[]const u8` | Yes |  |

### Field Usage by Operation

| Field | list | create |
| --- | --- | --- |
| `domain` | - | - |
| `merchant_url` | - | Yes |
| `partner_merchant_name` | - | - |
| `payconex_account_id` | - | - |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.apple_pay_merchant_detail(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vnum(1) }, // i64
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.apple_pay_merchant_detail(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ApplePaySessionEntity

```zig
const apple_pay_session = client.apple_pay_session(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `display_name` | `[]const u8` | No |  |
| `domain_name` | `[]const u8` | No |  |
| `epoch_timestamp` | `i64` | No |  |
| `expires_at` | `i64` | No |  |
| `merchant_identifier` | `[]const u8` | No |  |
| `merchant_session_identifier` | `[]const u8` | No |  |
| `nonce` | `i64` | No |  |
| `operational_analytics_identifier` | `[]const u8` | No |  |
| `referrer` | `[]const u8` | Yes |  |
| `retry` | `i64` | No |  |
| `signature` | `[]const u8` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.apple_pay_session(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vnum(1) }, // i64
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DynamicDescriptorEntity

```zig
const dynamic_descriptor = client.dynamic_descriptor(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `city` | `[]const u8` | No |  |
| `descriptor` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `state` | `[]const u8` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.dynamic_descriptor(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.dynamic_descriptor(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.dynamic_descriptor(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("dynamic_descriptor_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.dynamic_descriptor(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("dynamic_descriptor_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.dynamic_descriptor(h.vnull()).update(h.jo(&.{
    .{ "id", h.vstr("dynamic_descriptor_id") },
    .{ "account_id", h.vstr("account_id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## IFrameCreateInstanceEntity

```zig
const i_frame_create_instance = client.i_frame_create_instance(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `[]const u8` | No |  |
| `currency` | `[]const u8` | No |  |
| `customer` | `Value (object)` | No |  |
| `initialize_transaction` | `bool` | No |  |
| `label` | `[]const u8` | Yes |  |
| `language` | `[]const u8` | No |  |
| `reference` | `[]const u8` | No |  |
| `timeout` | `f64` | No |  |
| `token` | `Value (array)` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.i_frame_create_instance(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
    .{ "payment_iframe_id", h.vstr("example_payment_iframe_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## IFrameInstanceEntity

```zig
const i_frame_instance = client.i_frame_instance(h.vnull());
```

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.i_frame_instance(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("i_frame_instance_id") }, .{ "account_id", h.vstr("account_id") }, .{ "payment_iframe_id", h.vstr("payment_iframe_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## IframeEntity

```zig
const iframe = client.iframe(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ach_setting` | `Value (object)` | No |  |
| `allowed_parent_domain` | `Value (array)` | Yes |  |
| `allowed_payment_method` | `Value (array)` | Yes |  |
| `card_setting` | `Value (object)` | No |  |
| `click_to_pay_setting` | `Value (object)` | No |  |
| `currency` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `label` | `[]const u8` | Yes |  |
| `language` | `[]const u8` | No |  |
| `timeout` | `f64` | No |  |

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

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.iframe(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.iframe(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.iframe(h.vnull()).load(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "iframe_id", h.vstr("iframe_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.iframe(h.vnull()).update(h.jo(&.{
    .{ "account_id", h.vstr("account_id") },
    .{ "iframe_id", h.vstr("iframe_id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## InitEntity

```zig
const init = client.init(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `customer` | `Value (object)` | No |  |
| `description` | `[]const u8` | No |  |
| `item` | `Value (array)` | No |  |
| `level2` | `Value (object)` | No |  |
| `level3` | `Value (object)` | No |  |
| `shipping_address` | `Value (object)` | Yes |  |
| `trace` | `Value (object)` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.init(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ListApiKeyScopesEntryEntity

```zig
const list_api_key_scopes_entry = client.list_api_key_scopes_entry(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `category` | `[]const u8` | No |  |
| `description` | `[]const u8` | No |  |
| `enabled` | `bool` | No |  |
| `level` | `i64` | No |  |
| `scope` | `[]const u8` | No |  |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.list_api_key_scopes_entry(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## PaymentIframeEntity

```zig
const payment_iframe = client.payment_iframe(h.vnull());
```

### Operations

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.payment_iframe(h.vnull()).remove(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "id", h.vstr("id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ThreeDSecureAuthEntity

```zig
const three_d_secure_auth = client.three_d_secure_auth(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `browser` | `Value (object)` | Yes |  |
| `card` | `Value (object)` | Yes |  |
| `challenge` | `Value (object)` | No |  |
| `customer` | `Value (object)` | No |  |
| `purchase` | `Value (object)` | Yes |  |
| `server_transaction_id` | `[]const u8` | No |  |
| `shipping` | `Value (object)` | Yes |  |
| `status` | `[]const u8` | No |  |
| `three_d_secure_challenge_indicator` | `[]const u8` | No |  |
| `three_d_secure_id` | `[]const u8` | No |  |
| `trace` | `Value (object)` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.three_d_secure_auth(h.vnull()).create(h.jo(&.{
    .{ "3_d_id", h.vstr("example_3_d_id") }, // []const u8
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ThreeDSecureBrowserInitEntity

```zig
const three_d_secure_browser_init = client.three_d_secure_browser_init(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acs_result_url` | `[]const u8` | No |  |
| `acs_url` | `[]const u8` | No |  |
| `cvv` | `[]const u8` | No |  |
| `expiry` | `[]const u8` | Yes |  |
| `pan` | `[]const u8` | Yes |  |
| `payment_details_reference` | `[]const u8` | No |  |
| `server_transaction_id` | `[]const u8` | No |  |
| `status` | `[]const u8` | No |  |
| `three_d_secure_data` | `[]const u8` | No |  |
| `three_d_secure_id` | `[]const u8` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.three_d_secure_browser_init(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ThreeDSecureStatusEntity

```zig
const three_d_secure_status = client.three_d_secure_status(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `error` | `Value (object)` | No |  |
| `info` | `Value (object)` | No |  |
| `server_transaction_id` | `[]const u8` | No |  |
| `status` | `[]const u8` | No |  |
| `three_d_secure` | `Value (object)` | No |  |
| `three_d_secure_id` | `[]const u8` | No |  |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.three_d_secure_status(h.vnull()).load(h.jo(&.{.{ "3_d_id", h.vstr("3_d_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## TransactionDetailEntity

```zig
const transaction_detail = client.transaction_detail(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `amount` | `Value (object)` | Yes |  |
| `auth` | `Value (object)` | Yes |  |
| `card` | `Value (object)` | No |  |
| `customer` | `Value (object)` | No |  |
| `description` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `item` | `Value (array)` | No |  |
| `level2` | `Value (object)` | No |  |
| `level3` | `Value (object)` | No |  |
| `override` | `Value (object)` | No |  |
| `shipping_address` | `Value (object)` | Yes |  |
| `status` | `[]const u8` | Yes |  |
| `timestamp` | `[]const u8` | No |  |
| `trace` | `Value (object)` | No |  |

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

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.transaction_detail(h.vnull()).load(h.jo(&.{.{ "account_id", h.vstr("account_id") }, .{ "transaction_id", h.vstr("transaction_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.transaction_detail(h.vnull()).update(h.jo(&.{
    .{ "account_id", h.vstr("account_id") },
    .{ "transaction_id", h.vstr("transaction_id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## WebhookEntity

```zig
const webhook = client.webhook(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `event` | `[]const u8` | Yes |  |
| `id` | `[]const u8` | No |  |
| `url` | `[]const u8` | Yes |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.webhook(h.vnull()).create(h.jo(&.{
    .{ "account_id", h.vstr("example_account_id") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.webhook(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.webhook(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("webhook_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.webhook(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("webhook_id") }, .{ "account_id", h.vstr("account_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.webhook(h.vnull()).update(h.jo(&.{
    .{ "id", h.vstr("webhook_id") },
    .{ "account_id", h.vstr("account_id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```zig
const client = sdk.BluefinPayconexSDK.new(h.jo(&.{
    .{ "feature", h.jo(&.{
        .{ "test", h.jo(&.{.{ "active", h.vbool(true) }}) },
    }) },
}));
```

