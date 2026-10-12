defmodule ElhexDelivery.PostalCode.DataParserTest do
  @moduledoc false

  use ExUnit.Case
  alias ElhexDelivery.PostalCode.DataParser  # then can just use last part
  doctest ElhexDelivery

  test "parse_data" do
    geolocation_data = DataParser.parse_data
    {latitude, longitude} = Map.get(geolocation_data, "06021")
    IO.inspect {latitude, longitude}

    assert is_float(latitude)
    assert is_float(longitude)
  end
end
