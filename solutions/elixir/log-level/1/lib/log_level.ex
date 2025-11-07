defmodule LogLevel do
  def to_label(level, legacy?) do
    matches = %{0 => :trace, 1 => :debug, 2 => :info, 3 => :warning, 4 => :error, 5 => :fatal}
    cond do
      level >= 1 and level <= 4 -> matches[level]
      level == 0 or level == 5 -> if legacy?, do: :unknown, else: matches[level]
      true -> :unknown
    end
  end
  def alert_recipient(level, legacy?) do
    note = to_label(level, legacy?)
    cond do
      note == :error or note == :fatal -> :ops
      note == :unknown -> if legacy?, do: :dev1, else: :dev2
      true -> false
    end
  end
end
