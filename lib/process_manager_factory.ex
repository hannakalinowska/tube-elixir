defmodule Tube.ProcessManagerFactory do
  use Agent

  @doc """
  Starts a new ProcessManagerFactory
  """
  def start_link do
    # TODO: do I need this?
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Starts a process manager for a journey
  """
  def start_process_manager(card, station) do
    {:ok, process_manager} = Tube.ProcessManager.start_link(card)
    Tube.ProcessManager.exit(process_manager, station)
  end
end