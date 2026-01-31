defmodule WineCellar do
  def explain_colors do
    [white: "Fermented without skin contact.",red: "Fermented with skin contact using dark-colored grapes.",rose: "Fermented with some skin contact, but not enough to qualify as a red wine."]
  end

  def filter(cellar, color, opts \\ [])

  def filter([],_color,_opts), do: []
  
  def filter([{color, {_, _, _} = wine} | tail] = cellar, color, opts) do
    case opts do
      [{:year, year} | rest] -> filter_by_year(filter(cellar,color,rest),year)
      [{:country, country} | rest] -> filter_by_country(filter(cellar,color,rest),country)
      [] -> [wine | filter(tail,color,[])]
      [other | rest] -> [wine | filter(tail,color,rest)]
    end
  end
  
  def filter([{_, {_, _, _}} | tail], color, opts) do
    filter(tail,color,opts)
  end
  
  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
