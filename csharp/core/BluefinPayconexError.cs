// BluefinPayconexError - the SDK error type. Carries the pipeline error code,
// the originating context and cleaned result/spec snapshots.

namespace BluefinPayconexSdk;

public class BluefinPayconexError : Exception
{
    public bool IsBluefinPayconexError = true;
    public string Sdk = "BluefinPayconex";
    public string Code;
    public Context? Ctx;
    public object? ResultVal;
    public object? SpecVal;

    public BluefinPayconexError(string code, string msg, Context? ctx)
        : base(msg)
    {
        Code = code;
        Ctx = ctx;
    }
}
