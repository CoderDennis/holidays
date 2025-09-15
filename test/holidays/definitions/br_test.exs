defmodule Holidays.BrTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.Br.init()
    :ok
  end

  doctest Holidays.Definitions.Br

  holiday_test("Confraternização Universal", ~D[2018-01-01], :br)
  holiday_test("Tiradentes", ~D[2018-04-21], :br)
  holiday_test("Dia do Trabalhador", ~D[2018-05-01], :br)
  holiday_test("Proclamação da Independência", ~D[2018-09-07], :br)
  holiday_test("Nossa Senhora Aparecida", ~D[2018-10-12], :br)
  holiday_test("Proclamação da República", ~D[2018-11-15], :br)
  holiday_test("Dia da Consciência Negra", ~D[2018-11-20], :br)
  holiday_test("Natal", ~D[2018-12-25], :br)
  holiday_test("Carnaval", ~D[2018-02-13], :br)
  holiday_test("Sexta-feira santa", ~D[2018-03-30], :br)
  holiday_test("Páscoa", ~D[2018-04-01], :br)
  holiday_test("Corpus Christi", ~D[2018-05-31], :br)
  holiday_test("Eleições", ~D[2018-10-07], :br)
end
