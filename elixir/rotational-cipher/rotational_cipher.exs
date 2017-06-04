defmodule RotationalCipher do
  defp convert_to_string char do
    << char :: utf8 >>
  end

  defp downshift_if_above code, max do
    if code > max, do: code - 26, else: code
  end

  defp rot(char, shift, max) do
    char + shift
    |> downshift_if_above(max)
    |> convert_to_string
  end

  defp rot(char, shift) when char >= ?a and char <= ?z do
    rot(char, shift, ?z)
  end

  defp rot(char, shift) when char >= ?A and char <= ?Z do
    rot(char, shift, ?Z)
  end

  defp rot(char, _) do
    convert_to_string char
  end

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> to_charlist
      |> Enum.map(&rot(&1, shift))
      |> Enum.reduce("", &(&2 <> &1))
  end
end
