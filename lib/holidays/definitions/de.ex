defmodule Holidays.Definitions.De do
  import Holidays.Define

  alias Holidays.DateCalculator.DateMath

# Ported from German holiday definitions in the Ruby Holiday gem.
#
# Updated: 2009-11-05.
# Sources:
# - http://en.wikipedia.org/wiki/Holidays_in_Germany
# - http://www.timeanddate.com/calendar/index.html?country=8
# - http://www.germany.info/relaunch/welcome/travel/holidays.html

  @moduledoc """
  German holiday definitions.

  """
  def init() do

    # Variable date:
    
    holiday "Karfreitag",
      %{regions: [:de],
        function: {Holidays, :easter, [:year], -2}}

    holiday "Ostermontag",
      %{regions: [:de],
        function: {Holidays, :easter, [:year], 1}}

    holiday "Christi Himmelfahrt",
      %{regions: [:de],
        function: {Holidays, :easter, [:year], 39}}

    holiday "Pfingstmontag",
      %{regions: [:de],
        function: {Holidays, :easter, [:year], 50}}

    holiday "Fronleichnam",
      %{regions: [:de_bw, :de_by, :de_he, :de_nw, :de_rp, :de_sl],
        function: {Holidays, :easter, [:year], 60}}

    # January:
    
    holiday "Neujahrstag",
      %{month: 1,
        regions: [:de],
        day: 1}

    holiday "Heilige Drei Könige",
      %{month: 1,
        regions: [:de_bw, :de_by, :de_st],
        day: 6}

    # May:
    
    holiday "Tag der Arbeit",
      %{month: 5,
        regions: [:de],
        day: 1}

    # August:

    holiday "Mariä Himmelfahrt",
      %{month: 8,
        regions: [:de_by, :de_sl],
        day: 15}
    
    holiday "Friedensfest",
      %{month: 8,
        regions: [:de_by_aux],
        day: 8}
    
    # October:

    holiday "Tag der Deutschen Einheit",
      %{month: 10,
        regions: [:de],
        day: 3}
    
    holiday "Reformationstag",
      %{month: 10,
        regions: [:de_bb, :de_mv, :de_sn, :de_st, :de_th],
        day: 31}
    
    # November:

    holiday "Allerheiligen",
      %{month: 11,
        regions: [:de_bw, :de_by, :de_nw, :de_rp, :de_sl],
        day: 1}
    
    holiday "Buß- und Bettag",
      %{month: 11,
        regions: [:de_sn],
        function: {Holidays.Definitions.De, :buss_und_bettag, [:year]}}

    # December:

    holiday "1. Weihnachtstag",
      %{month: 12,
        regions: [:de],
        day: 25}
    
    holiday "2. Weihnachtstag",
      %{month: 12,
        regions: [:de],
        day: 26}
  end

  def buss_und_bettag(year) do
    wday = rem(:calendar.day_of_the_week(year, 11, 23), 7)
    if wday > 3 do
      {year, 11, 23 - (wday - 3)}
    else
      {year, 11, 23 - (wday + 4)}
    end
  end
end
