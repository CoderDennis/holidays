defmodule Holidays.Definitions.Ups do
  use Holidays.Define

  alias Holidays.DateCalculator.DateMath

  @moduledoc """
  UPS holiday definitions.

  source: http://www.ups.com/content/us/en/resources/ship/imp_exp/operation.html
  """

  holiday "New Year's Day",
    %{month: 1,
      regions: [:ups],
      day: 1,
      observed: {:to_weekday_if_weekend, [:date]}}

  holiday "Memorial Day",
    %{month: 5,
      week: :last,
      regions: [:ups],
      weekday: :monday}

  holiday "Independence Day",
    %{month: 7,
      regions: [:ups],
      day: 4,
      observed: {:to_weekday_if_weekend, [:date]}}

  holiday "Labor Day",
    %{month: 9,
      week: :first,
      regions: [:ups],
      weekday: :monday}

  holiday "Thanksgiving",
    %{month: 11,
      week: :fourth,
      regions: [:ups],
      weekday: :thursday}

  holiday "Day after Thanksgiving",
    %{month: 11,
      function: {:day_after_thanksgiving, [:year]},
      regions: [:ups]}

  holiday "Christmas Day",
    %{month: 12,
      regions: [:ups],
      day: 25,
      observed: {:to_weekday_if_weekend, [:date]}}

  holiday "New Year's Eve",
    %{month: 12,
      regions: [:ups],
      day: 31}

  def day_after_thanksgiving(year) do
    DateMath.get_weekth_day(year, 11, :fourth, :thursday)
    |> DateMath.add_days(1)
  end
end
