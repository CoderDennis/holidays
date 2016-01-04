defmodule Holidays do
  use Holidays.Define

  alias Holidays.DateCalculator.DateMath

  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday

  @type week :: :first | :second | :third | :fourth | :last

  @type region :: atom

  @doc """
  Returns a list of holidays on the given `date` for the specified `regions`.

  ## Examples

      iex> Holidays.on({2016, 1, 1}, [:us])
      [%{name: "New Year's Day"}]

  `on` calls into a private function `do_on`, which has many clauses to
  use patern matching to find holidays by `date` and `region`. These clauses
  are generated at compile time by modules in `Holidays.Definitions` which
  call the `holiday` macro.
  """
  @spec on(:calendar.date, [region]) :: list
  def on(date, regions) do
    regions
    |> Enum.flat_map(&(do_on(date, &1)))
  end

  # require Holidays.Definitions.Us
  # require Holidays.Definitions.NorthAmerica
  # require Holidays.Definitions.Nyse
  # require Holidays.Definitions.Ups

  for {name, _mod, definition} = holiday <- @holidays do
    # IO.inspect name
    # IO.inspect mod
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
      Dict.has_key?(definition, :function) ->
        @special_days holiday
    end
  end

  defp do_on({_year, month, _day} = date, region) do
    (DateMath.get_week_and_weekday(date)
    |> Enum.flat_map(fn {week, weekday} -> do_on(month, week, weekday, region) end))
      ++ special_days(date, region)
  end

  defp do_on(_month, _week, _wday, _region), do: []

  defp special_days(date, region) do
    @special_days
    |> Stream.filter(fn {_, _, definition} ->
      Enum.any?(Dict.fetch!(definition, :regions), fn r -> r == region end)
    end)
    |> Stream.filter(fn {_, mod, %{function: fun, regions: regions}} ->
      Enum.any?(regions, fn r -> r == region end) &&
        special_day(date, mod, fun) == date
    end)
    |> Enum.map(fn {name, _, _} -> %{name: name} end)

  end

  defp special_day(date, mod, {fun_name, args, days}) do
    special_day(date, mod, {fun_name, args})
    |> DateMath.add_days(days)
  end
  defp special_day({year, _, _}, mod, {fun_name, [:year]}) do
    if module_has_function?(mod, fun_name) do
      apply(mod, fun_name, [year])
    else
      apply(__MODULE__, fun_name, [year])
    end
  end

  @doc """
  Wrapper for `Holidays.DateCalculator.Easter.gregorian_easter_for(year)`
  """
  def easter(year) do
    Holidays.DateCalculator.Easter.gregorian_easter_for(year)
  end

  defp module_has_function?(mod, function_name) do
    Keyword.has_key?(mod.__info__(:functions), function_name)
  end
end
