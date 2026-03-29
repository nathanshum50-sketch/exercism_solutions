defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: list |> Enum.at(0)

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head+1 | tail]

  def has_day_without_birds?(list), do: list |> Enum.any?(&(&1==0))
  
  def total([]), do: 0
  def total([head | tail]), do: head + total(tail) 

  def busy_days(list), do: list |> Enum.count(&(&1>=5))
end
