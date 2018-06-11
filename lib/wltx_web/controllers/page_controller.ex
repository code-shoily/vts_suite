defmodule WltxWeb.PageController do
  use WltxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def admin(conn, _params) do
    redirect(conn, external: "http://localhost:8000/admin")
  end
end
