defmodule Tube.BucketTest do
  use ExUnit.Case, async: true

  setup do
    bucket = start_supervised!(Tube.Bucket, [])
    %{bucket: bucket}
  end

  test 'stores a list of card ids', %{bucket: bucket} do
    assert Tube.Bucket.get(bucket, '1234') == nil

    Tube.Bucket.enter(bucket, '1234', 'Westminster')
    assert Tube.Bucket.get(bucket, '1234') == 'Westminster'
  end
end
