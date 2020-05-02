defmodule Holidays.Definitions.No do
  import Holidays.Define

  @moduledoc """
  Norwegian holiday definitions.

  """
  def init() do

    holiday "Fastelavn",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], -49},
        type: :informal}

    holiday "Palmesøndag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], -7}}

    holiday "Skjærtorsdag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], -3}}

    holiday "Langfredag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], -2}}

    holiday "1. påskedag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], 0}}

    holiday "2. påskedag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], 1}}

    holiday "Kristi Himmelfartsdag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], 39}}

    holiday "1. pinsedag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], 49}}

    holiday "2. pinsedag",
      %{regions: [:no],
        function: {Holidays, :easter, [:year], 50}}

    holiday "Nyttårsdag",
      %{regions: [:no],
        month: 1,
        day: 1}

    holiday "1. mai",
      %{regions: [:no],
        month: 5,
        day: 1}

    holiday "17. mai",
      %{regions: [:no],
        month: 5,
        day: 17}

    holiday "Julaften",
      %{regions: [:no],
        month: 12,
        day: 24,
        type: :informal}

    holiday "1. juledag",
      %{regions: [:no],
        month: 12,
        day: 25}

    holiday "2. juledag",
      %{regions: [:no],
        month: 12,
        day: 26}

    holiday "Nyttårsaften",
      %{regions: [:no],
        month: 12,
        day: 31,
        type: :informal}
  end
end
