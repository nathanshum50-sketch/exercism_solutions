defmodule TakeANumber do
  def start() do
    spawn(fn -> process(0) end)
  end
  defp process(new) do
    receive do
      :stop -> nil
      {:report_state, sender_pid} ->
      send(sender_pid,new)
      process(new)
      {:take_a_number,sender_pid} ->
      send(sender_pid,new+1)
      process(new+1)
      _other -> process(new)
    end
  end
end
