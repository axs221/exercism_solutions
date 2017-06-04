defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    translate_all(String.split(phrase))
  end

  defp translate_all(nil), do: ""
  defp translate_all([]), do: ""

  defp translate_all(words) do
    [ next_word | other_words ] = words

    words = Enum.reject([ translate_word(next_word), translate_all(other_words) ], fn word -> word in [ nil, "" ] end)
    Enum.join(words, " ")
  end

  defp translate_word(word) do
    [ first_letter | other_letters ] = String.split(word, "")

    special_consonant_match = Regex.run(~r/^(ch|qu|squ|thr|th|sch)(.*)/, word)
    special_vowel_match = Regex.run(~r/^(yt|xr)(.*)/, word)

    cond do
      special_consonant_match -> with [ _, match, other_letters ] <- special_consonant_match,
                                 do: "#{other_letters}#{match}ay"
      special_vowel_match -> "#{word}ay"
      starts_with(:consonant, first_letter) -> "#{Enum.join(other_letters)}#{first_letter}ay"
      starts_with(:vowel, first_letter) -> "#{word}ay"
      true -> word
    end
  end

  defp starts_with(:vowel, letter) do
    Regex.match? ~r/^[aeiou]/i, letter
  end

  defp starts_with(:consonant, letter) do
    Regex.match? ~r/^[^aeiou]/i, letter
  end
end
