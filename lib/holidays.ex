defmodule Holidays do
  use Application

  @moduledoc """
  Provides the `on` function that gives a list of holidays for a date within
  specified regions.

  The `on` function accepts either an Elixir `Date` struct or an Erlang style
  `{year, month, day}` tuple.

  Note: the `:holidays` application must be started before use. This can be done
  by adding `:holidays` to the list of applications in your `mix.exs` file:

      def application do
        [
          extra_applications: [:logger, :holidays]
        ]
      end

  """

  @type weekday :: :monday | :tuesday | :wednesday | :thursday | :friday | :saturday | :sunday

  @type week :: :first | :second | :third | :fourth | :last

  @type region :: atom

  def start(_type, _args) do
    Holidays.Supervisor.start_link()
  end

  @doc """
  Returns a list of holidays on the given `date` for the specified `regions`.

  Accepts either an Elixir `Date` struct or an Erlang style `{year, month, day}` tuple.

  ## Examples

      iex> Holidays.on(~D[2016-01-01], [:us])
      [%{name: "New Year's Day"}]

      iex> Holidays.on({2016, 1, 1}, [:us])
      [%{name: "New Year's Day"}]

  """
  @spec on(Calendar.date() | :calendar.date(), [region]) :: list
  def on(date, regions) when is_tuple(date) do
    date
    |> Date.from_erl!()
    |> on(regions)
  end

  def on(date, regions) do
    Holidays.Define.on(date, regions)
  end

  @doc """
  Wrapper for `Holidays.DateCalculator.Easter.gregorian_easter_for(year)`
  so Definition modules don't all need their own copy.

  For eample, in `Holidays.Definitions.Us`, Easter Sunday is defined like this:

      holiday "Easter Sunday",
        %{regions: [:us],
          function: {Holidays, :easter, [:year]},
          type: :informal}

  """
  def easter(year) do
    Holidays.DateCalculator.Easter.gregorian_easter_for(year)
  end
end
