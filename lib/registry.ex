defmodule Tube.Registry do
  use GenServer

  ## Client API

  @doc """
  Starts the registry
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`
  """
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`
  """
  def create(server, name) do
    GenServer.call(server, {:create, name})
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  def handle_call({:create, name}, _from, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = Tube.Bucket.start_link([])
      {:reply, :ok, Map.put(names, name, bucket)}
    end
  end
end
