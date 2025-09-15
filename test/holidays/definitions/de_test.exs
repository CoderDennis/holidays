defmodule Holidays.DeTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.De.init()
    :ok
  end

  # Test cases from Ruby gem:
  holiday_test("Neujahrstag", ~D[2009-01-01], :de)
  holiday_test("Karfreitag", ~D[2009-04-10], :de)
  holiday_test("Ostermontag", ~D[2009-04-13], :de)
  holiday_test("Tag der Arbeit", ~D[2009-05-01], :de)
  holiday_test("Christi Himmelfahrt", ~D[2009-05-21], :de)
  holiday_test("Pfingstmontag", ~D[2009-06-01], :de)
  holiday_test("Tag der Deutschen Einheit", ~D[2009-10-03], :de)
  holiday_test("1. Weihnachtstag", ~D[2009-12-25], :de)
  holiday_test("1. Weihnachtstag", ~D[2009-12-25], :de_bw)
  holiday_test("1. Weihnachtstag", ~D[2009-12-25], :de_by)
  holiday_test("1. Weihnachtstag", ~D[2009-12-25], :de_by_aux)
  holiday_test("2. Weihnachtstag", ~D[2009-12-26], :de)
  holiday_test("1. Weihnachtstag", ~D[2009-12-25], [:de_bw, :de_by_aux])

  holiday_test("Heilige Drei Könige", ~D[2009-01-06], :de_bw)
  holiday_test("Heilige Drei Könige", ~D[2009-01-06], :de_by)
  holiday_test("Heilige Drei Könige", ~D[2009-01-06], :de_st)

  holiday_test("Fronleichnam", ~D[2009-06-11], :de_bw)
  holiday_test("Fronleichnam", ~D[2009-06-11], :de_by)
  holiday_test("Fronleichnam", ~D[2009-06-11], :de_he)
  holiday_test("Fronleichnam", ~D[2009-06-11], :de_nw)
  holiday_test("Fronleichnam", ~D[2009-06-11], :de_rp)
  holiday_test("Fronleichnam", ~D[2009-06-11], :de_sl)

  holiday_test("Mariä Himmelfahrt", ~D[2009-08-15], :de_by)
  holiday_test("Mariä Himmelfahrt", ~D[2009-08-15], :de_by_aux)
  holiday_test("Mariä Himmelfahrt", ~D[2009-08-15], :de_sl)

  holiday_test("Reformationstag", ~D[2009-10-31], :de_bb)
  holiday_test("Reformationstag", ~D[2009-10-31], :de_mv)
  holiday_test("Reformationstag", ~D[2009-10-31], :de_sn)
  holiday_test("Reformationstag", ~D[2009-10-31], :de_st)
  holiday_test("Reformationstag", ~D[2009-10-31], :de_th)

  holiday_test("Allerheiligen", ~D[2000-11-01], :de_bw)
  holiday_test("Allerheiligen", ~D[2000-11-01], :de_by)
  holiday_test("Allerheiligen", ~D[2000-11-01], :de_by_aux)
  holiday_test("Allerheiligen", ~D[2000-11-01], :de_nw)
  holiday_test("Allerheiligen", ~D[2000-11-01], :de_rp)
  holiday_test("Allerheiligen", ~D[2000-11-01], :de_sl)
  holiday_test("Allerheiligen", ~D[2000-11-01], [:de_bw, :de_sn])

  holiday_test("Friedensfest", ~D[2015-08-08], :de_by_aux)
  holiday_test("Friedensfest", ~D[2015-08-08], [:de_by_aux, :de_bw])

  holiday_test("Buß- und Bettag", ~D[2004-11-17], :de_sn)
  holiday_test("Buß- und Bettag", ~D[2005-11-16], :de_sn)
  holiday_test("Buß- und Bettag", ~D[2006-11-22], :de_sn)
  holiday_test("Buß- und Bettag", ~D[2009-11-18], :de_sn)
  holiday_test("Buß- und Bettag", ~D[2017-11-22], :de_sn)
end
