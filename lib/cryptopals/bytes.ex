defmodule Cryptopals.Bytes do

  def xor(binary, key) do
    binary_list = :binary.bin_to_list(binary)
    key_list = :binary.bin_to_list(key)

    Enum.zip(binary_list, Stream.cycle(key_list))
    |> Enum.map(fn {b, k} -> do_xor(<<b>>, <<k>>, <<>>) end)
    |> :binary.list_to_bin()
  end

  defp do_xor(<<>>, <<>>, buf), do: buf

  defp do_xor(<<0::1, tail1::bitstring>>, <<0::1, tail2::bitstring>>, buf) do
    do_xor(tail1, tail2, <<buf::bitstring, 0::1>>)
  end

  defp do_xor(<<0::1, tail1::bitstring>>, <<1::1, tail2::bitstring>>, buf) do
    do_xor(tail1, tail2, <<buf::bitstring, 1::1>>)
  end

  defp do_xor(<<1::1, tail1::bitstring>>, <<0::1, tail2::bitstring>>, buf) do
    do_xor(tail1, tail2, <<buf::bitstring, 1::1>>)
  end

  defp do_xor(<<1::1, tail1::bitstring>>, <<1::1, tail2::bitstring>>, buf) do
    do_xor(tail1, tail2, <<buf::bitstring, 0::1>>)
  end
end
