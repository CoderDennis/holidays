defmodule Holidays.DateCalculator.WeekendModifier do
  @doc """
  Move `date` to Monday if it occurs on a Saturday or Sunday.

  ## Examples

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_weekend(~D[2015-12-05])
      ~D[2015-12-07]

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_weekend(~D[2015-12-06])
      ~D[2015-12-07]

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_weekend(~D[2015-12-08])
      ~D[2015-12-08]

  """
  def to_monday_if_weekend(date) do
    case Date.day_of_week(date) do
      6 -> Date.add(date, 2)
      7 -> Date.add(date, 1)
      _ -> date
    end
  end

  @doc """
  Move `date` to Monday if it occurs on a Sunday.

  ## Examples

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_sunday(~D[2015-12-05])
      ~D[2015-12-05]

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_sunday(~D[2015-12-06])
      ~D[2015-12-07]

      iex> Holidays.DateCalculator.WeekendModifier.to_monday_if_sunday(~D[2015-12-08])
      ~D[2015-12-08]

  """
  def to_monday_if_sunday(date) do
    case Date.day_of_week(date) do
      7 -> Date.add(date, 1)
      _ -> date
    end
  end

  # def to_weekday_if_boxing_weekend(date)

  # def to_weekday_if_boxing_weekend_from_year(year)

  @doc """
  Move `date` to Monday if it occurs on a Sunday or
  to Friday if it occurs on a Saturday.

  ## Examples

      iex> Holidays.DateCalculator.WeekendModifier.to_weekday_if_weekend(~D[2015-12-05])
      ~D[2015-12-04]

      iex> Holidays.DateCalculator.WeekendModifier.to_weekday_if_weekend(~D[2015-12-06])
      ~D[2015-12-07]

      iex> Holidays.DateCalculator.WeekendModifier.to_weekday_if_weekend(~D[2015-12-08])
      ~D[2015-12-08]

  """
  def to_weekday_if_weekend(date) do
    case Date.day_of_week(date) do
      7 -> Date.add(date, 1)
      6 -> Date.add(date, -1)
      _ -> date
    end
  end
end
