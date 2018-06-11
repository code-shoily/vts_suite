defmodule WltxWeb.AssetController do
  use WltxWeb, :controller
  use WltxWeb.GuardedController

  alias Wltx.Assets.{ClientManager, LocationService}

  plug(Guardian.Plug.EnsureAuthenticated)
  action_fallback(WltxWeb.FallbackController)

  def groups(conn, _params, current_user) do
    with {:ok, groups} <- ClientManager.groups_for_user(current_user) do
      render(conn, "groups.json", groups: groups)
    end
  end

  def vehicles(conn, %{"group" => group_id}, current_user) do
    vehicle_results =
      current_user
      |> Map.merge(%{group_id: group_id})
      |> ClientManager.vehicles_for_group()

    with {:ok, vehicles} <- vehicle_results do
      render(conn, "vehicles.json", vehicles: vehicles)
    end
  end

  def vehicles(conn, _, _current_user) do
    conn
    |> put_status(:bad_request)
    |> render(WltxWeb.ErrorView, "error.json", message: "No group specified")
  end

  def location(conn, %{"group" => group_id}, current_user) do
    location_results =
      current_user
      |> Map.merge(%{group_id: group_id})
      |> LocationService.vehicle_locations()

    with {:ok, locations} <- location_results do
      render(conn, "locations.json", locations: locations)
    end
  end

  def location(conn, _, _current_user) do
    conn
    |> put_status(:bad_request)
    |> render(WltxWeb.ErrorView, "error.json", message: "No group specified")
  end

  def history(
        conn,
        %{"group" => _group_id, "vehicle" => _vehicle_id, "from" => _from, "to" => _to} = _params,
        _current_user
      ) do
    json(conn, "IO.inspect(params)")
  end

  def history(conn, _, _current_user) do
    conn
    |> put_status(:bad_request)
    |> render(
      WltxWeb.ErrorView,
      "error.json",
      message: "Required attrs- [:group, :vehicle, :from, :to]"
    )
  end
end
