defmodule Holidays.Definitions.Br do
  import Holidays.Define

  alias Holidays.DateCalculator.DateMath

  @moduledoc """
  Brazil holiday definitions.

  # Updated: 2018-09-25.
  # Sources:
  # - https://pt.wikipedia.org/wiki/Feriados_no_Brasil

  """
  def init() do
    holiday(
      "Confraternização Universal",
      %{month: 1, day: 1, regions: [:br]}
    )

    holiday(
      "Tiradentes",
      %{month: 4, day: 21, regions: [:br]}
    )

    holiday(
      "Dia do Trabalhador",
      %{month: 5, day: 1, regions: [:br]}
    )

    holiday(
      "Proclamação da Independência",
      %{month: 9, day: 7, regions: [:br]}
    )

    holiday(
      "Nossa Senhora Aparecida",
      %{month: 10, day: 12, regions: [:br]}
    )

    holiday(
      "Finados",
      %{month: 11, day: 2, regions: [:br]}
    )

    holiday(
      "Proclamação da República",
      %{month: 11, day: 15, regions: [:br]}
    )

    holiday(
      "Dia da Consciência Negra",
      %{month: 11, day: 20, regions: [:br]}
    )

    holiday(
      "Natal",
      %{month: 12, day: 25, regions: [:br]}
    )

    holiday(
      "Carnaval",
      %{function: {Holidays, :easter, [:year], -47}, regions: [:br]}
    )

    holiday(
      "Sexta-feira santa",
      %{function: {Holidays, :easter, [:year], -2}, regions: [:br]}
    )

    holiday(
      "Páscoa",
      %{function: {Holidays, :easter, [:year]}, regions: [:br]}
    )

    holiday(
      "Corpus Christi",
      %{function: {Holidays, :easter, [:year], 60}, regions: [:br]}
    )

    holiday(
      "Eleições",
      %{function: {Holidays.Definitions.Br, :election_day, [:year]}, regions: [:br]}
    )
  end

  @doc """
  First sunday of October every fourth year.

  ## Examples

      iex> Holidays.Defenitions.Br.election_day(2016)
      :none

      iex> Holidays.Defenitions.Br.election_day(2017)
      :none

      iex> Holidays.Defenitions.Br.election_day(2018)
      {:ok, {2018, 10, 7}
  """
  def election_day(year) when rem(year, 4) == 2,
    do: DateMath.get_weekth_day(year, 10, :first, :sunday)

  def election_day(_year), do: :none
end
