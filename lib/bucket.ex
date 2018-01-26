defmodule Tube.Bucket do
  use Agent

  @doc """
  Starts a new Bucket record
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets the entry station for a card id
  """
  def get(bucket, id) do
    # &Map.get(&1, id)
    Agent.get(bucket, fn(bucket) -> Map.get(bucket, id) end)
  end

  @doc """
  Adds an entry station to a card
  """
  def enter(bucket, id, station) do
    # &Map.put(&1, id, station)
    Agent.update(bucket, fn(bucket) -> Map.put(bucket, id, station) end)
  end
end
