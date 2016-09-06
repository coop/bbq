defmodule BBQ.Tick do
  use GenServer

  # TODO: jobs that should run:
  # 1. register any new probes
  # 2. take a reading from each registered probe

  def start_link(name) do
    GenServer.start_link(__MODULE__, [], name: name)
  end

  def init([]) do
    tick
    {:ok, []}
  end

  def handle_info(:tick, state) do
    {:noreply, state}
  end

  defp tick do
    Process.send_after(self, :tick, 30_000)
  end
end
