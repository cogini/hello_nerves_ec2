defmodule HelloNervesEc2Test do
  use ExUnit.Case
  doctest HelloNervesEc2

  test "greets the world" do
    assert HelloNervesEc2.hello() == :world
  end
end
