# Elixir Holidays

Elixir library for finding which holidays fall on given dates.

Based on the [Holidays Ruby Gem](https://github.com/holidays/holidays)

## Installation

The package can be installed as:

  1. Add holidays to your list of dependencies in `mix.exs`:

        def deps do
          [{:holidays, "~> 0.1.0"}]
        end

## Usage

    iex> Holidays.on({2016, 1, 1}, [:us])
    [%{name: "New Year's Day"}]

The `on` function gives a list of holidays for a date within
specified regions.

Dates in Erlang (and therefore Elixir) are represented by the 
`{year, month, day}` tuple.

This module uses pattern matching as much as possible. So, when a holiday
occurs on a fixed month and day every year, it will match on a clause
that looks something like this:

    defp do_on({_year, 1, 1}, :us), do: [%{name: "New Year's Day"}]

A holiday that occurs on a certain week and week day will match like this
after calling a function to get the week and day atoms from the `date`. (The
first parameter is the month.)

    defp do_on(5, :last, :monday, :us), do: [%{name: "Memorial Day"}]

Regions are often country codes, like `:us` or `:ca`, but
may also be entities such as UPS (`:ups`) or the New York Stock Exchange
(`:nyse`).
They can sometimes also be states/provinces, like `:us_ca` or `:us_dc`.

Holidays are defined within modules in the `lib/holidays/definitions`
directory which use the `holiday` macro from `Holidays.Define`.

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
`Holidays` module's code gen yet. The property does exist in the
definition modules that have been translated so far.

The other feature from the Ruby project that could be implemented is the
ability to specify a date range for the `on` function.

I also haven't figured out how to best support custom holiday definitions
that aren't part of this library.

Also, if you have suggestions for anything I've done that doesn't make sense
or could be done better, please let met know or send a pull request.

## Compiling

The `Holidays` module must be recompiled whenever changes are made to a
definition module. When the `holiday` macro is called, the holiday is
appended to the `@holidays` attribute of the main `Holidays` module.
If it's already been compiled, you'll see an error like:

    == Compilation error on file lib/holidays/definitions/us.ex ==
    ** (ArgumentError) could not call register_attribute on module Holidays because it was already compiled

I've been fixing that by calling `mix clean` and then trying the compile again.
