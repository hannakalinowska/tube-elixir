defmodule Tube.Run do
  @doc """
  Go!
  """
  def main(_args) do
    {:ok, process_manager_factory} = Tube.ProcessManagerFactory.start_link
    {:ok, _registry} = Tube.Registry.start_link([name: Tube.Registry])

    # Plan:
    # * registry stores all the process managers,
    # * process manager factory stores the data for now and dispatches to the correct process manager
    # * starting station will remain fixed now to make things easier
    #
    # Next steps:
    # * multiple journeys on the same card
    # * stopping/restarting processes
    # * storing more complex data

    Enum.map(1..5, fn(card) ->
      spawn fn ->
        :timer.sleep(:rand.uniform(4000))
        Tube.enter(process_manager_factory, card, 'Westminster')
        :timer.sleep(:rand.uniform(300))
        Tube.exit(card, 'Camden Town')
      end
    end)

    :timer.sleep(10_000)
  end
end
