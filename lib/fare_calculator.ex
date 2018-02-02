defmodule Tube.FareCalculator do
  @doc """
  Calulate the fare for the given stations
  """
  def calculate(_station) do
    :timer.sleep(:rand.uniform(2_000) + 1_000)
    2.90
  end
end
