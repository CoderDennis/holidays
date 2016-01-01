defmodule Holidays.DateCalculator.DateMath do
  @doc """
  Adds the given number of `days` to the given `date`.

  ## Examples

      iex> Holidays.DateCalculator.DateMath.add_days({2015, 12, 31}, 1)
      {2016, 1, 1}

      iex> Holidays.DateCalculator.DateMath.add_days({2016, 1, 6}, -12)
      {2015, 12, 25}

  """
  def add_days(date, days) do
    :calendar.gregorian_days_to_date(:calendar.date_to_gregorian_days(date) + days)
  end

  @doc """
  Returns the day number for the `wday` in week number `week` for the given
  `year` and `month`.

  ## Examples

      # The second Tuesday of June, 2013
      iex> Holidays.DateCalculator.DateMath.calculate_mday(2013, 6, 2, 2)
      {2013, 6, 11}

      # The third Friday of December, 2013
      iex> Holidays.DateCalculator.DateMath.calculate_mday(2013, 12, 3, 5)
      {2013, 12, 20}

      # The last Saturday of January, 2013
      iex> Holidays.DateCalculator.DateMath.calculate_mday(2013, 1, :last, 6)
      {2013, 1, 26}

  """
  def calculate_mday(year, month, :last, wday) do
    offset = :calendar.last_day_of_the_month(year, month) - 6
    do_calculate_mday(year, month, offset, wday)
  end
  def calculate_mday(year, month, week, wday) do
    offset = (week - 1) * 7 + 1
    do_calculate_mday(year, month, offset, wday)
  end

  defp do_calculate_mday(year, month, offset, wday) do
    day = wday - :calendar.day_of_the_week(year, month, offset) + offset
    correct_offset(year, month, day, offset)
  end

  defp correct_offset(year, month, day, offset) when day < offset do
    {year, month, day + 7}
  end
  defp correct_offset(year, month, day, _offset), do: {year, month, day}
end
