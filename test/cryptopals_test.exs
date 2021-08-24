defmodule CryptopalsTest do
  use ExUnit.Case
  doctest Cryptopals

  test "greets the world" do
    assert Cryptopals.hello() == :world
  end
end
