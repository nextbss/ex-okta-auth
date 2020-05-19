defmodule Helpers do
    
    def valid_client do
        site = "http://127.0.0.1:4000/default"
        ExOAuth2.Client.new([
            strategy: ExOktaAuth.Okta,
            client_id: "isoaspoaisa",
            client_secret: "kajskaljs",
            site: site,
            redirect_uri: "https://your-apps-callback-uri",
            authorize_url: site <> "/v1/authorize",
            token_url: site <> "/v1/token"
          ])
          |> ExOAuth2.Client.put_serializer("application/json", Jason)
    end

    def invalid_client do
        site = "http://127.0.0.1:4000/default"
        ExOAuth2.Client.new([
            strategy: ExOktaAuth.Okta,
            client_id: "isoaspoaisa",
            client_secret: "kajskaljs",
            site: site,
            redirect_uri: "https://your-apps-callback-uri",
            authorize_url: site <> "/v1",
            token_url: site <> "/v1/"
          ])
          |> ExOAuth2.Client.put_serializer("application/json", Jason)
    end
end