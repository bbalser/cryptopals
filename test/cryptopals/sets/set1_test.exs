defmodule Cryptopals.Sets.Set1Test do
  use ExUnit.Case

  alias Cryptopals.Base64
  alias Cryptopals.Hex

  describe "challenge 1" do
    test "convert hex to base64" do
      hex =
        "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

      result =
        hex
        |> Hex.decode()
        |> Base64.encode()

      assert "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t" == result
    end
  end
end
