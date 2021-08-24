defmodule Cryptopals.Hex do

  @digits %{
    "0" => <<0::size(4)>>,
    "1" => <<1::size(4)>>,
    "2" => <<2::size(4)>>,
    "3" => <<3::size(4)>>,
    "4" => <<4::size(4)>>,
    "5" => <<5::size(4)>>,
    "6" => <<6::size(4)>>,
    "7" => <<7::size(4)>>,
    "8" => <<8::size(4)>>,
    "9" => <<9::size(4)>>,
    "a" => <<10::size(4)>>,
    "b" => <<11::size(4)>>,
    "c" => <<12::size(4)>>,
    "d" => <<13::size(4)>>,
    "e" => <<14::size(4)>>,
    "f" => <<15::size(4)>>
  }

  @stuff Enum.map(@digits, fn {a, b} -> {b, a} end) |> Map.new()

  def decode(string) do
    points = string |> String.downcase() |> String.codepoints()

    for digit <- points, into: "" do
      Map.get(@digits, digit)
    end
  end

  def encode(binary) do
    for chunk <- chunk(binary, []), into: "" do
      Map.get(@stuff, chunk)
    end
  end

  defp chunk(<<number::size(4), remaining::bitstring>>, list) do
    chunk(remaining, [<<number::size(4)>> | list])
  end

  defp chunk(<<>>, list), do: Enum.reverse(list)

end
