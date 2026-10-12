defmodule ElhexDelivery.PostalCode.DataParser do
  @moduledoc false
  @postal_code_file_path "data/2026_Gaz_zcta_national.txt"

  def parse_data do
    # The first item goes to header, and everything else (as a list) goes to data_rows
    [header | data_rows] = File.read!(@postal_code_file_path) |> String.split("\n")
    IO.inspect header

    data_rows
    # split each line into a list of fields
    |> Enum.map(&String.split(&1, "|"))  # anonymous function, first arg passed in called &1
    # drop rows without exactly 8 fields (e.g. the empty last line)
    |> Enum.filter(fn(row) ->
      case row do
        [_, _, _, _, _, _, _, _] -> true   # exactly 8 fields: keep
        _ -> false                         # anything else: drop
      end
    end)
    # keep only postal code, latitude, longitude
    |> Enum.map(fn(row) ->
      [postal_code, _, _, _, _, _, latitude, longitude] = row  # shape check and binding
      [postal_code, latitude, longitude]
    end)
    # convert lat/long strings to floats
    |> Enum.map(fn(row) ->
      [postal_code, latitude, longitude] = row
      latitude = latitude |> String.replace(" ", "") |> String.to_float
      longitude = longitude |> String.replace(" ", "") |> String.to_float
      {postal_code, {latitude, longitude}}
    end)
    |> Enum.into(%{})
  end
end
