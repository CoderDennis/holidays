# Elixir Holidays

Elixir application for finding which holidays fall on given dates.

Based on the [Holidays Ruby Gem](https://github.com/holidays/holidays)

Source on [GitHub](https://github.com/CoderDennis/holidays)

## Installation

Add holidays to your list of dependencies in `mix.exs`:

    ```
    def deps do
      [{:holidays, "~> 0.3"}]
    end
    ```

## Usage

1.  The `:holidays` application must be started.
2.  Initialize the definition modules you want to use. This may be one of the
    modules defined in this application or you may define your own.

    ```
    Holidays.Definitions.Us.init()
    ```

3.  Call the `on` function, passing in a date and a list of regions.

    ```
    iex> Holidays.on(~D[2016-01-01], [:us])
    [%{name: "New Year's Day"}]
    ```

The `on` function gives a list of holidays for a date within
specified regions.

Dates in Elixir are represented by the
`~D[yyyy-mm-dd]` sigil.

Regions are often country codes, like `:us` or `:ca`, but
may also be entities such as UPS (`:ups`) or the New York Stock Exchange
(`:nyse`).
They can sometimes also be states/provinces, like `:us_ca` or `:us_dc`.

Holidays are defined within modules in the `lib/holidays/definitions`
directory which use the `holiday` function from `Holidays.Define`.

## Contributions

It's fairly easy to take yaml files from the original Ruby implementation
and translate them into the Elixir definition modules. The yaml files are
included in the root `definitions` folder. That would be a great place to
contribute if there is a region you need which hasn't been translated yet.
Just be sure to include some tests. There's even a handy `holiday_test`
macro to make it super simple to assert that the expected holiday is
returned on the given date and region.

The `Holidays.DateCalculator.WeekendModifier` contains functions ported from
Ruby to support the `observed` property as found in
the original project, but this hasn't been implemented in the
`on` function yet. The property does exist in the
definition modules that have been translated so far.

The other feature from the Ruby project that could be implemented is the
ability to specify a date range for the `on` function.

Also, if you have suggestions for anything I've done that doesn't make sense
or could be done better, please let met know or send a pull request.
