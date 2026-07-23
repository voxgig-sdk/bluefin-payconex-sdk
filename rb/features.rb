# BluefinPayconex SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module BluefinPayconexFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinPayconexBaseFeature.new
    when "test"
      BluefinPayconexTestFeature.new
    else
      BluefinPayconexBaseFeature.new
    end
  end
end
