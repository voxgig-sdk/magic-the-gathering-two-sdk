# ProjectName SDK exists test

import pytest
from magicthegatheringtwo_sdk import MagicTheGatheringTwoSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = MagicTheGatheringTwoSDK.test(None, None)
        assert testsdk is not None
