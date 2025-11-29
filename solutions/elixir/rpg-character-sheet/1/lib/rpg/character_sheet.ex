defmodule RPG.CharacterSheet do
  def welcome() do
    # Please implement the welcome/0 function
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    # Please implement the ask_name/0 function
    IO.gets("What is your character's name?\n") |> String.trim()
  end

  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim()
  end

  def ask_level() do
    IO.gets("What is your character's level?\n") |> String.trim() |> String.to_integer()
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    %{class: class,level: level,name: name} |> IO.inspect(label: "Your character")
  end
end
