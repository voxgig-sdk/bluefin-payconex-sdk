# BluefinPayconex SDK feature factory

defmodule BluefinPayconex.Features do
  def make_feature(name) do
    case name do
      "test" -> BluefinPayconex.Feature.Test.new()
      _ -> BluefinPayconex.Feature.new()
    end
  end
end
