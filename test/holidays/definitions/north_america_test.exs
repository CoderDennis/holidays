defmodule Holidays.Definitions.NorthAmericaTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.NorthAmerica.init()
    :ok
  end

  holiday_test("Groundhog Day", ~D[2016-02-02], :us)
  holiday_test("Groundhog Day", ~D[2016-02-02], :ca)
  holiday_test("Valentine's Day", ~D[2013-02-14], :ca)
  holiday_test("St. Patrick's Day", ~D[2013-03-17], :ca)
  holiday_test("April Fool's Day", ~D[2013-04-01], :ca)
  holiday_test("Earth Day", ~D[2013-04-22], :ca)
  holiday_test("Mother's Day", ~D[2013-05-12], :ca)
  holiday_test("Armed Forces Day", ~D[2013-05-18], :us)
  holiday_test("Father's Day", ~D[2013-06-16], :ca)
  holiday_test("Halloween", ~D[2013-10-31], :ca)
end
