use Bitwise

defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    coms = [
      %{ command: "wink", b: 0b00001 },
      %{ command: "double blink", b: 0b00010 },
      %{ command: "close your eyes", b: 0b00100 },
      %{ command: "jump", b: 0b01000 }
    ]

    fc = Enum.filter(coms, fn(c) -> (c.b &&& code) != 0 end)
    fc = Enum.map(fc, fn(c) -> c.command end)

    if (code &&& 0b10000) != 0, do: Enum.reverse(fc), else: fc
  end
end
