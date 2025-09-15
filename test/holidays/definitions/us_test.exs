defmodule Holidays.UsTest do
  use HolidaysCase

  setup_all do
    restart_application()
    # Adding this extra definition module to test region selection.
    Holidays.Definitions.Ups.init()
    Holidays.Definitions.Us.init()
    :ok
  end

  doctest Holidays.Definitions.Us

  holiday_test("New Year's Day", ~D[2008-01-01], :us)
  holiday_test("Martin Luther King, Jr. Day", ~D[2008-01-21], :us)
  holiday_test("Presidents' Day", ~D[2008-02-18], :us)
  holiday_test("Memorial Day", ~D[2008-05-26], :us)
  holiday_test("Independence Day", ~D[2008-07-04], :us)
  holiday_test("Labor Day", ~D[2008-09-01], :us)
  holiday_test("Columbus Day", ~D[2008-10-13], :us)
  holiday_test("Veterans Day", ~D[2008-11-11], :us)
  holiday_test("Thanksgiving", ~D[2008-11-27], :us)
  holiday_test("Day after Thanksgiving", ~D[2008-11-28], :us)
  holiday_test("Thanksgiving", ~D[2013-11-28], :us)
  holiday_test("Day after Thanksgiving", ~D[2013-11-29], :us)
  holiday_test("Christmas Day", ~D[2008-12-25], :us)
  holiday_test("Easter Sunday", ~D[2016-03-27], :us)
  holiday_test("Good Friday", ~D[2016-03-25], :us)
  holiday_test("Inauguration Day", ~D[2025-01-20], :us_dc)
end
