defmodule Tube.Run do
  @doc """
  Go!
  """
  def main(_args) do
    {:ok, bucket} = Tube.Bucket.start_link([])
    {:ok, process_manager_factory} = Tube.ProcessManagerFactory.start_link
    {:ok, registry} = Tube.Registry.start_link([name: Tube.Registry])

    # Plan:
    # * registry stores all the process managers,
    # * process manager factory stores the data for now and dispatches to the correct process manager
    # * starting station will remain fixed now to make things easier
    # * process manager starts on #exit and does the calculation

    Enum.map(1..2, fn(card) ->
      Tube.enter(process_manager_factory, card, 'Westminster')
      Tube.exit(card, 'Camden Town')
    end)

    :timer.sleep(10_000)
  end
end
