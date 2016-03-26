defmodule McData.Mixfile do
  use Mix.Project

  def project do
    [app: :mc_data,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
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
    [{:poison, "~> 2.0"},
     {:json_minecraft_data,
       github: "PrismarineJS/minecraft-data", 
       ref: "a13abc7f468698e5e37592dca6faefdcd6527cb4", # 2016-03-25
       compile: false, app: false}]
  end
end
