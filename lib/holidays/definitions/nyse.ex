defmodule Holidays.Definitions.Nyse do
  import Holidays.Define

  @moduledoc """
  NYSE holiday definitions.

  Source: http://www.nyse.com/about/newsevents/1176373643795.html#earlyclose2008
  """
  def init() do
    holiday(
      "Good Friday",
      %{regions: [:nyse], function: {Holidays, :easter, [:year], -2}}
    )

    holiday(
      "New Year's Day",
      %{month: 1, regions: [:nyse], day: 1}
    )

    holiday(
      "Martin Luther King, Jr. Day",
      %{month: 1, week: :third, regions: [:nyse], weekday: :monday}
    )

    holiday(
      "Presidents' Day",
      %{month: 2, week: :third, regions: [:nyse], weekday: :monday}
    )

    holiday(
      "Memorial Day",
      %{month: 5, week: :last, regions: [:nyse], weekday: :monday}
    )

    holiday(
      "Independence Day",
      %{month: 7, regions: [:nyse], day: 4, observed: {:to_weekday_if_weekend, [:date]}}
    )

    holiday(
      "Labor Day",
      %{month: 9, week: :first, regions: [:nyse], weekday: :monday}
    )

    holiday(
      "Thanksgiving",
      %{month: 11, week: :fourth, regions: [:nyse], weekday: :thursday}
    )

    holiday(
      "Christmas Day",
      %{month: 12, regions: [:nyse], day: 25, observed: {:to_weekday_if_weekend, [:date]}}
    )
  end
end
