defmodule ElhexDelivery.PostalCode.DataParser do
  @moduledoc false
  @postal_code_file_path "data/2026_Gaz_zcta_national.txt"

  def parse_data do
    # first item goes to _header (ignored), everything else (a list of lines) goes to data_rows
    [_header | data_rows] = File.read!(@postal_code_file_path) |> String.split("\n")

    # one loop over all lines; builds the map directly
    for row <- data_rows,                                   # take each line in turn
        # split the line on |, then check it has exactly 8 fields and bind the ones we want;
        # rows that don't fit (e.g. the empty last line) are skipped automatically
        [postal_code, _, _, _, _, _, latitude, longitude] <- [String.split(row, "|")],
        into: %{} do                                        # collect results into a map
      # key is the postal code, value is a {latitude, longitude} tuple
      {postal_code, {to_float(latitude), to_float(longitude)}}
    end
  end

  # remove spaces, then convert the string to a float
  defp to_float(string), do: string |> String.replace(" ", "") |> String.to_float()
end
