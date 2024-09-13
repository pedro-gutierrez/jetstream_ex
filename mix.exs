defmodule JetstreamEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :jetstream_ex,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {JetstreamEx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:gnat, "~> 1.5"},
      {:jetstream, "~> 0.0.5"},
      {:req, "~> 0.5.0"}
    ]
  end
end
