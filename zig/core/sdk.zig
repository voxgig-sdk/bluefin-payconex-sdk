// BluefinPayconexSDK client (generated — mirrors the go/rust Main fragment).

const std = @import("std");
const vs = @import("voxgig-struct");
const h = @import("helpers.zig");
const errmod = @import("error.zig");
const types = @import("types.zig");
const ctxmod = @import("context.zig");
const utility_mod = @import("utility.zig");
const spec_mod = @import("spec.zig");
const config = @import("config.zig");

const Value = h.Value;
const E = errmod.E;
const Context = ctxmod.Context;
const CtxSpec = ctxmod.CtxSpec;
const Utility = utility_mod.Utility;
const Feature = types.Feature;
const OpResult = types.OpResult;
const Spec = spec_mod.Spec;

pub const BluefinPayconexSDK = struct {
    mode: []const u8 = "live",
    options: Value = .{ .null = {} },
    utility: *Utility,
    features: std.ArrayList(Feature),
    rootctx: ?*Context = null,

    pub fn new(options: Value) *BluefinPayconexSDK {
        const sdk = h.A().create(BluefinPayconexSDK) catch unreachable;
        sdk.* = .{
            .mode = "live",
            .options = h.vnull(),
            .utility = Utility.new(),
            .features = std.ArrayList(Feature).init(h.A()),
            .rootctx = null,
        };

        const cfg = config.make_config();

        const rootctx = sdk.utility.make_context(CtxSpec{
            .client = sdk,
            .utility = sdk.utility,
            .config = cfg,
            .options = options,
            .shared = h.omap(),
        }, null);

        const opts = sdk.utility.make_options(rootctx);
        sdk.options = opts;

        if (h.veq(h.getpath(&.{ "feature", "test", "active" }, opts), h.vbool(true))) {
            sdk.mode = "test";
        }

        rootctx.options = opts;
        sdk.rootctx = rootctx;

        // Add features in the resolved order (make_options puts an explicit
        // list order first, else defaults to test-first). Ordering matters:
        // the `test` feature installs the base mock transport and the
        // transport features (retry/cache/netsim/proxy/ratelimit) wrap
        // whatever is current, so `test` must be added before them to sit at
        // the base of the transport wrapper chain.
        const feature_opts = h.to_map(h.getp(opts, "feature"));
        const feature_order = h.getpath(&.{ "__derived__", "featureorder" }, opts);
        if (feature_opts == .object and feature_order == .array) {
            for (feature_order.array.data.items) |fname_v| {
                if (fname_v != .string) continue;
                const fname = fname_v.string;
                const fopts = h.getp(feature_opts, fname);
                if (fopts == .object) {
                    if (h.get_bool(fopts, "active") orelse false) {
                        sdk.utility.feature_add(rootctx, config.make_feature(fname));
                    }
                }
            }
        }

        // Initialize features.
        var snap = std.ArrayList(Feature).init(h.A());
        for (sdk.features.items) |f| snap.append(f) catch {};
        for (snap.items) |f| sdk.utility.feature_init(rootctx, f);

        sdk.utility.feature_hook(rootctx, "PostConstruct");

        return sdk;
    }

    pub fn options_map(self: *BluefinPayconexSDK) Value {
        return h.clone(self.options);
    }

    pub fn get_utility(self: *BluefinPayconexSDK) *Utility {
        return Utility.copy(self.utility);
    }

    pub fn get_root_ctx(self: *BluefinPayconexSDK) *Context {
        return self.rootctx orelse unreachable;
    }

    pub fn prepare(self: *BluefinPayconexSDK, fetchargs_in: Value) E!Value {
        const utility = self.utility;

        const fetchargs: Value = switch (fetchargs_in) {
            .object => fetchargs_in,
            else => h.omap(),
        };

        const ctrl: Value = switch (h.to_map(h.getp(fetchargs, "ctrl"))) {
            .object => h.to_map(h.getp(fetchargs, "ctrl")),
            else => h.omap(),
        };

        const ctx = utility.make_context(CtxSpec{
            .opname = "prepare",
            .ctrl = ctrl,
        }, self.get_root_ctx());

        const options = self.options;

        const path = h.get_str(fetchargs, "path") orelse "";
        const method: []const u8 = blk: {
            const m = h.get_str(fetchargs, "method");
            break :blk if (m) |mm| (if (mm.len == 0) "GET" else mm) else "GET";
        };

        const params: Value = switch (h.to_map(h.getp(fetchargs, "params"))) {
            .object => h.to_map(h.getp(fetchargs, "params")),
            else => h.omap(),
        };
        const query: Value = switch (h.to_map(h.getp(fetchargs, "query"))) {
            .object => h.to_map(h.getp(fetchargs, "query")),
            else => h.omap(),
        };

        const headers = utility.prepare_headers(ctx);

        const specmap = h.jo(&.{
            .{ "base", h.getp(options, "base") },
            .{ "prefix", h.getp(options, "prefix") },
            .{ "suffix", h.getp(options, "suffix") },
            .{ "path", h.vstr(path) },
            .{ "method", h.vstr(method) },
            .{ "params", params },
            .{ "query", query },
            .{ "headers", headers },
            .{ "body", h.getp(fetchargs, "body") },
            .{ "step", h.vstr("start") },
        });
        const spec = Spec.make(specmap);
        ctx.spec = spec;

        // Merge user-provided headers.
        if (h.getp(fetchargs, "headers") == .object) {
            const uh = h.getp(fetchargs, "headers");
            var it = uh.object.iterator();
            while (it.next()) |kv| h.setp(spec.headers, kv.key_ptr.*, kv.value_ptr.*);
        }

        _ = try utility.prepare_auth(ctx);

        return utility.make_fetch_def(ctx);
    }

    pub fn direct(self: *BluefinPayconexSDK, fetchargs_in: Value) Value {
        const utility = self.utility;

        const fetchdef = self.prepare(fetchargs_in) catch {
            return h.jo(&.{
                .{ "ok", h.vbool(false) },
                .{ "err", h.vstr(if (self.rootctx.?.pending_err) |e| e.msg else "prepare failed") },
            });
        };

        const fetchargs: Value = switch (fetchargs_in) {
            .object => fetchargs_in,
            else => h.omap(),
        };
        const ctrl: Value = switch (h.to_map(h.getp(fetchargs, "ctrl"))) {
            .object => h.to_map(h.getp(fetchargs, "ctrl")),
            else => h.omap(),
        };

        const ctx = utility.make_context(CtxSpec{
            .opname = "direct",
            .ctrl = ctrl,
        }, self.get_root_ctx());

        const url = h.get_str(fetchdef, "url") orelse "";
        const fetched = utility.fetch(ctx, url, fetchdef) catch {
            return h.jo(&.{
                .{ "ok", h.vbool(false) },
                .{ "err", h.vstr(if (ctx.pending_err) |e| e.msg else "fetch failed") },
            });
        };

        if (h.is_noval(fetched)) {
            return h.jo(&.{
                .{ "ok", h.vbool(false) },
                .{ "err", h.vstr("response: undefined") },
            });
        }

        if (fetched == .object) {
            const status = h.to_int(h.getp(fetched, "status"));
            const headers = h.getp(fetched, "headers");

            const content_length: []const u8 = switch (h.getp(headers, "content-length")) {
                .string => |s| s,
                .integer => |n| std.fmt.allocPrint(h.A(), "{d}", .{n}) catch "",
                else => "",
            };
            const no_body = status == 204 or status == 304 or std.mem.eql(u8, content_length, "0");

            const json_data: Value = if (no_body) h.vnull() else blk: {
                const jf = h.getp(fetched, "json");
                break :blk if (jf == .function) h.call_json(jf) else h.vnull();
            };

            return h.jo(&.{
                .{ "ok", h.vbool(200 <= status and status < 300) },
                .{ "status", h.vnum(status) },
                .{ "headers", headers },
                .{ "data", json_data },
            });
        }

        return h.jo(&.{
            .{ "ok", h.vbool(false) },
            .{ "err", h.vstr("invalid response type") },
        });
    }


    /// AccountUpdater entity bound to this client.
    pub fn account_updater(self: *@This(), entopts: Value) *@import("../entity/account_updater.zig").AccountUpdaterEntity {
        return @import("../entity/account_updater.zig").AccountUpdaterEntity.new(self, entopts);
    }

    /// AccountUpdaterSchedule entity bound to this client.
    pub fn account_updater_schedule(self: *@This(), entopts: Value) *@import("../entity/account_updater_schedule.zig").AccountUpdaterScheduleEntity {
        return @import("../entity/account_updater_schedule.zig").AccountUpdaterScheduleEntity.new(self, entopts);
    }

    /// AccountUpdaterScheduleWithResult entity bound to this client.
    pub fn account_updater_schedule_with_result(self: *@This(), entopts: Value) *@import("../entity/account_updater_schedule_with_result.zig").AccountUpdaterScheduleWithResultEntity {
        return @import("../entity/account_updater_schedule_with_result.zig").AccountUpdaterScheduleWithResultEntity.new(self, entopts);
    }

    /// AccountUpdaterSubscriptionWithResult entity bound to this client.
    pub fn account_updater_subscription_with_result(self: *@This(), entopts: Value) *@import("../entity/account_updater_subscription_with_result.zig").AccountUpdaterSubscriptionWithResultEntity {
        return @import("../entity/account_updater_subscription_with_result.zig").AccountUpdaterSubscriptionWithResultEntity.new(self, entopts);
    }

    /// AccountUpdaterUpdate entity bound to this client.
    pub fn account_updater_update(self: *@This(), entopts: Value) *@import("../entity/account_updater_update.zig").AccountUpdaterUpdateEntity {
        return @import("../entity/account_updater_update.zig").AccountUpdaterUpdateEntity.new(self, entopts);
    }

    /// ApiKey entity bound to this client.
    pub fn api_key(self: *@This(), entopts: Value) *@import("../entity/api_key.zig").ApiKeyEntity {
        return @import("../entity/api_key.zig").ApiKeyEntity.new(self, entopts);
    }

    /// ApplePayMerchantDetail entity bound to this client.
    pub fn apple_pay_merchant_detail(self: *@This(), entopts: Value) *@import("../entity/apple_pay_merchant_detail.zig").ApplePayMerchantDetailEntity {
        return @import("../entity/apple_pay_merchant_detail.zig").ApplePayMerchantDetailEntity.new(self, entopts);
    }

    /// ApplePaySession entity bound to this client.
    pub fn apple_pay_session(self: *@This(), entopts: Value) *@import("../entity/apple_pay_session.zig").ApplePaySessionEntity {
        return @import("../entity/apple_pay_session.zig").ApplePaySessionEntity.new(self, entopts);
    }

    /// DynamicDescriptor entity bound to this client.
    pub fn dynamic_descriptor(self: *@This(), entopts: Value) *@import("../entity/dynamic_descriptor.zig").DynamicDescriptorEntity {
        return @import("../entity/dynamic_descriptor.zig").DynamicDescriptorEntity.new(self, entopts);
    }

    /// IFrameCreateInstance entity bound to this client.
    pub fn i_frame_create_instance(self: *@This(), entopts: Value) *@import("../entity/i_frame_create_instance.zig").IFrameCreateInstanceEntity {
        return @import("../entity/i_frame_create_instance.zig").IFrameCreateInstanceEntity.new(self, entopts);
    }

    /// IFrameInstance entity bound to this client.
    pub fn i_frame_instance(self: *@This(), entopts: Value) *@import("../entity/i_frame_instance.zig").IFrameInstanceEntity {
        return @import("../entity/i_frame_instance.zig").IFrameInstanceEntity.new(self, entopts);
    }

    /// Iframe entity bound to this client.
    pub fn iframe(self: *@This(), entopts: Value) *@import("../entity/iframe.zig").IframeEntity {
        return @import("../entity/iframe.zig").IframeEntity.new(self, entopts);
    }

    /// Init entity bound to this client.
    pub fn init(self: *@This(), entopts: Value) *@import("../entity/init.zig").InitEntity {
        return @import("../entity/init.zig").InitEntity.new(self, entopts);
    }

    /// ListApiKeyScopesEntry entity bound to this client.
    pub fn list_api_key_scopes_entry(self: *@This(), entopts: Value) *@import("../entity/list_api_key_scopes_entry.zig").ListApiKeyScopesEntryEntity {
        return @import("../entity/list_api_key_scopes_entry.zig").ListApiKeyScopesEntryEntity.new(self, entopts);
    }

    /// PaymentIframe entity bound to this client.
    pub fn payment_iframe(self: *@This(), entopts: Value) *@import("../entity/payment_iframe.zig").PaymentIframeEntity {
        return @import("../entity/payment_iframe.zig").PaymentIframeEntity.new(self, entopts);
    }

    /// ThreeDSecureAuth entity bound to this client.
    pub fn three_d_secure_auth(self: *@This(), entopts: Value) *@import("../entity/three_d_secure_auth.zig").ThreeDSecureAuthEntity {
        return @import("../entity/three_d_secure_auth.zig").ThreeDSecureAuthEntity.new(self, entopts);
    }

    /// ThreeDSecureBrowserInit entity bound to this client.
    pub fn three_d_secure_browser_init(self: *@This(), entopts: Value) *@import("../entity/three_d_secure_browser_init.zig").ThreeDSecureBrowserInitEntity {
        return @import("../entity/three_d_secure_browser_init.zig").ThreeDSecureBrowserInitEntity.new(self, entopts);
    }

    /// ThreeDSecureStatus entity bound to this client.
    pub fn three_d_secure_status(self: *@This(), entopts: Value) *@import("../entity/three_d_secure_status.zig").ThreeDSecureStatusEntity {
        return @import("../entity/three_d_secure_status.zig").ThreeDSecureStatusEntity.new(self, entopts);
    }

    /// TransactionDetail entity bound to this client.
    pub fn transaction_detail(self: *@This(), entopts: Value) *@import("../entity/transaction_detail.zig").TransactionDetailEntity {
        return @import("../entity/transaction_detail.zig").TransactionDetailEntity.new(self, entopts);
    }

    /// Webhook entity bound to this client.
    pub fn webhook(self: *@This(), entopts: Value) *@import("../entity/webhook.zig").WebhookEntity {
        return @import("../entity/webhook.zig").WebhookEntity.new(self, entopts);
    }

};

pub fn test_sdk(testopts_in: Value, sdkopts_in: Value) *BluefinPayconexSDK {
    const sdkopts: Value = switch (sdkopts_in) {
        .object => h.clone(sdkopts_in),
        else => h.omap(),
    };

    const testopts: Value = switch (testopts_in) {
        .object => h.clone(testopts_in),
        else => h.omap(),
    };
    h.setp(testopts, "active", h.vbool(true));

    // set_path mutates `sdkopts` in place; keep the ROOT (gotcha #8 — do not
    // rebind to the return of setpath).
    h.setpath(sdkopts, &.{ "feature", "test" }, testopts);

    const sdk = BluefinPayconexSDK.new(sdkopts);
    sdk.mode = "test";

    return sdk;
}
