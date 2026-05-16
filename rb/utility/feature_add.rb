# MagicTheGatheringTwo SDK utility: feature_add
module MagicTheGatheringTwoUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
