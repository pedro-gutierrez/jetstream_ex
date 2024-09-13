defmodule JetstreamEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: JetstreamEx.Worker.start_link(arg)
      # {JetstreamEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JetstreamEx.Supervisor]
    {:ok, pid} = Supervisor.start_link(children, opts)

    "starting" |> debug()

    {:ok, pid}
  end

  def debug(message) do
    message |> Logger.debug()
  end
end
