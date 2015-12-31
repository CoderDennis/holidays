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
end
