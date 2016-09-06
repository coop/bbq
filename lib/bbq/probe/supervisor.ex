defmodule BBQ.Probe.Supervisor do
  def start_link(name) do
    import Supervisor.Spec, warn: false

    children = [
      worker(BBQ.Probe.Worker, []),
    ]

    opts = [strategy: :simple_one_for_one, name: name]
    Supervisor.start_link(children, opts)
  end

  def register(pid, address) do
    Supervisor.start_child(pid, [address])
  end
end
