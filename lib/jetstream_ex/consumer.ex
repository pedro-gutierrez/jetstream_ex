defmodule JetstreamEx.Consumer do
  use Jetstream.PullConsumer

  def start_link([]) do
    Jetstream.PullConsumer.start_link(__MODULE__, [])
  end

  @impl true
  def init([]) do
    {:ok, nil, connection_name: :gnat, stream_name: "HELLO", consumer_name: "LOGGER"}
  end

  @impl true
  def handle_message(message, state) do
    some_var = ""

    call_some_functi()

    IO.inspect(message)
    {:ack, state}
  end
end
