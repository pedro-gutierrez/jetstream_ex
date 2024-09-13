defmodule JetstreamEx do
  @moduledoc """
  Publishes a message
  """

  alias JetstreamEx.Cache

  def publish(topic, message) do
    {:ok, _} = Cache.start_link()

    Gnat.pub(:gnat, topic, message)
  end
end
