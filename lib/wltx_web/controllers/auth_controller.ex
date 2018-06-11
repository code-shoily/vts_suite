defmodule WltxWeb.AuthController do
  use WltxWeb, :controller
  use WltxWeb.GuardedController

  alias Wltx.Accounts.Authenticator
  alias WltxWeb.Guardian

  action_fallback(WltxWeb.FallbackController)

  def login(conn, %{"username" => username, "password" => password}, _user) do
    with {:ok, user} <- Authenticator.login(username, password) do
      {:ok, token, _claims} = Guardian.encode_and_sign(user)

      conn
      |> put_status(:created)
      |> render("login.json", token: token, user: user)
    end
  end

  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_status(:forbidden)
    |> render("error.json", message: "Not Authenticated")
  end
end
