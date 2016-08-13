ExUnit.start()

defmodule Holidays.TestHelper do

  defmacro holiday_test(name, date, region) do
    test_name = "#{name} on #{inspect date} in #{inspect region}"
    quote do
      test unquote(test_name) do
        assert Holidays.on(unquote(date), [unquote(region)]) == [%{name: unquote(name)}]
      end
    end
  end

  def restart_application do
    Application.stop(:holidays)
    Application.start(:holidays)
  end

end
