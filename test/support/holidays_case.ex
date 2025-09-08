defmodule HolidaysCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Holidays.TestHelper
    end
  end
end
