defmodule HolidaysTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    restart_application()
    Holidays.Definitions.Us.init()
    :ok
  end

  doctest Holidays
end
