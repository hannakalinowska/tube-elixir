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
  def start_process_manager(_process_manager_factory, card, station) do
    process_manager = Tube.Registry.create(Tube.Registry, "process_manager/#{card}", card)
    Tube.ProcessManager.enter(process_manager, station)
  end
end
