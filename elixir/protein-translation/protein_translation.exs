defmodule ProteinTranslation do
  def of_rna([""]), do: { :ok, [] }
  def of_rna([ a, b, c | tail ]) do
    { status, codon } = of_codon("#{a}#{b}#{c}") 

    cond do
      codon === "STOP" -> { :ok, [] }
      status === :error -> { :error, "invalid RNA" }
      true -> case of_rna(tail) do
        { :error, _ } -> { :error, "invalid RNA" }
        { :ok, add_rna } -> { :ok, [ codon ] ++ add_rna }
        [] -> { :ok, [ ] }
      end
    end
  end

  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    of_rna(String.split(rna, ""))
  end

  @codons %{
    "AUG" => "Methionine", "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine", "UUG" => "Leucine", "UCU" => "Serine", "UCC" => "Serine",
    "UCA" => "Serine", "UCG" => "Serine", "UAU" => "Tyrosine", "UAC" => "Tyrosine",
    "UGU" => "Cysteine", "UGC" => "Cysteine", "UGG" => "Tryptophan", "UAA" => "STOP",
    "UAG" => "STOP", "UGA" => "STOP"
  }

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    if @codons[codon] do
      { :ok, @codons[codon] }
    else
      { :error, "invalid codon" }
    end
  end
end
