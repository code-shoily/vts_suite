defmodule WltxWeb.Router do
  use WltxWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(ProperCase.Plug.SnakeCaseParams)

    plug(
      Guardian.Plug.Pipeline,
      error_handler: WltxWeb.AuthController,
      module: WltxWeb.Guardian
    )

    plug(Guardian.Plug.VerifyHeader, realm: "Token")
    plug(Guardian.Plug.LoadResource, allow_blank: true)
  end

  scope "/", WltxWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/admin", PageController, :admin)
  end

  scope "/api", WltxWeb do
    pipe_through(:api)

    post("/login", AuthController, :login)
    get("/clientgroup", AssetController, :groups)
    get("/vehicle", AssetController, :vehicles)
    get("/vehicle/location", AssetController, :location)
    get("/vehicle/history", AssetController, :history)
  end
end
