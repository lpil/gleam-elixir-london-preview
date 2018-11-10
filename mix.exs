defmodule GleamElixirLondonPreview.MixProject do
  use Mix.Project

  def project do
    [
      app: :gleam_elixir_london_preview,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:elli, "~> 3.1"}
    ]
  end
end
