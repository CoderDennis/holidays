defmodule Holidays.NoTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    restart_application()
    Holidays.Definitions.No.init()
    :ok
  end

  # Test cases from yaml file:

  holiday_test("Nyttårsdag", {2010, 1, 1}, :no)
  holiday_test("1. mai", {2010, 5, 1}, :no)
  holiday_test("17. mai", {2010, 5, 17}, :no)
  holiday_test("Julaften", {2010, 12, 24}, :no)
  holiday_test("1. juledag", {2010, 12, 25}, :no)
  holiday_test("2. juledag", {2010, 12, 26}, :no)
  holiday_test("Nyttårsaften", {2010, 12, 31}, :no)
  holiday_test("Fastelavn", {2010, 2, 14}, :no)
  holiday_test("Palmesøndag", {2010, 3, 28}, :no)
  holiday_test("Skjærtorsdag", {2010, 4, 1}, :no)
  holiday_test("Langfredag", {2010, 4, 2}, :no)
  holiday_test("1. påskedag", {2010, 4, 4}, :no)
  holiday_test("2. påskedag", {2010, 4, 5}, :no)
  holiday_test("Kristi Himmelfartsdag", {2010, 5, 13}, :no)
  holiday_test("1. pinsedag", {2010, 5, 23}, :no)
  holiday_test("2. pinsedag", {2010, 5, 24}, :no)
end
