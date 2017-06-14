defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @spec age_on(planet, pos_integer) :: float
  defp age_in_years(:earth, earth_years), do: earth_years
  defp age_in_years(:mercury, earth_years), do: earth_years / 0.2408467
  defp age_in_years(:venus, earth_years), do: earth_years / 0.61519726
  defp age_in_years(:mars, earth_years), do: earth_years / 1.8808158
  defp age_in_years(:jupiter, earth_years), do: earth_years / 11.862615
  defp age_in_years(:saturn, earth_years), do: earth_years / 29.447498
  defp age_in_years(:uranus, earth_years), do: earth_years / 84.016846
  defp age_in_years(:neptune, earth_years), do: earth_years / 164.79132

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  def age_on(planet, seconds) do
    age_in_years(planet, ( seconds / 60 / 60 / 24 / 365.25 ))
  end
end

# IO.puts SpaceAge.age_on(:venus, 6.938e+8)
