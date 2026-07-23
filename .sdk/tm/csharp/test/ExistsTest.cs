// BluefinPayconex SDK exists test.

using Xunit;

using BluefinPayconexSdk;

namespace BluefinPayconexSdk.Test;

public class ExistsTest
{
    [Fact]
    public void TestMode()
    {
        var testsdk = BluefinPayconexSDK.TestSDK(null, null);
        Assert.NotNull(testsdk);
    }
}
