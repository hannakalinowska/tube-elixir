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
  Looks up the process manager pid for `name` stored in `server`
  """
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a process manager associated with the given `name` in `server`
  """
  def create(server, name, card) do
    GenServer.call(server, {:create, name, card})
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  def handle_call({:create, name, card}, _from, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, process_manager} = Tube.ProcessManager.start_link(card)
      {:reply, process_manager, Map.put(names, name, process_manager)}
    end
  end
end
