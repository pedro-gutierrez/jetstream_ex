defmodule JetstreamEx.Consumer do
  @moduledoc false

  @impl true
  def handle_message(message) do
    IO.inspect(got: message)

    Req.get!("https://api.github.com/repos/wojtekmach/req").body["description"]
    |> IO.inspect()

    nil
  end
end
