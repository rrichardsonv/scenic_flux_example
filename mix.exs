defmodule Flux.MixProject do
  use Mix.Project

  def project do
    [
      app: :flux,
      version: "0.1.0",
      elixir: "~> 1.7",
      build_embedded: true,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Flux, []},
      extra_applications: []
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exsync, github: "axelson/exsync", branch: "my-full-changes", only: :dev},
      {:scenic, "~> 0.10"},
      {:scenic_driver_glfw, "~> 0.10", targets: :host},
      {:scenic_live_reload, path: "../scenic_live_reload"}
    ]
  end
end
