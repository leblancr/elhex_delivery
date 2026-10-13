defmodule ElhexDelivery.PostalCode.Navigator do
  @moduledoc false

  alias ElhexDelivery.PostalCode.Store  # then can just use last part

  def get_distance(from, to) do
    do_get_distance(from, to)
  end

  defp calculate_distance({lat1, long1}, {lat2, long2}) do

  end

  defp degrees_to_radians(degrees) do

  end

  defp do_get_distance(from, to) do
    {lat1, long1} = get_geolocation(from)
    {lat2, long2} = get_geolocation(to)

    calculate_distance({lat1, long1}, {lat2, long2})
  end

  defp get_geolocation(postal_code) when is_binary(postal_code) do
    Store.get_geolocation(postal_code)
  end

  defp get_geolocation(postal_code) when is_integer(postal_code) do
    postal_code = Integer.to_string(postal_code)
    get_geolocation(postal_code)
  end

  defp get_geolocation(postal_code) do
    error = "unexpected 'postal_code', received: (#(inspect(postal_code)))"
    raise ArgumentError, error
  end
end
