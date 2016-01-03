defmodule Holidays do

  alias Holidays.DateCalculator.Easter
  alias Holidays.DateCalculator.DateMath
  # alias Holidays.DateCalculator.WeekendModifier

  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday

  @type week :: :first | :second | :third | :fourth | :last

  defmacro __using__(_options) do
    quote do
      import unquote(__MODULE__)
      Module.register_attribute __MODULE__, :holidays, accumulate: true
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def list do
        IO.puts "Holidays (#{inspect @holidays})"
      end
    end
  end

  defmacro holiday(name, definition) do
    quote do
      @holidays {unquote(name), unquote(definition)}
    end
  end

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
  def on({_year,  1,  1}, [:us]), do: [%{name: "New Year's Day"}]
  def on({_year,  7,  4}, [:us]), do: [%{name: "Independence Day"}]
  def on({_year, 11, 11}, [:us]), do: [%{name: "Veterans Day"}]
  def on({_year, 12, 25}, [:us]), do: [%{name: "Christmas Day"}]
  def on({_year, month, _day} = date, regions) do
    (DateMath.get_week_and_weekday(date)
    |> Enum.flat_map(fn {week, weekday} -> on(month, week, weekday, regions) end))
      ++ special_days(date, regions)
  end

  defp on(1,  :third,  :monday,   [:us]), do: [%{name: "Martin Luther King, Jr. Day"}]
  defp on(2,  :third,  :monday,   [:us]), do: [%{name: "Presidents' Day"}]
  defp on(5,  :last,   :monday,   [:us]), do: [%{name: "Memorial Day"}]
  defp on(9,  :first,  :monday,   [:us]), do: [%{name: "Labor Day"}]
  defp on(10, :second, :monday,   [:us]), do: [%{name: "Columbus Day"}]
  defp on(11, :fourth, :thursday, [:us]), do: [%{name: "Thanksgiving"}]
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
