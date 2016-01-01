ExUnit.start()

defmodule Holidays.TestHelper do
  import ExUnit.Assertions

  def date_has_holiday_in_region(date, holiday_name, region) do
    assert (Holidays.on(date, [region])
            |> List.first
            |> Map.fetch!(:name)) == holiday_name
  end
end
