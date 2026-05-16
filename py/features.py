# MagicTheGatheringTwo SDK feature factory

from feature.base_feature import MagicTheGatheringTwoBaseFeature
from feature.test_feature import MagicTheGatheringTwoTestFeature


def _make_feature(name):
    features = {
        "base": lambda: MagicTheGatheringTwoBaseFeature(),
        "test": lambda: MagicTheGatheringTwoTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
