# add = fn a, b -> a + b end

defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts Math.sum 1, 2 
