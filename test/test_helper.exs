ExUnit.start()

defmodule Holidays.TestHelper do

  defmacro holiday_test(name, date, region) do
    test_name = "#{name} on #{inspect date} in #{inspect region}"
    quote do
      test unquote(test_name) do
        assert (Holidays.on(unquote(date), [unquote(region)])
                |> List.first
                |> Map.fetch!(:name)) == unquote(name)
      end
    end
  end

end
