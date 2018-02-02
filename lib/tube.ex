defmodule Tube do
  @moduledoc """
  Documentation for Tube.
  """

  @doc """
  Register a station entry
  """
  def enter(process_manager_factory, card, station) do
    Tube.ProcessManagerFactory.start_process_manager(process_manager_factory, card, station)
  end

  @doc """
  Register a station exit
  """
  def exit(card, station) do
    {:ok, process_manager} = Tube.Registry.lookup(Tube.Registry, "process_manager/#{card}")
    Tube.ProcessManager.exit(process_manager, station)
  end
end
