defmodule Tube do
  @moduledoc """
  Documentation for Tube.
  """

  @doc """
  Register a station exit
  """
  def exit(process_manager_factory, card, station) do
    Tube.ProcessManager.exit(card, station)
    #Tube.ProcessManagerFactory.start_process_manager(process_manager_factory, card, station)
  end
end
