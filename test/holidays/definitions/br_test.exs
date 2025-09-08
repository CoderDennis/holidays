defmodule Holidays.BrTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.Br.init()
    :ok
  end

  holiday_test("Confraternização Universal", {2018, 1, 1}, :br)
  holiday_test("Tiradentes", {2018, 4, 21}, :br)
  holiday_test("Dia do Trabalhador", {2018, 5, 1}, :br)
  holiday_test("Proclamação da Independência", {2018, 9, 7}, :br)
  holiday_test("Nossa Senhora Aparecida", {2018, 10, 12}, :br)
  holiday_test("Proclamação da República", {2018, 11, 15}, :br)
  holiday_test("Dia da Consciência Negra", {2018, 11, 20}, :br)
  holiday_test("Natal", {2018, 12, 25}, :br)
  holiday_test("Carnaval", {2018, 2, 13}, :br)
  holiday_test("Sexta-feira santa", {2018, 3, 30}, :br)
  holiday_test("Páscoa", {2018, 4, 1}, :br)
  holiday_test("Corpus Christi", {2018, 5, 31}, :br)
  holiday_test("Eleições", {2018, 10, 7}, :br)
end
