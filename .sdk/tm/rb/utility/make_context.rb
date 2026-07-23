# BluefinPayconex SDK utility: make_context
require_relative '../core/context'
module BluefinPayconexUtilities
  MakeContext = ->(ctxmap, basectx) {
    BluefinPayconexContext.new(ctxmap, basectx)
  }
end
