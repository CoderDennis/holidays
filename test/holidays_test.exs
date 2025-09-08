defmodule HolidaysTest do
  use HolidaysCase

  setup_all do
    restart_application()
    Holidays.Definitions.Us.init()
    :ok
  end

  doctest Holidays
  doctest Holidays.Definitions.Us
end
