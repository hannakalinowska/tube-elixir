defmodule Tube.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    registry = start_supervised!(Tube.Registry)
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert Tube.Registry.lookup(registry, "shopping") == :error

    Tube.Registry.create(registry, "shopping")
    assert {:ok, bucket} = Tube.Registry.lookup(registry, "shopping")

    Tube.Bucket.enter(bucket, "1234", "Westminster")
    assert Tube.Bucket.get(bucket, "1234") == "Westminster"
  end
end
