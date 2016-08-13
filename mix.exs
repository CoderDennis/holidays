defmodule Holidays.Mixfile do
  use Mix.Project

  def project do
    [app: :holidays,
     version: "0.2.0",
     elixir: "~> 1.2",
     description: "Application for finding which holidays fall on given dates.",
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Dennis Palmer"],
      links: %{"GitHub" => "https://github.com/CoderDennis/holidays"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger],
    mod: {Holidays, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:dialyze, "~> 0.2.0", only: :dev},
      {:ex_doc, "~> 0.11.2", only: :dev},
      {:earmark, "~> 0.2.0", only: :dev}
    ]
  end
end
