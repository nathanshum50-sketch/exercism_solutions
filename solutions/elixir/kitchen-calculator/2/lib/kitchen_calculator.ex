defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair,1)

  def to_milliliter({:cup,number}), do: {:milliliter,number*240}
  def to_milliliter({:tablespoon,number}), do: {:milliliter,number*15}
  def to_milliliter({:fluid_ounce,number}), do: {:milliliter,number*30}
  def to_milliliter({:teaspoon,number}), do: {:milliliter,number*5}
  def to_milliliter(volume_pair), do: volume_pair
  
  def from_milliliter(volume_pair, unit = :cup), do: {unit,elem(volume_pair,1)/240}
  def from_milliliter(volume_pair, unit = :fluid_ounce), do: {unit,elem(volume_pair,1)/30}
  def from_milliliter(volume_pair, unit = :teaspoon), do: {unit,elem(volume_pair,1)/5}
  def from_milliliter(volume_pair, unit = :tablespoon), do: {unit,elem(volume_pair,1)/15}
  def from_milliliter(volume_pair, _unit), do: volume_pair
  
  def convert(volume_pair, unit), do: to_milliliter(volume_pair) |> from_milliliter(unit)
end
