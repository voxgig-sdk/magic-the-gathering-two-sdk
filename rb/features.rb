# MagicTheGatheringTwo SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module MagicTheGatheringTwoFeatures
  def self.make_feature(name)
    case name
    when "base"
      MagicTheGatheringTwoBaseFeature.new
    when "ratelimit"
      MagicTheGatheringTwoRatelimitFeature.new
    when "retry"
      MagicTheGatheringTwoRetryFeature.new
    when "test"
      MagicTheGatheringTwoTestFeature.new
    when "timeout"
      MagicTheGatheringTwoTimeoutFeature.new
    else
      MagicTheGatheringTwoBaseFeature.new
    end
  end
end
