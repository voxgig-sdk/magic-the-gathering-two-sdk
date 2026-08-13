# MagicTheGatheringTwo SDK utility: make_context

from magicthegatheringtwo_sdk.core.context import MagicTheGatheringTwoContext


def make_context_util(ctxmap, basectx):
    return MagicTheGatheringTwoContext(ctxmap, basectx)
