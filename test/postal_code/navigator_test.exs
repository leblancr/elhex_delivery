defmodule ElhexDelivery.PostalCode.NavigatorTest do
  @moduledoc false

  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Navigator  # then can just use last part

  describe "get_distance format tests" do
    test "postal code strings" do
      distance = Navigator.get_distance("06021", "95066")
      assert distance == 22.95
    end
    test "postal code integers" do
      distance = Navigator.get_distance(06021, 95066)
      assert distance == 22.95
    end
    test "postal code integers and strings" do
      distance = Navigator.get_distance(06021, "95066")
      assert distance == 22.95
    end
    test "postal code unexpected" do
      assert_raise ArgumentError, fn ->
        Navigator.get_distance(06021.45, "95066")
      end
    end
  end
end
