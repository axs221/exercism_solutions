use Bitwise

defmodule SecretHandshake do
  @commands [
    %{ command: "wink", b: 0b00001 },
    %{ command: "double blink", b: 0b00010 },
    %{ command: "close your eyes", b: 0b00100 },
    %{ command: "jump", b: 0b01000 }
  ]

  defp get_command_names c do
    Enum.map(c, fn c -> c.command end)
  end

  defp only_those_within_code commands, code do
    Enum.filter(commands, fn c -> (c.b &&& code) != 0 end)
  end

  defp reverse_if_code_given commands, code do
    if (code &&& 0b10000) != 0, do: Enum.reverse(commands), else: commands
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    @commands
      |> only_those_within_code(code)
      |> get_command_names
      |> reverse_if_code_given(code)
  end
end

IO.inspect SecretHandshake.commands(0b11010)
