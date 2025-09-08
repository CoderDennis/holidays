defmodule Holidays.Definitions.NorthAmericaTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.NorthAmerica.init()
    :ok
  end

  holiday_test("Groundhog Day", {2016, 2, 2}, :us)
  holiday_test("Groundhog Day", {2016, 2, 2}, :ca)
  holiday_test("Valentine's Day", {2013, 2, 14}, :ca)
  holiday_test("St. Patrick's Day", {2013, 3, 17}, :ca)
  holiday_test("April Fool's Day", {2013, 4, 1}, :ca)
  holiday_test("Earth Day", {2013, 4, 22}, :ca)
  holiday_test("Mother's Day", {2013, 5, 12}, :ca)
  holiday_test("Armed Forces Day", {2013, 5, 18}, :us)
  holiday_test("Father's Day", {2013, 6, 16}, :ca)
  holiday_test("Halloween", {2013, 10, 31}, :ca)
end
