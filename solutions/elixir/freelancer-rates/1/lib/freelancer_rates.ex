defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (100-discount)/100
  end

  def monthly_rate(hourly_rate, discount) do
    base = 22*apply_discount(daily_rate(hourly_rate),discount)
    trunc(Float.ceil(base,0))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    base = budget/apply_discount(daily_rate(hourly_rate),discount)
    Float.floor(base,1)
  end
end
