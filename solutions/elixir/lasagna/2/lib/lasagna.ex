defmodule Lasagna do
  # Write 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven(), do: 40
  # Write 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(minutes), do: expected_minutes_in_oven() - minutes
  # Write 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(layers), do: layers*2
  # Write 'total_time_in_minutes/2' function
  def total_time_in_minutes(layers,minutes), do: preparation_time_in_minutes(layers) + minutes
  # Write 'alarm/0' function
  def alarm(), do: "Ding!"
end
