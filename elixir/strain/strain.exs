defmodule Strain do
  defp filter([], _) do
    []
  end

  defp filter([head | tail], fun) do
    result = if fun.(head), do: [ head ], else: []
    result ++ filter(tail, fun)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    filter(list, fun)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    filter(list, &( !fun.(&1) ))
  end
end

IO.inspect Strain.keep([1, 2, 3], &(Integer.mod(&1, 2) == 0))
