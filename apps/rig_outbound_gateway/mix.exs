defmodule RigOutboundGateway.MixProject do
  use Mix.Project

  def project do
    [
      app: :rig_outbound_gateway,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {RigOutboundGateway.Application, []}
    ]
  end

  defp deps do
    [
      {:rig, in_umbrella: true},
      # Read and use application configuration from environment variables:
      {:confex, "~> 3.3"},
      # Apache Kafka Erlang client library:
      {:brod, "~> 3.3"},
      # JSON parser:
      {:poison, "~> 2.0 or ~> 3.0"},
      # HTTP server:
      #{:cowboy, "~> 2.1"},
      #{:cowboy, "~> 1.0"},
      #{:plug, "~> 1.4"},
      # Stubs and spies for tests:
      {:stubr, "~> 1.5"},
    ]
  end
end