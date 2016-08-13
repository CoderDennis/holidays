defmodule Holidays.Define do
  use GenServer

  alias Holidays.DateCalculator.DateMath

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def holiday(name, %{month: month, day: day}) do
    GenServer.cast(__MODULE__, {:add_entry, :static, {name, month, day}})
  end
  def holiday(name, %{month: month, week: week, weekday: weekday}) do
    GenServer.cast(__MODULE__, {:add_entry, :nth, {name, month, week, weekday}})
  end
  def holiday(name, %{function: function}) do
    GenServer.cast(__MODULE__, {:add_entry, :fun, {name, function}})
  end

  @spec on(:calendar.date, [Holidays.region]) :: list
  def on(date, _regions) do
    GenServer.call(__MODULE__, {:on, date})
  end

  defp on_all(%{static: statics, nth: nths, fun: funs}, date) do
    on_static(statics, date) ++
    on_nth(nths, date) ++
    on_fun(funs, date)
  end

  defp on_static(holidays, {_, month, day}) do
    holidays
    |> Enum.filter(fn
      {_, ^month, ^day} -> true
      _ -> false
    end)
    |> Enum.map(fn {name, _, _} -> %{name: name} end)
  end

  defp on_nth(holidays, date) do
    DateMath.get_week_and_weekday(date)
    |> Enum.flat_map(&on_nth(&1, holidays, date))
  end
  defp on_nth({week, weekday}, holidays, {_, month, _}) do
    holidays
    |> Enum.filter(&match?({_, ^month, ^week, ^weekday}, &1))
    |> Enum.map(fn {name, _, _, _} -> %{name: name} end)
  end

  defp on_fun(holidays, date) do
    holidays
    |> Enum.filter(fn {_, fun} -> apply_fun(fun, date) == date end)
    |> Enum.map(fn {name, _} -> %{name: name} end)
  end

  defp apply_fun({mod, fun, args, days}, date) do
    apply_fun({mod, fun, args}, date)
    |> DateMath.add_days(days)
  end
  defp apply_fun({mod, fun, [:year]}, {year, _, _}) do
    apply(mod, fun, [year])
  end

  def init([]) do
    {:ok, %{static: [], nth: [], fun: []}}
  end

  def handle_cast({:add_entry, type, definition}, state) do
    {:noreply, Map.update!(state, type, &([definition | &1]))}
  end

  def handle_call({:on, date}, _from, state) do
    result = state |> on_all(date)
    {:reply, result, state}
  end

end
