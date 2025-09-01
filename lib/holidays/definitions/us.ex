defmodule Holidays.Definitions.Us do
  import Holidays.Define

  alias Holidays.DateCalculator.DateMath

  @moduledoc """
  United States holiday definitions.

  """
  def init() do
    holiday(
      "Good Friday",
      %{regions: [:us], function: {Holidays, :easter, [:year], -2}, type: :informal}
    )

    holiday(
      "Easter Sunday",
      %{regions: [:us], function: {Holidays, :easter, [:year]}, type: :informal}
    )

    holiday(
      "New Year's Day",
      %{month: 1, regions: [:us], day: 1, observed: {:to_weekday_if_weekend, [:date]}}
    )

    holiday(
      "Martin Luther King, Jr. Day",
      %{month: 1, week: :third, regions: [:us], weekday: :monday}
    )

    holiday(
      "Inauguration Day",
      %{
        month: 1,
        function: {Holidays.Definitions.Us, :inauguration_day, [:year]},
        regions: [:us_dc]
      }
    )

    holiday(
      "Presidents' Day",
      %{month: 2, week: :third, regions: [:us], weekday: :monday}
    )

    holiday(
      "Cesar Chavez Day",
      %{month: 3, regions: [:us_ca], day: 31}
    )

    holiday(
      "Memorial Day",
      %{month: 5, week: :last, regions: [:us], weekday: :monday}
    )

    holiday(
      "Independence Day",
      %{month: 7, regions: [:us], day: 4, observed: {:to_weekday_if_weekend, [:date]}}
    )

    holiday(
      "Labor Day",
      %{month: 9, week: :first, regions: [:us], weekday: :monday}
    )

    holiday(
      "Columbus Day",
      %{month: 10, week: :second, regions: [:us], weekday: :monday}
    )

    holiday(
      "Veterans Day",
      %{month: 11, regions: [:us], day: 11, observed: {:to_weekday_if_weekend, [:date]}}
    )

    holiday(
      "Thanksgiving",
      %{month: 11, week: :fourth, regions: [:us], weekday: :thursday}
    )

    holiday(
      "Day after Thanksgiving",
      %{
        month: 11,
        function: {Holidays.Definitions.Us, :day_after_thanksgiving, [:year]},
        regions: [:us]
      }
    )

    holiday(
      "Christmas Day",
      %{month: 12, regions: [:us], day: 25, observed: {:to_weekday_if_weekend, [:date]}}
    )
  end

  @doc """
  January 20, every fourth year, following Presidential election.

  ## Examples

      iex> Holidays.Defenitions.Us.inauguration_day(2016)
      :none

      iex> Holidays.Defenitions.Us.inauguration_day(2017)
      {2017, 1, 20}

      iex> Holidays.Defenitions.Us.inauguration_day(2018)
      :none
  """
  def inauguration_day(year) when rem(year, 4) == 1, do: {:ok, {year, 1, 20}}
  def inauguration_day(_year), do: :none

  def day_after_thanksgiving(year) do
    DateMath.get_weekth_day(year, 11, :fourth, :thursday)
    |> DateMath.add_days(1)
  end
end
