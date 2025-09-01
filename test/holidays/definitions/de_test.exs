defmodule Holidays.DeTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    restart_application()
    Holidays.Definitions.De.init()
    :ok
  end

  # Test cases from Ruby gem:
  holiday_test("Neujahrstag", {2009, 1, 1}, :de)
  holiday_test("Karfreitag", {2009, 4, 10}, :de)
  holiday_test("Ostermontag", {2009, 4, 13}, :de)
  holiday_test("Tag der Arbeit", {2009, 5, 1}, :de)
  holiday_test("Christi Himmelfahrt", {2009, 5, 21}, :de)
  holiday_test("Pfingstmontag", {2009, 6, 1}, :de)
  holiday_test("Tag der Deutschen Einheit", {2009, 10, 3}, :de)
  holiday_test("1. Weihnachtstag", {2009, 12, 25}, :de)
  holiday_test("1. Weihnachtstag", {2009, 12, 25}, :de_bw)
  holiday_test("1. Weihnachtstag", {2009, 12, 25}, :de_by)
  holiday_test("1. Weihnachtstag", {2009, 12, 25}, :de_by_aux)
  holiday_test("2. Weihnachtstag", {2009, 12, 26}, :de)
  holiday_test("1. Weihnachtstag", {2009, 12, 25}, [:de_bw, :de_by_aux])

  holiday_test("Heilige Drei Könige", {2009, 1, 6}, :de_bw)
  holiday_test("Heilige Drei Könige", {2009, 1, 6}, :de_by)
  holiday_test("Heilige Drei Könige", {2009, 1, 6}, :de_st)

  holiday_test("Fronleichnam", {2009, 6, 11}, :de_bw)
  holiday_test("Fronleichnam", {2009, 6, 11}, :de_by)
  holiday_test("Fronleichnam", {2009, 6, 11}, :de_he)
  holiday_test("Fronleichnam", {2009, 6, 11}, :de_nw)
  holiday_test("Fronleichnam", {2009, 6, 11}, :de_rp)
  holiday_test("Fronleichnam", {2009, 6, 11}, :de_sl)

  holiday_test("Mariä Himmelfahrt", {2009, 8, 15}, :de_by)
  holiday_test("Mariä Himmelfahrt", {2009, 8, 15}, :de_by_aux)
  holiday_test("Mariä Himmelfahrt", {2009, 8, 15}, :de_sl)

  holiday_test("Reformationstag", {2009, 10, 31}, :de_bb)
  holiday_test("Reformationstag", {2009, 10, 31}, :de_mv)
  holiday_test("Reformationstag", {2009, 10, 31}, :de_sn)
  holiday_test("Reformationstag", {2009, 10, 31}, :de_st)
  holiday_test("Reformationstag", {2009, 10, 31}, :de_th)

  holiday_test("Allerheiligen", {2000, 11, 1}, :de_bw)
  holiday_test("Allerheiligen", {2000, 11, 1}, :de_by)
  holiday_test("Allerheiligen", {2000, 11, 1}, :de_by_aux)
  holiday_test("Allerheiligen", {2000, 11, 1}, :de_nw)
  holiday_test("Allerheiligen", {2000, 11, 1}, :de_rp)
  holiday_test("Allerheiligen", {2000, 11, 1}, :de_sl)
  holiday_test("Allerheiligen", {2000, 11, 1}, [:de_bw, :de_sn])

  holiday_test("Friedensfest", {2015, 8, 8}, :de_by_aux)
  holiday_test("Friedensfest", {2015, 8, 8}, [:de_by_aux, :de_bw])

  holiday_test("Buß- und Bettag", {2004, 11, 17}, :de_sn)
  holiday_test("Buß- und Bettag", {2005, 11, 16}, :de_sn)
  holiday_test("Buß- und Bettag", {2006, 11, 22}, :de_sn)
  holiday_test("Buß- und Bettag", {2009, 11, 18}, :de_sn)
  holiday_test("Buß- und Bettag", {2017, 11, 22}, :de_sn)
end
