defmodule Holidays do

  alias Holidays.Define

  @moduledoc """
  Provides the `on` function that gives a list of holidays for a date within
  specified regions.

  Dates in Erlang (and therefore Elixir) are represented by the tuple
  `{year, month, day}`.

  """

  alias Holidays.DateCalculator.DateMath

  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday

  @type week :: :first | :second | :third | :fourth | :last

  @type region :: atom

  @doc """
  Returns a list of holidays on the given `date` for the specified `regions`.

  ## Examples

      iex> Holidays.on({2016, 1, 1}, [:us])
      [%{name: "New Year's Day"}]

  """
  @spec on(:calendar.date, [region]) :: list
  def on(date, regions) do
    Holidays.Define.on(date, regions)
  end

  @doc """
  Wrapper for `Holidays.DateCalculator.Easter.gregorian_easter_for(year)`
  so Definition modules don't all need their own copy.

  For eample, in `Holidays.Definitions.Us`, Easter Sunday is defined like this:

      holiday "Easter Sunday",
        %{regions: [:us],
          function: {Holidays, :easter, [:year]},
          type: :informal}

  """
  def easter(year) do
    Holidays.DateCalculator.Easter.gregorian_easter_for(year)
  end

end
