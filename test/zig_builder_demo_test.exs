defmodule ZigBuilderDemoTest do
  use ExUnit.Case
  doctest ZigBuilderDemo

  test "greets the world" do
    assert ZigBuilderDemo.hello() == :world
  end
end
