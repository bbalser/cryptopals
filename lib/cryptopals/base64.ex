defmodule Cryptopals.Base64 do
  @b64_mapping 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

  @b64 Enum.with_index(@b64_mapping) |> Enum.map(fn {a, b} -> {b, a} end) |> Map.new()

  @padding "="

  def encode(binary) do
    parts = for chunk <- chunk(binary, []), do: Map.get(@b64, chunk)

    pad_count = rem(length(parts), 4)
    to_string(parts) <> String.duplicate(@padding, pad_count)
  end

  defp chunk(<<part::size(6), remaining::bitstring>>, list) do
    chunk(remaining, [part | list])
  end

  defp chunk(<<>>, list) do
    Enum.reverse(list)
  end

  defp chunk(remaining, list) do
    n = 6 - bit_size(remaining)
    <<part::size(6)>> = <<remaining::bitstring, 0::size(n)>>
    chunk(<<>>, [part | list])
  end
end
