defmodule Holidays do
  use Holidays.Define

  # alias Holidays.DateCalculator.Easter
  alias Holidays.DateCalculator.DateMath
  # alias Holidays.DateCalculator.WeekendModifier

  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday

  @type week :: :first | :second | :third | :fourth | :last

  @doc """
  Returns a list of holidays on the given `date` for the specified `regions`.

  ## Examples

      iex> Holidays.on({2016, 1, 1}, [:us])
      [%{name: "New Year's Day"}]

  **Note:** The plan is to use compile time code generation (or macros) to
  produce all clauses of `on` by pulling from the code in each of several
  definitions modules like `Holidays.Defenitions.Us`.
  However, I started by writing out the implementations explicitly to get the
  API right and tests in place.
  """
  @spec on(:calendar.date, list) :: list
  def on(date, regions) do
    regions
    |> Enum.flat_map(&(do_on(date, &1)))
  end

  for {name, definition} <- @holidays do
    # IO.inspect name
    month = case Dict.fetch(definition, :month) do
              {:ok, m} -> m
              _ -> nil
    end
    regions = Dict.fetch!(definition, :regions)
    result = Code.string_to_quoted!(~s/[%{name: #{inspect name}}]/)
    cond do
      Dict.has_key?(definition, :day) ->
        # IO.inspect name
        day = Dict.fetch!(definition, :day)
        Enum.each(regions, fn region ->
          defp do_on({_year,
                      unquote(month),
                      unquote(day)},
                     unquote(region)), do: unquote(result)
        end)
      Dict.has_key?(definition, :week) ->
        week = Dict.fetch!(definition, :week)
        weekday = Dict.fetch!(definition, :weekday)
        Enum.each(regions, fn region ->
          defp do_on(unquote(month),
                     unquote(week),
                     unquote(weekday),
                     unquote(region)), do: unquote(result)
        end)
      true -> nil
    end
  end

  defp do_on({_year, month, _day} = date, region) do
    (DateMath.get_week_and_weekday(date)
    |> Enum.flat_map(fn {week, weekday} -> do_on(month, week, weekday, region) end))
      ++ special_days(date, region)
  end

  defp do_on(_month, _week, _wday, _region), do: []

  defp special_days({year, _, _} = date, :us) do
    easter_date = Holidays.Definitions.Us.easter(year)
    good_friday_date = DateMath.add_days(easter_date, -2)
    day_after_thanksgiving = Holidays.Definitions.Us.day_after_thanksgiving(year)
    cond do
      date == easter_date ->
        [%{name: "Easter Sunday"}]
      date == good_friday_date ->
        [%{name: "Good Friday"}]
      date == day_after_thanksgiving ->
        [%{name: "Day after Thanksgiving"}]
      true -> []
    end
  end
  defp special_days(_, _), do: []

end
