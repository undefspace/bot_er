defmodule BotEr.MixProject do
  use Mix.Project

  def project do
    [
      app: :bot_er,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BotEr, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:telegram, github: "visciang/telegram", tag: "1.2.1"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.4"},
    ]
  end
end
