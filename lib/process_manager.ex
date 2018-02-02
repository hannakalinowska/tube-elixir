defmodule Tube.ProcessManager do
  use GenServer

  @doc """
  Start a process manager
  """
  def start_link(_card) do
    # TODO: store the card?
    GenServer.start_link(__MODULE__, :ok)
  end

  @doc """
  Handle tube exit
  """
  def exit(process_manager, station) do
    GenServer.cast(process_manager, {:exit, station})
  end

  def handle_cast({:exit, station}, _state) do
    charge = Tube.FareCalculator.calculate(station)
    IO.puts "Charged #{charge} for journey to #{station}"
    {:noreply, charge}
  end
end
