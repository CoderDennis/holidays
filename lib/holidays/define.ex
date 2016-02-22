defmodule Holidays.Define do

  defmacro __using__(_options) do
    quote do
  #     import unquote(__MODULE__)
  #     Module.register_attribute Holidays, :modules, accumulate: true
  #     if __MODULE__ == Holidays do
  #       @before_compile unquote(__MODULE__)
  #     else
  #       Module.put_attribute(Holidays, :modules, __MODULE__)
  #     end
  #     Module.register_attribute Holidays, :holidays, accumulate: true
  #     Module.register_attribute Holidays, :special_days, accumulate: true
    end
  end

  # defmacro __before_compile__(_env) do
  #   quote do
  #     # Before doing code gen in Holidays module, ensure all other modules
  #     # that use Holidays.Define have finished loading.
  #     for mod <- @modules do
  #       Code.ensure_loaded(mod)
  #     end

  #     @doc """
  #     For debug purposes, returns contents of @holidays attribute
  #     """
  #     def list do
  #       @holidays
  #     end
  #   end
  # end

  defmacro holiday(name, %Holidays.Definition{month: month, day: day} = definition) do

  end

end
