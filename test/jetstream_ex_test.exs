defmodule JetstreamExTest do
  use ExUnit.Case
  doctest JetstreamEx

  test "greets the world" do
    assert JetstreamEx.hello() == :world
  end
end
