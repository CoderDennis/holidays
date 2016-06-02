defmodule Holidays.Definitions.Ups do
  import Holidays.Define

  alias Holidays.DateCalculator.DateMath

  @moduledoc """
  UPS holiday definitions.

  source: http://www.ups.com/content/us/en/resources/ship/imp_exp/operation.html
  """
  def init() do
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
        function: {Holidays.Definitions.Us, :day_after_thanksgiving, [:year]},
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
  end

end
