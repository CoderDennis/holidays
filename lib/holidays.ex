defmodule Holidays do
  use Holidays.Define

  alias Holidays.DateCalculator.Easter
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

  defp do_on({_year,  1,  1}, :us), do: [%{name: "New Year's Day"}]
  defp do_on({_year,  7,  4}, :us), do: [%{name: "Independence Day"}]
  defp do_on({_year, 11, 11}, :us), do: [%{name: "Veterans Day"}]
  defp do_on({_year, 12, 25}, :us), do: [%{name: "Christmas Day"}]
  defp do_on({_year, month, _day} = date, regions) do
    (DateMath.get_week_and_weekday(date)
    |> Enum.flat_map(fn {week, weekday} -> do_on(month, week, weekday, regions) end))
      ++ special_days(date, regions)
  end

  defp do_on(1,  :third,  :monday,   :us), do: [%{name: "Martin Luther King, Jr. Day"}]
  defp do_on(2,  :third,  :monday,   :us), do: [%{name: "Presidents' Day"}]
  defp do_on(5,  :last,   :monday,   :us), do: [%{name: "Memorial Day"}]
  defp do_on(9,  :first,  :monday,   :us), do: [%{name: "Labor Day"}]
  defp do_on(10, :second, :monday,   :us), do: [%{name: "Columbus Day"}]
  defp do_on(11, :fourth, :thursday, :us), do: [%{name: "Thanksgiving"}]
  defp do_on(_month, _week, _wday, _regions), do: []

  defp special_days({year, _, _} = date, :us) do
    easter_date = Easter.gregorian_easter_for(year)
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

end
