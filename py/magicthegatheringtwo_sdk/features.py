# MagicTheGatheringTwo SDK feature factory

from magicthegatheringtwo_sdk.feature.base_feature import MagicTheGatheringTwoBaseFeature
from magicthegatheringtwo_sdk.feature.ratelimit_feature import MagicTheGatheringTwoRatelimitFeature
from magicthegatheringtwo_sdk.feature.retry_feature import MagicTheGatheringTwoRetryFeature
from magicthegatheringtwo_sdk.feature.test_feature import MagicTheGatheringTwoTestFeature
from magicthegatheringtwo_sdk.feature.timeout_feature import MagicTheGatheringTwoTimeoutFeature


_FEATURES = {
    "base": lambda: MagicTheGatheringTwoBaseFeature(),
    "ratelimit": lambda: MagicTheGatheringTwoRatelimitFeature(),
    "retry": lambda: MagicTheGatheringTwoRetryFeature(),
    "test": lambda: MagicTheGatheringTwoTestFeature(),
    "timeout": lambda: MagicTheGatheringTwoTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
