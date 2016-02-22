defmodule Holiday do
  @type t :: %Holiday{
    name: string
    date: date
    observed: date
    type: Holidays.Definition.type
  }
  defstruct [:name, :date, :observed, :type]

  @moduledoc """
  %Holiday struct is the return type for Holiday results.

  """
end
