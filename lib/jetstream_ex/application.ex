defmodule JetstreamEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Gnat.ConnectionSupervisor,
       %{
         name: :gnat,
         connection_settings: [
           %{host: "localhost", port: 4222}
         ]
       }},
      {Gnat.ConsumerSupervisor,
       %{
         connection_name: :gnat,
         consuming_function: {JetstreamEx.Consumer, :handle_message},
         subscription_topics: [
           %{topic: "rabbits"}
         ]
       }}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JetstreamEx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
