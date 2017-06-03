defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(Enum.filter(strand, fn x -> x == nucleotide end))
  end

  @doc " End of nucleotides list reached, return resulting histogram "
  def add_nucleotide_counts([], strand, hist) do
    hist
  end

  @doc """
  Create a map of nucleotides with counts.
  Presumably loop over each nucleotide. Recursively handle head of nucleotides array.
  """
  def add_nucleotide_counts([nucleotide | others], strand, hist) do
    new_hist = Map.put hist, nucleotide, count(strand, nucleotide)
    add_nucleotide_counts(others, strand, new_hist)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    add_nucleotide_counts(@nucleotides, strand, %{})
  end
end
