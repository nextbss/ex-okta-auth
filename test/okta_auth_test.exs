Code.require_file("helpers.exs", __DIR__)

defmodule ExOktaAuthTest do
  use ExUnit.Case
  doctest ExOktaAuth

  setup_all do
    setup_config()
    {:ok, state: :ok}
  end
  
  def setup_config() do
    Config.Reader.read!("test/config.ex")
    |> Application.put_all_env()
  end

  test "Should return a valid client" do
    assert ExOktaAuth.Okta.client == Helpers.valid_client
  end

  test "Should fail to create a valid client" do
    refute ExOktaAuth.Okta.client == Helpers.invalid_client
  end
end
