defmodule Holidays.Definitions.NorthAmericaTest do
  use ExUnit.Case

  alias Holidays.TestHelper

  test "Groundhog Day in the US" do
    TestHelper.date_has_holiday_in_region({2016, 2, 2},
                                          "Groundhog Day",
                                          :us)
  end

  test "Groundhog Day in the Canada" do
    TestHelper.date_has_holiday_in_region({2016, 2, 2},
                                          "Groundhog Day",
                                          :ca)
  end
end
