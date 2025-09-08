defmodule Holidays.NyseTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.Nyse.init()
    :ok
  end

  holiday_test("New Year's Day", {2008, 1, 1}, :nyse)
  holiday_test("Martin Luther King, Jr. Day", {2008, 1, 21}, :nyse)
  holiday_test("Presidents' Day", {2008, 2, 18}, :nyse)
  holiday_test("Good Friday", {2008, 3, 21}, :nyse)
  holiday_test("Memorial Day", {2008, 5, 26}, :nyse)
  holiday_test("Independence Day", {2008, 7, 4}, :nyse)
  holiday_test("Labor Day", {2008, 9, 1}, :nyse)
  holiday_test("Thanksgiving", {2008, 11, 27}, :nyse)
  holiday_test("Christmas Day", {2008, 12, 25}, :nyse)
end
