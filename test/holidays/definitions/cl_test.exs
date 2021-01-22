defmodule Holidays.ClTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    restart_application()
    Holidays.Definitions.Cl.init()
    :ok
  end

  # Test cases from yaml file:
  holiday_test "Año Nuevo", {2014,1,1}, :cl
  holiday_test "Viernes Santo", {2011,4,22}, :cl
  holiday_test "Sábado Santo", {2011,4,23}, :cl
  holiday_test "Viernes Santo", {2012,4,6}, :cl
  holiday_test "Sábado Santo", {2012,4,7}, :cl
  holiday_test "Viernes Santo", {2013,3,29}, :cl
  holiday_test "Sábado Santo", {2013,3,30}, :cl
  holiday_test "Viernes Santo", {2014,4,18}, :cl
  holiday_test "Sábado Santo", {2014,4,19}, :cl
  holiday_test "Viernes Santo", {2015,4,3}, :cl
  holiday_test "Sábado Santo", {2015,4,4}, :cl
  holiday_test "Viernes Santo", {2016,3,25}, :cl
  holiday_test "Sábado Santo", {2016,3,26}, :cl
  holiday_test "Día del Trabajo", {2014,5,1}, :cl
  holiday_test "Día de las Glorias Navales", {2014,5,21}, :cl
  holiday_test "San Pedro y San Pablo", {2014,6,29}, :cl
  holiday_test "Día de la Virgen del Carmen", {2014,7,16}, :cl
  holiday_test "Asunción de la Virgen", {2014,8,15}, :cl
  holiday_test "Independencia Nacional", {2014,9,18}, :cl
  holiday_test "Día de las Glorias del Ejército", {2014,9,19}, :cl
  holiday_test "Encuentro de Dos Mundos", {2014,10,12}, :cl
  holiday_test "Día de las Iglesias Evangélicas y Protestantes", {2014,10,31}, :cl
  holiday_test "Día de Todos los Santos", {2014,11,1}, :cl
  holiday_test "Inmaculada Concepción de María", {2014,12,8}, :cl
  holiday_test "Navidad", {2014,12,25}, :cl
end
