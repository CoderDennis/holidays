defmodule Holidays.NoTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.No.init()
    :ok
  end

  # Test cases from yaml file:

  holiday_test("Nyttårsdag", ~D[2010-01-01], :no)
  holiday_test("1. mai", ~D[2010-05-01], :no)
  holiday_test("17. mai", ~D[2010-05-17], :no)
  holiday_test("Julaften", ~D[2010-12-24], :no)
  holiday_test("1. juledag", ~D[2010-12-25], :no)
  holiday_test("2. juledag", ~D[2010-12-26], :no)
  holiday_test("Nyttårsaften", ~D[2010-12-31], :no)
  holiday_test("Fastelavn", ~D[2010-02-14], :no)
  holiday_test("Palmesøndag", ~D[2010-03-28], :no)
  holiday_test("Skjærtorsdag", ~D[2010-04-01], :no)
  holiday_test("Langfredag", ~D[2010-04-02], :no)
  holiday_test("1. påskedag", ~D[2010-04-04], :no)
  holiday_test("2. påskedag", ~D[2010-04-05], :no)
  holiday_test("Kristi Himmelfartsdag", ~D[2010-05-13], :no)
  holiday_test("1. pinsedag", ~D[2010-05-23], :no)
  holiday_test("2. pinsedag", ~D[2010-05-24], :no)
end
