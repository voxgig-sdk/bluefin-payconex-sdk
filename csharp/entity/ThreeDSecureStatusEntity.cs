// ThreeDSecureStatus entity client for the BluefinPayconex SDK.

using Voxgig.Struct;

namespace BluefinPayconexSdk.Entity;

public class ThreeDSecureStatusEntity : BluefinPayconexEntityBase
{
    public ThreeDSecureStatusEntity(BluefinPayconexSDK client, Dictionary<string, object?>? entopts = null)
        : base(client, entopts, "three_d_secure_status")
    {
    }

    public override IEntity Make()
    {
        return new ThreeDSecureStatusEntity(client, CloneOpts());
    }

    public override object? Load(Dictionary<string, object?>? reqmatch,
        Dictionary<string, object?>? ctrl = null)
    {
        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "load",
            ["ctrl"] = ctrl,
            ["match"] = match,
            ["data"] = data,
            ["reqmatch"] = reqmatch,
        }, entctx);
    
        return RunOp(ctx, () =>
        {
            if (ctx.Result != null)
            {
                if (ctx.Result.Resmatch != null)
                {
                    match = ctx.Result.Resmatch;
                }
                if (ctx.Result.Resdata != null)
                {
                    data = Helpers.ToMapAny(
                        Voxgig.Struct.StructUtils.Clone(ctx.Result.Resdata))
                        ?? new Dictionary<string, object?>();
                }
            }
        });
    }

    // (list not defined by this API - base class throws UnsupportedOp)

    // (create not defined by this API - base class throws UnsupportedOp)

    // (update not defined by this API - base class throws UnsupportedOp)

    // (remove not defined by this API - base class throws UnsupportedOp)
}
