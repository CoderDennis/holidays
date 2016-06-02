defmodule HolidaysTest do
  use ExUnit.Case

  setup_all do
    Holidays.Define.start_link()
    Holidays.Definitions.Us.init()
    :ok
  end
  
  doctest Holidays

end
