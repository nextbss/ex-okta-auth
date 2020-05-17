defmodule OktaAuth.MixProject do
  use Mix.Project

  def project do
    [
      app: :okta_auth,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ex_oauth2]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_oauth2, "~> 2.0.1"}
    ]
  end
end
