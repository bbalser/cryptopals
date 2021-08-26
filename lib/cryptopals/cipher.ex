defmodule Cryptopals.Cipher do
  alias Cryptopals.Bytes

  def decrypt(binary) do
    byte_size = byte_size(binary)

    for single_byte_key <- 0..255, into: [] do
      key = :binary.copy(<<single_byte_key::8>>, byte_size)
      Bytes.xor(binary, key)
    end
    |> Enum.max_by(&Cryptopals.English.score/1)
  end

end
