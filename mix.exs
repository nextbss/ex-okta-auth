defmodule ExOktaAuth.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :ex_okta_auth,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      docs: docs(),
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
      {:ex_oauth2, "~> 2.0.1"},
      {:phoenix, "~> 1.5.1"},
      # Docs dependencies
      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end

  defp description do
    "An Elixir client library that enables your application to work with Okta via OAuth 2.0/OIDC"
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: "https://github.com/nextbss/ex_okta_auth"
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Alexandre Juca"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/nextbss/ex_okta_auth"}
    ]
  end
end
