# MagicTheGatheringTwo SDK utility: make_context
require_relative '../core/context'
module MagicTheGatheringTwoUtilities
  MakeContext = ->(ctxmap, basectx) {
    MagicTheGatheringTwoContext.new(ctxmap, basectx)
  }
end
