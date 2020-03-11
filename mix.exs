defmodule Tao.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :tao,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "Tao",
      source_url: "https://github.com/adambouchard/tao"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      #extra_applications: [:logger],
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
    ]
  end

  defp description() do
    """
    A fast, secure and opiniated framework to serve JSON API's via websockets, RESTFUL and GraphQL.
    """
  end

  defp package() do
    [
      maintainers: ["Adam Bouchard"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/adambouchard/tao"}
    ]
  end

end
