defmodule CliDemoTest do
  use ExUnit.Case
  doctest CliDemo

  test "greets the world" do
    assert CliDemo.hello() == :world
  end
end
