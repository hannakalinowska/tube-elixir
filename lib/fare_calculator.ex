defmodule Tube.FareCalculator do
  @doc """
  Calulate the fare for the given stations
  """
  def calculate(_station) do
    :timer.sleep(3000)
    2.90
  end
end
