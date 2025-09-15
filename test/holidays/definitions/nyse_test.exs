defmodule Holidays.NyseTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.Nyse.init()
    :ok
  end

  holiday_test("New Year's Day", ~D[2008-01-01], :nyse)
  holiday_test("Martin Luther King, Jr. Day", ~D[2008-01-21], :nyse)
  holiday_test("Presidents' Day", ~D[2008-02-18], :nyse)
  holiday_test("Good Friday", ~D[2008-03-21], :nyse)
  holiday_test("Memorial Day", ~D[2008-05-26], :nyse)
  holiday_test("Independence Day", ~D[2008-07-04], :nyse)
  holiday_test("Labor Day", ~D[2008-09-01], :nyse)
  holiday_test("Thanksgiving", ~D[2008-11-27], :nyse)
  holiday_test("Christmas Day", ~D[2008-12-25], :nyse)
end
