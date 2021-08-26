defmodule Cryptopals.Bytes do

  def xor(binary1, binary2) do
    do_xor(binary1, binary2, <<>>)
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
