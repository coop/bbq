defmodule BBQ do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    opts = Application.get_env(:bbq, :wlan0)
    {:ok, _pid} = Nerves.InterimWiFi.setup("wlan0", opts)

    # Define workers and child supervisors to be supervised
    children = [
      # worker(BBQ.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BBQ.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
