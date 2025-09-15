defmodule Holidays.UpsTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.Ups.init()
    :ok
  end

  holiday_test("New Year's Day", ~D[2008-01-01], :ups)
  holiday_test("Memorial Day", ~D[2008-05-26], :ups)
  holiday_test("Independence Day", ~D[2008-07-04], :ups)
  holiday_test("Labor Day", ~D[2008-09-01], :ups)
  holiday_test("Thanksgiving", ~D[2008-11-27], :ups)
  holiday_test("Day after Thanksgiving", ~D[2008-11-28], :ups)
  holiday_test("Thanksgiving", ~D[2013-11-28], :ups)
  holiday_test("Day after Thanksgiving", ~D[2013-11-29], :ups)
  holiday_test("Christmas Day", ~D[2008-12-25], :ups)
  holiday_test("New Year's Eve", ~D[2015-12-31], :ups)
end
