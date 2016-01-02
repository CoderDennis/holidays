# Elixir Holidays

Elixir library for finding which holidays fall on given dates.

Based on the [Holidays Ruby Gem](https://github.com/holidays/holidays)

For now, only official US holidays are working.

The plan is to use compile time code generation (or macros) to
produce all clauses of `on` by pulling from the code in each of several
definitions modules like `Holidays.Defenitions.Us`.
However, I started by writing out the implementations explicitly to get the
API right and tests in place.

## Installation

The package can be installed as:

  1. Add holidays to your list of dependencies in `mix.exs`:

        def deps do
          [{:holidays, "~> 0.0.3"}]
        end

## Usage

    iex> Holidays.on({2016, 1, 1}, [:us])
    [%{name: "New Year's Day"}]
