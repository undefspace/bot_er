defmodule BotErTest do
  use ExUnit.Case
  doctest BotEr

  test "greets the world" do
    assert BotEr.hello() == :world
  end
end
