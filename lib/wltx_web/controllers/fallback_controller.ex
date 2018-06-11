defmodule WltxWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use WltxWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render("error.json", message: :"404")
  end

  def call(conn, {:error, message}) do
    conn
    |> put_status(:bad_request)
    |> render("error.json", message: message)
  end
end
