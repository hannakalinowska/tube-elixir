defmodule Tube.ProcessManager do
  use Agent

  @doc """
  Start a process manager
  """
  def start_link(_card) do
    # TODO: store the card?
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Handle tube exit
  """
  def exit(_process_manager, station) do
    charge = Tube.FareCalculator.calculate(station)
    IO.puts "Charged #{charge} for journey to #{station}"
  end
end
