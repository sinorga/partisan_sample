defmodule MessageServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_) do
    {:ok, %{}}
  end

  @impl true
  def handle_cast(request, state) do
    IO.inspect(request, label: "handle_cast")
    {:noreply, state}
  end

  @impl true
  def handle_info(request, state) do
    IO.inspect(request, label: "handle_info")
    {:noreply, state}
  end
end
