# ProjectName SDK exists test

import pytest
from bluefinpayconex_sdk import BluefinPayconexSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = BluefinPayconexSDK.test(None, None)
        assert testsdk is not None
