defmodule Holidays do

  alias Holidays.DateCalculator.Easter
  alias Holidays.DateCalculator.DateMath
  # alias Holidays.DateCalculator.WeekendModifier

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
  # def on(date, regions \\ [])
  def on({_,  1,  1}, [:us]), do: [%{name: "New Year's Day"}]
  def on({_,  7,  4}, [:us]), do: [%{name: "Independence Day"}]
  def on({_, 11, 11}, [:us]), do: [%{name: "Veterans Day"}]
  def on({_, 12, 25}, [:us]), do: [%{name: "Christmas Day"}]
  def on({_year, month, day} = date, regions) do
    wday = :calendar.day_of_the_week(date)
    week = div(day - 1, 7) + 1
    on(month, week, wday, regions) ++ special_days(date, regions)
  end

  defp on(1,  3, 1, [:us]), do: [%{name: "Martin Luther King, Jr. Day"}]
  defp on(2,  3, 1, [:us]), do: [%{name: "Presidents' Day"}]
  # defp on(5, :last, 1, [:us]), do: [%{name: "Memorial Day"}] # this one won't work yet!
  defp on(9,  1, 1, [:us]), do: [%{name: "Labor Day"}]
  defp on(10, 2, 1, [:us]), do: [%{name: "Columbus Day"}]
  defp on(11, 4, 4, [:us]), do: [%{name: "Thanksgiving"}]
  defp on(_month, _week, _wday, _regions), do: []

  defp special_days({year, _, _} = date, [:us]) do
    easter_date = Easter.gregorian_easter_for(year)
    good_friday_date = DateMath.add_days(easter_date, -2)
    day_after_thanksgiving = Holidays.Defenitions.Us.day_after_thanksgiving(year)
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
