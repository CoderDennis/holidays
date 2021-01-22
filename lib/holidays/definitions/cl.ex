defmodule Holidays.Definitions.Cl do
  import Holidays.Define

  @moduledoc """
  Chile holiday definitions.

  """
  def init() do
    holiday "Viernes Santo",
      %{regions: [:cl],
        function: {Holidays, :easter, [:year], -2},
        type: :informal}

    holiday "Sábado Santo",
      %{regions: [:cl],
        function: {Holidays, :easter, [:year], -1},
        type: :informal}

    holiday "Año Nuevo",
      %{month: 1,
        regions: [:cl],
        day: 1,
        observed: {:to_monday_if_sunday, [:date]}}

    holiday "Día del Trabajo",
      %{month: 5,
        regions: [:cl],
        day: 1}

    holiday "Día de las Glorias Navales",
      %{month: 5,
        regions: [:cl],
        day: 21}

    holiday "San Pedro y San Pablo",
      %{month: 6,
        regions: [:cl],
        day: 29}

    holiday "Día de la Virgen del Carmen",
      %{month: 7,
        regions: [:cl],
        day: 16}

    holiday "Asunción de la Virgen",
      %{month: 8,
        regions: [:cl],
        day: 15}

    holiday "Independencia Nacional",
      %{month: 9,
        regions: [:cl],
        day: 18,
        observed: {:to_friday_if_saturday, [:date]}}

    holiday "Día de las Glorias del Ejército",
      %{month: 9,
        regions: [:cl],
        day: 19,
        observed: {:to_friday_if_sunday, [:date]}}

    holiday "Encuentro de Dos Mundos",
      %{month: 10,
        regions: [:cl],
        day: 12}

    holiday "Día de las Iglesias Evangélicas y Protestantes",
      %{month: 10,
        regions: [:cl],
        day: 31}

    holiday "Día de Todos los Santos",
      %{month: 11,
        regions: [:cl],
        day: 1}

    holiday "Inmaculada Concepción de María",
      %{month: 12,
        regions: [:cl],
        day: 8}

    holiday "Navidad",
      %{month: 12,
        regions: [:cl],
        day: 25}
  end
end
