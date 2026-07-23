// ListApiKeyScopesEntry entity client for the BluefinPayconex SDK.

using Voxgig.Struct;

namespace BluefinPayconexSdk.Entity;

public class ListApiKeyScopesEntryEntity : BluefinPayconexEntityBase
{
    public ListApiKeyScopesEntryEntity(BluefinPayconexSDK client, Dictionary<string, object?>? entopts = null)
        : base(client, entopts, "list_api_key_scopes_entry")
    {
    }

    public override IEntity Make()
    {
        return new ListApiKeyScopesEntryEntity(client, CloneOpts());
    }

    // (load not defined by this API - base class throws UnsupportedOp)

    public override object? List(Dictionary<string, object?>? reqmatch,
        Dictionary<string, object?>? ctrl = null)
    {
        var ctx = utility.MakeContext(new Dictionary<string, object?>
        {
            ["opname"] = "list",
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
            }
        });
    }

    // (create not defined by this API - base class throws UnsupportedOp)

    // (update not defined by this API - base class throws UnsupportedOp)

    // (remove not defined by this API - base class throws UnsupportedOp)
}
