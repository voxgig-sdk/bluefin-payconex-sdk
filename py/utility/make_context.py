# BluefinPayconex SDK utility: make_context

from core.context import BluefinPayconexContext


def make_context_util(ctxmap, basectx):
    return BluefinPayconexContext(ctxmap, basectx)
