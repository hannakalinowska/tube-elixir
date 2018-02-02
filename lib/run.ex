defmodule Tube.Run do
  @doc """
  Go!
  """
  def main(_args) do
    {:ok, bucket} = Tube.Bucket.start_link([])

    Enum.map(1..5, fn(card) ->
      Tube.Bucket.enter(bucket, card, 'Westminster')
      Tube.Bucket.exit(bucket, card, 'Camden Town')
    end)
  end
end
