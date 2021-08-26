defmodule Cryptopals.Sets.Set1Test do
  use ExUnit.Case

  alias Cryptopals.Base64
  alias Cryptopals.Bytes
  alias Cryptopals.Cipher
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

  describe "challenge 2" do
    test "Fixed XOR" do
      input1 = "1c0111001f010100061a024b53535009181c" |> Hex.decode()
      input2 = "686974207468652062756c6c277320657965" |> Hex.decode()

      result = Bytes.xor(input1, input2) |> Hex.encode()

      assert "746865206b696420646f6e277420706c6179" == result
    end
  end

  describe "challenge 3" do
    test "single byte key decryption" do
      input = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
      input_bytes = Hex.decode(input)

      result = Cipher.decrypt(input_bytes)

      assert "Cooking MC's like a pound of bacon" == result
    end
  end

  describe "challenge 4" do
    test "correct entry" do
      input = "7b5a4215415d544115415d5015455447414c155c46155f4058455c5b523f"
      input_bytes = Hex.decode(input)

      result = Cipher.decrypt(input_bytes)

      assert "Now that the party is jumping\n" == result
    end

    test "detect single character XOR from file" do
      result =
        File.stream!("challenge4.txt")
        |> Stream.map(&String.trim/1)
        |> Stream.map(&Hex.decode/1)
        |> Stream.map(&Cipher.decrypt/1)
        |> Enum.max_by(&Cryptopals.English.score/1)

      assert "Now that the party is jumping\n" == result
    end
  end

  describe "challenge 5" do
    test "example" do
      input = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"

      result = Bytes.xor(input, "ICE") |> Hex.encode()

      assert "0b3637272a2b2e63622c2e69692a23693a2a3c6324202d623d63343c2a26226324272765272a282b2f20430a652e2c652a3124333a653e2b2027630c692b20283165286326302e27282f" ==
               result
    end
  end
end
