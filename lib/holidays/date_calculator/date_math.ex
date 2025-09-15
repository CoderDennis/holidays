defmodule Holidays.DateCalculator.DateMath do
  @offset %{:first => 1, :second => 8, :third => 15, :fourth => 22}

  @doc """
  Returns the date for the `week`th `weekday` for the given `year` and `month`.

  `week` may be one of :first, :second, :third, :fourth, :last

  `weekday` may be a number between 1 and 7, which is the way Elixir
  represents Monday through Sunday. Or use one the atoms
  :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday

  ## Examples

      # The second Tuesday of June, 2013
      iex> Holidays.DateCalculator.DateMath.get_weekth_day(2013, 6, :second, :tuesday)
      ~D[2013-06-11]

      # The third Friday of December, 2013
      iex> Holidays.DateCalculator.DateMath.get_weekth_day(2013, 12, :third, :friday)
      ~D[2013-12-20]

      # The last Saturday of January, 2013
      iex> Holidays.DateCalculator.DateMath.get_weekth_day(2013, 1, :last, :saturday)
      ~D[2013-01-26]

  """
  @spec get_weekth_day(
          pos_integer,
          pos_integer,
          Holidays.week(),
          Holidays.weekday() | pos_integer
        ) :: Date.t()
  def get_weekth_day(year, month, :last, weekday) do
    offset = Date.days_in_month(Date.new!(year, month, 1)) - 6
    do_get_weekth_day(year, month, offset, weekday)
  end

  def get_weekth_day(year, month, week, weekday) do
    do_get_weekth_day(year, month, @offset[week], weekday)
  end

  @daynum %{
    :monday => 1,
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4,
    :friday => 5,
    :saturday => 6,
    :sunday => 7
  }

  @spec do_get_weekth_day(pos_integer, pos_integer, pos_integer, Holidays.weekday() | pos_integer) ::
          Date.t()
  defp do_get_weekth_day(year, month, offset, weekday) when not is_integer(weekday) do
    do_get_weekth_day(year, month, offset, @daynum[weekday])
  end

  defp do_get_weekth_day(year, month, offset, weekday) do
    date = Date.new!(year, month, offset)
    day = weekday - Date.day_of_week(date) + offset
    correct_offset(year, month, offset, day)
  end

  @spec correct_offset(pos_integer, pos_integer, pos_integer, integer) :: Date.t()
  defp correct_offset(year, month, offset, day) when day < offset do
    Date.new!(year, month, day + 7)
  end

  defp correct_offset(year, month, _offset, day), do: Date.new!(year, month, day)

  @dayname %{
    1 => :monday,
    2 => :tuesday,
    3 => :wednesday,
    4 => :thursday,
    5 => :friday,
    6 => :saturday,
    7 => :sunday
  }

  @doc """
  Returns a list of tuples with week and day atoms.

  The list will contain a single item except when the day is both the `:fourth`
  and the `:last` week.

  ## Examples

      iex> Holidays.DateCalculator.DateMath.get_week_and_weekday(~D[2016-01-29])
      [{:last, :friday}]

      iex> Holidays.DateCalculator.DateMath.get_week_and_weekday(~D[2016-01-25])
      [{:fourth, :monday}, {:last, :monday}]

      iex> Holidays.DateCalculator.DateMath.get_week_and_weekday(~D[2016-01-05])
      [{:first, :tuesday}]
  """
  @spec get_week_and_weekday(Date.t()) :: [{Holidays.week(), Holidays.weekday()}]
  def get_week_and_weekday(%Date{day: day} = date) do
    day_name = @dayname[Date.day_of_week(date)]

    week_name(div(day - 1, 7), day_name) ++
      check_last_week(
        Date.days_in_month(date) - day,
        day_name
      )
  end

  defp week_name(0, day_name), do: [{:first, day_name}]
  defp week_name(1, day_name), do: [{:second, day_name}]
  defp week_name(2, day_name), do: [{:third, day_name}]
  defp week_name(3, day_name), do: [{:fourth, day_name}]
  defp week_name(_, _), do: []

  defp check_last_week(daysleft, day_name) when daysleft < 7 do
    [{:last, day_name}]
  end

  defp check_last_week(_, _), do: []
end
