defmodule KV.RegistryTest do
  use ExUnit.Case, async: true
  alias KV.{Registry, Bucket}

  setup do
    registry = start_supervised!(Registry)
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert Registry.lookup(registry, "shopping") == :error

    Registry.create(registry, "shopping")
    assert {:ok, bucket} = Registry.lookup(registry, "shopping")

    Bucket.put(bucket, "milk", 1)
    assert Bucket.get(bucket, "milk") == 1
  end
end
