defmodule KV.BucketTest do
  use ExUnit.Case, async: true
  alias KV.Bucket

  test "stores values by key" do
    {:ok, bucket} = Bucket.start_link([])
    assert Bucket.get(bucket, "milk") == nil

    Bucket.put(bucket, "milk", 3)
    assert Bucket.get(bucket, "milk") == 3
  end
end
