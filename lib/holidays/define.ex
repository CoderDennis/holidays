defmodule Holidays.Define do
  use GenServer

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

  def get_entries() do
    GenServer.call(__MODULE__, {:get_entries})
  end

  def init([]) do
    {:ok, %{static: [], nth: [], fun: []}}
  end

  def handle_cast({:add_entry, type, definition}, state) do
    {:noreply, Map.update!(state, type, &([definition | &1]))}
  end

  def handle_call({:get_entries}, _from, state) do
    {:reply, state, state}
  end
end
