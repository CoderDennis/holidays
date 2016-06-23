defmodule HolidaysTest do
  use ExUnit.Case

  import Holidays.TestHelper

  setup_all do
    # Holidays.Define.start_link()
    restart_application()
    Holidays.Definitions.Us.init()
    :ok
  end
  
  doctest Holidays

end
