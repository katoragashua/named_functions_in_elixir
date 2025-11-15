defmodule NamedFunctionsTest do
  use ExUnit.Case
  doctest NamedFunctions

  test "greets the world" do
    assert NamedFunctions.hello() == :world
  end
end
