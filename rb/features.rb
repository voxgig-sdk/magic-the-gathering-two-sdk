# MagicTheGatheringTwo SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module MagicTheGatheringTwoFeatures
  def self.make_feature(name)
    case name
    when "base"
      MagicTheGatheringTwoBaseFeature.new
    when "test"
      MagicTheGatheringTwoTestFeature.new
    else
      MagicTheGatheringTwoBaseFeature.new
    end
  end
end
