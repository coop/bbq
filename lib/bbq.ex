defmodule BBQ do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # opts = Application.get_env(:bbq, :wlan0)
    # {:ok, _pid} = Nerves.InterimWiFi.setup("wlan0", opts)

    children = [
      supervisor(BBQ.Probe.Supervisor, [BBQ.Probe.Supervisor]),
      worker(BBQ.Tick, [BBQ.Tick]),
    ]

    opts = [strategy: :one_for_one, name: BBQ.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
