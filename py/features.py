# BluefinPayconex SDK feature factory

from feature.base_feature import BluefinPayconexBaseFeature
from feature.test_feature import BluefinPayconexTestFeature


def _make_feature(name):
    features = {
        "base": lambda: BluefinPayconexBaseFeature(),
        "test": lambda: BluefinPayconexTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
