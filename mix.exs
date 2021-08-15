defmodule ExAwsTranslate.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ex_aws_translate,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: "AWS Translate service module for ex_aws",
      source_url: "TODO: add github url",
      homepage_url: "TODO: add homepage url",
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["mit"],
      links: "TODO: add github url"
    ]
  end

  defp docs() do
    [
      main: "readme",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/ex_aws_translate",
      extras: [
        "README.md": [title: "Overview"]
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_aws, "~> 2.1.1"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:elixir_uuid, "~> 1.2"},
      {:hackney, ">= 0.0.0", only: [:dev, :test]},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:sweet_xml, ">= 0.0.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.0.0-rc.7", only: [:dev], runtime: false},
    ]
  end
end
