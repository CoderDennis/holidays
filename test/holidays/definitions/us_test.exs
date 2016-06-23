defmodule Holidays.UsTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    # Holidays.Define.start_link()
    restart_application()
    Holidays.Definitions.Us.init()
    :ok
  end

  holiday_test "New Year's Day", {2008, 1, 1}, :us
  holiday_test "Martin Luther King, Jr. Day", {2008, 1,21}, :us
  holiday_test "Presidents' Day", {2008, 2,18}, :us
  holiday_test "Memorial Day", {2008, 5,26}, :us
  holiday_test "Independence Day", {2008, 7, 4}, :us
  holiday_test "Labor Day", {2008, 9, 1}, :us
  holiday_test "Columbus Day", {2008,10,13}, :us
  holiday_test "Veterans Day", {2008,11,11}, :us
  holiday_test "Thanksgiving", {2008,11,27}, :us
  holiday_test "Day after Thanksgiving", {2008,11,28}, :us
  holiday_test "Thanksgiving", {2013,11,28}, :us
  holiday_test "Day after Thanksgiving", {2013,11,29}, :us
  holiday_test "Christmas Day", {2008,12,25}, :us
  holiday_test "Easter Sunday", {2016, 3,27}, :us
  holiday_test "Good Friday", {2016, 3,25}, :us

end
