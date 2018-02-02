defmodule Tube.ProcessManager do
  use GenServer

  @doc """
  Start a process manager
  """
  def start_link(card) do
    # TODO: store the card?
    GenServer.start_link(__MODULE__, card)
  end

  @doc """
  Handle tube entry
  """
  def enter(process_manager, station) do
    GenServer.cast(process_manager, {:entry, station})
  end

  @doc """
  Handle tube exit
  """
  def exit(process_manager, station) do
    GenServer.cast(process_manager, {:exit, station})
  end

  def init(card) do
    {:ok, card}
  end

  def handle_cast({:entry, station}, state) do
    IO.puts "Entry #{state}: #{station}"
    {:noreply, station} # TODO: this should return new state
  end

  def handle_cast({:exit, station}, _state) do
    charge = Tube.FareCalculator.calculate(station)
    IO.puts "Charged #{charge} for journey to #{station}"
    {:noreply, charge} # TODO: this should stop
  end
end
