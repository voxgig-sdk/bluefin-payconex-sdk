// AccountUpdaterSchedule entity client for the BluefinPayconex SDK.

using Voxgig.Struct;

namespace BluefinPayconexSdk.Entity;

public class AccountUpdaterScheduleEntity : BluefinPayconexEntityBase
{
    public AccountUpdaterScheduleEntity(BluefinPayconexSDK client, Dictionary<string, object?>? entopts = null)
        : base(client, entopts, "account_updater_schedule")
    {
    }

    public override IEntity Make()
    {
        return new AccountUpdaterScheduleEntity(client, CloneOpts());
    }

    // (load not defined by this API - base class throws UnsupportedOp)

    // (list not defined by this API - base class throws UnsupportedOp)

    public override object? Create(Dictionary<string, object?>? reqdata,
        Dictionary<string, object?>? ctrl = null)
    {
        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "create",
            ["ctrl"] = ctrl,
            ["match"] = match,
            ["data"] = data,
            ["reqdata"] = reqdata,
        }, entctx);
    
        return RunOp(ctx, () =>
        {
            if (ctx.Result != null)
            {
                if (ctx.Result.Resdata != null)
                {
                    data = Helpers.ToMapAny(
                        Voxgig.Struct.StructUtils.Clone(ctx.Result.Resdata))
                        ?? new Dictionary<string, object?>();
                }
            }
        });
    }

    // (update not defined by this API - base class throws UnsupportedOp)

    // (remove not defined by this API - base class throws UnsupportedOp)
}
