defmodule NameBadge do
  def print(id, name, department) do
    if id == nil do
      "#{name} - #{if department == nil, do: "OWNER", else: String.upcase(department)}"
    else
      "[#{Integer.to_string(id)}] - #{name} - #{if department == nil, do: "OWNER", else: String.upcase(department)}"
    end
  end
end
