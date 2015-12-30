defmodule Holidays.DateCalculator.DateMath do
  def add_days(date, days) do
    :calendar.gregorian_days_to_date(:calendar.date_to_gregorian_days(date) + days)
  end
end
