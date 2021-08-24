defmodule Cryptopals.HexTest do
  use ExUnit.Case

  alias Cryptopals.Hex

  describe "decode/1" do
    test "converts hex to binary" do
      input = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
      result = Hex.decode(input)

      assert "I'm killing your brain like a poisonous mushroom" == result
    end
  end

  describe "encode/1" do
    test "converts binary to hex" do
      input = "I'm killing your brain like a poisonous mushroom"

      result = Hex.encode(input)

      assert "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d" == result
    end
  end
end
