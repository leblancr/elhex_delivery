defmodule ElhexDelivery.PostalCode.NavigatorTest do
  @moduledoc false

  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Navigator  # then can just use last part

  describe "get_distance format tests" do
    test "postal code strings" do
      distance = Navigator.get_distance("06021", "95066")
      assert is_float(distance)
    end
    test "postal code integers" do
      distance = Navigator.get_distance(06021, 95066)
      assert is_float(distance)
    end
    test "postal code integers and strings" do
      distance = Navigator.get_distance(06021, "95066")
      assert is_float(distance)
    end
    test "postal code unexpected" do
      assert_raise ArgumentError, fn ->
        Navigator.get_distance(06021.45, "95066")
      end  # passing anonymous func to assert, no () at end, not a call
    end
  end

  describe "get_distance (actual distance)" do
    #   SF -> NY: 2565.31
    #.RWC -> SF: 26.24
    #..MNPLS -> Austin: 1044.12
    test "distance between rwc_and_sf" do
      # Redwood city, CA 94062
      # San Fransisco, CA 94104
      # Driving distance ~ 40 miles
      distance = Navigator.get_distance(94062, 94104)
      # IO.puts "RWC -> SF: #{distance}"
      assert distance == 26.24
    end
    test "postal code integers" do
      # San Fransisco, CA 94104
      # New York, NY 10112
      # Driving distance ~ 3100 miles
      distance = Navigator.get_distance(94104, 10112)
      # IO.puts "SF -> NY: #{distance}"
      assert distance == 2565.31
    end
    test "postal code integers and strings" do
      # Minneapolis, MN 55401
      # Austin, TX 78703
      # Driving distance ~ 1100 miles
      distance = Navigator.get_distance(55401, 78703)
      # IO.puts "MNPLS -> Austin: #{distance}"
      assert distance == 1044.12
    end
  end
end
