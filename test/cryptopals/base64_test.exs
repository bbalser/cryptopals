defmodule Cryptopals.Base64Test do
  use ExUnit.Case

  alias Cryptopals.Base64

  describe "encode/1" do
    test "binary to base64" do
      input = "I'm killing your brain like a poisonous mushroom"

      result = Base64.encode(input)

      assert "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t" == result
    end

    test "example1" do
      input = <<155,162,233>>

      result = Base64.encode(input)

      assert "m6Lp" == result
    end

    test "example2" do
      input = "M"

      result = Base64.encode(input)

      assert "TQ==" == result
    end
  end
end
