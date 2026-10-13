defmodule ElhexDelivery.PostalCode.StoreTest do
  @moduledoc false

  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Store  # then can just use last part

  test "get_geolocation" do
    {latitude, longitude} = Store.get_geolocation("06021")
    IO.inspect {latitude, longitude}

    assert is_float(latitude)
    assert is_float(longitude)
  end
end

