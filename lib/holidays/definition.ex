defmodule Holidays.Definition do
  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday
  @type week :: :first | :second | :third | :fourth | :last
  @type region :: atom
  @type function :: {atom, [atom]} | {atom, [atom], Integer}
  @type type :: :informal | :official
  @type t :: %Holidays.Definition{
    regions: [region],
    month: Integer,
    day: Integer,
    week: week,
    weekday: weekday,
    function: function,
    observed: function,
    type: type
  }
  defstruct
    regions: [],
    month: nil,
    day: nil,
    week: nil,
    weekday: nil,
    function: nil,
    observed: nil,
    type: :official

  @moduledoc """
  %Holiday struct is used for Holiday definitions.

  `regions` is a list of atoms for which the holiday is defined.
  `type` is `:official` by default, but may also be set to `:informal`.
  `observed` is an optional function reference for altering the date on which the holiday is observed. The first item in the tuple is the name of the function. The second item is a list of parameters, typically `[:date]`. e.g. `{:to_weekday_if_weekend, [:date]}`

  The remaining fields may be used in one of the follwoing ways:
  1. Use `function` to refer to a named function that defines the date for the holiday. The first item of the tuple is the name of the function. The second item is a list of parameters to the function -- typically `[:year]`. The last item is optional and is an Integer representing number of days to add. e.g. `{:easter, [:year], -2}` for Good Friday will call the `easter` function passing in the `year` and then subtracts 2 days from the result.
  2. Use `month` and `day` for holidays that always fall on a given month and day each year. e.g. `month: 1, day: 1` for New Year's Day.
  3. Use `month`, `week`, and `weekday` for holidays that fall on the nth weekday of a month. e.g. `month: 5, week: :last, weekday: :monday` for Memorial Day in the US.
  """
end
