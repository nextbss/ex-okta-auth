# ExOktaAuth

[![](https://img.shields.io/badge/nextbss-opensource-blue.svg)](https://www.nextbss.co.ao)
![Elixir CI](https://github.com/nextbss/ex-okta-auth/workflows/Elixir%20CI/badge.svg)

**An Elixir library that enables your application to work with Okta via OAuth 2.0/OIDC**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_okta_auth` to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:ex_okta_auth, "~> 0.1.0"}]
  end
```

Add :ex_okta_auth to your applications:

```elixir
  def application do
    [extra_applications: [:ex_okta_auth]]
  end
```

Add your configuration for okta to your applications ```config.ex```

```elixir
config :ex_okta_auth, ExOktaAuth.Okta,
  client_id: System.get_env("OKTA_CLIENT_ID"),
  client_secret: System.get_env("OKTA_CLIENT_SECRET"),
  site: "https://your-doman.okta.com",
  redirect_uri: "https://your-apps-callback-uri"
```

Create scope in your routes to handle the requests and callbacks

```elixir
  scope "/signin", MyAppWeb do
    pipe_through :browser
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end
```

Create a controller that will handle requests and callbacks to and from okta

```elixir
defmodule MyAppWeb.AuthController do
  use MyAppWeb, :controller

  def request(conn, _params) do
    ExOktaAuth.Okta.authorize_url!(conn)
  end

  def callback(conn, %{"provider" => _provider, "code" => code, "state" => _state}) do
    client = ExOktaAuth.Okta.get_token_without_auth!(code: code)
    user = get_user_information(client)
    conn
    |> put_session(:current_user, user)
    |> put_session(:access_token, client.token.access_token)
    |> put_flash(:info, "Welcome #{user["given_name"]}")
    |> redirect(to: "/")
  end

  defp get_user_information(client) do
    {:ok, resp} = ExOktaAuth.Okta.get_user_info(client)
    resp.body
  end
end
```

License
----------------
The library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
