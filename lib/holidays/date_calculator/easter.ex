defmodule Holidays.DateCalculator.Easter do
  @doc ~s"""
  Returns the date of easter for the given `year`

  ## Examples

  iex> Holidays.DateCalculator.Easter.gregorian_easter_for(2016)
  {2016, 3, 27}

  iex> Holidays.DateCalculator.Easter.gregorian_easter_for(2015)
  {2015, 4, 5}

  """
  def gregorian_easter_for(year) do
    y = year
    a = rem(y, 19)
    b = div(y, 100)
    c = rem(y, 100)
    d = div(b, 4)
    e = rem(b, 4)
    f = (b + 8) |> div(25)
    g = (b - f + 1) |> div(3)
    h = (19 * a + b - d - g + 15) |> rem(30)
    i = div(c, 4)
    k = rem(c, 4)
    l = (32 + 2 * e + 2 * i - h - k) |> rem(7)
    m = (a + 11 * h + 22 * l) |> div(451)

    month = (h + l - 7 * m + 114) |> div(31)
    day = ((h + l - 7 * m + 114) |> rem(31)) + 1

    {year, month, day}
  end

  @doc ~s"""

  Returns the date of Orthodox Easter in the given `year`

  ## Examples

  iex> Holidays.DateCalculator.Easter.gregorian_orthodox_easter_for(2016)
  {2016, 5, 1}

  iex> Holidays.DateCalculator.Easter.gregorian_orthodox_easter_for(1815)
  {1815, 4, 30}

  iex> Holidays.DateCalculator.Easter.gregorian_orthodox_easter_for(2101)
  {2101, 4, 24}
  """
  def gregorian_orthodox_easter_for(year) do
    j_date = julian_orthodox_easter_for(year)

    case year do
      # up until 1582, julian and gregorian easter dates were identical
      _y when year <= 1582 -> offset = 0
      # between the years 1583 and 1699 10 days are added to the julian day count
      _y when (year >= 1583 and year <= 1699) -> offset = 10
      # after 1700, 1 day is added for each century, except if the century year is exactly divisible by 400 (in which case no days are added).
      # Safe until 4100 AD, when one leap day will be removed.
      year when year >= 1700 ->
        offset = div(year - 1600, 100) - div(year - 1600, 400) + 10
    end

    :calendar.gregorian_days_to_date(:calendar.date_to_gregorian_days(j_date) + offset)
  end

  def julian_orthodox_easter_for(year) do
    y = year
    g = rem(y, 19)
    i = (19 * g + 15) |> rem(30)
    j = (year + div(year, 4) + i) |> rem(7)
    j_month = 3 + div((i - j + 40), 44)
    j_day = i - j + 28 - 31 * div(j_month, 4)

    {year, j_month, j_day}
  end

end
