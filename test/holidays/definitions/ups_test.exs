defmodule Holidays.UpsTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    restart_application()
    Holidays.Definitions.Ups.init()
    :ok
  end

  holiday_test "New Year's Day", {2008, 1, 1}, :ups
  holiday_test "Memorial Day", {2008, 5,26}, :ups
  holiday_test "Independence Day", {2008, 7, 4}, :ups
  holiday_test "Labor Day", {2008, 9, 1}, :ups
  holiday_test "Thanksgiving", {2008,11,27}, :ups
  holiday_test "Day after Thanksgiving", {2008,11,28}, :ups
  holiday_test "Thanksgiving", {2013,11,28}, :ups
  holiday_test "Day after Thanksgiving", {2013,11,29}, :ups
  holiday_test "Christmas Day", {2008,12,25}, :ups
  holiday_test "New Year's Eve", {2015,12,31}, :ups

end
