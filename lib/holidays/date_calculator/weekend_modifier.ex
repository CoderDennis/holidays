defmodule Holidays.DateCalculator.WeekendModifier do
  alias Holidays.DateCalculator.DateMath

  @doc """
  Move `date` to Monday if it occurs on a Saturday or Sunday.

  ## Examples

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_weekend({2015,12,5})
      {2015,12,7}

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_weekend({2015,12,6})
      {2015,12,7}

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_weekend({2015,12,8})
      {2015,12,8}

  """
  def to_monday_if_weekend(date) do
    case :calendar.day_of_the_week(date) do
      7 -> DateMath.add_days(date, 1)
      6 -> DateMath.add_days(date, 2)
      _ -> date
    end
  end

  @doc """
  Move `date` to Monday if it occurs on a Sunday.

  ## Examples

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_sunday({2015,12,5})
      {2015,12,5}

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_sunday({2015,12,6})
      {2015,12,7}

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_sunday({2015,12,8})
      {2015,12,8}

  """
  def to_monday_if_sunday(date) do
    case :calendar.day_of_the_week(date) do
      7 -> DateMath.add_days(date, 1)
      _ -> date
    end
  end

  # def to_weekday_if_boxing_weekend(date)

  # def to_weekday_if_boxing_weekend_from_year(year)

  @doc """
  Move `date` to Monday if it occurs on a Sunday or
  to Friday if it occurs on a Saturday.

  ## Examples

      iex> Holidays.DateCalculator.WeekendModifier.to_weekday_if_weekend({2015,12,5})
      {2015,12,4}

      iex> Holidays.DateCalculator.WeekendModifier.to_weekday_if_weekend({2015,12,6})
      {2015,12,7}

      iex> Holidays.DateCalculator.WeekendModifier.to_weekday_if_weekend({2015,12,8})
      {2015,12,8}

  """
  def to_weekday_if_weekend(date) do
    case :calendar.day_of_the_week(date) do
      7 -> DateMath.add_days(date, 1)
      6 -> DateMath.add_days(date, -1)
      _ -> date
    end
  end
end
