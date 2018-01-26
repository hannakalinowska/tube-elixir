defmodule TubeTest do
  use ExUnit.Case
  doctest Tube

  test "greets the world" do
    assert Tube.hello() == :world
  end
end
