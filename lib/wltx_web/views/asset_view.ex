defmodule WltxWeb.AssetView do
  use WltxWeb, :view
  alias WltxWeb.AssetView
  alias Ecto.UUID
  import Wltx.Helpers

  def render("error.json", %{message: message}) do
    %{message: message}
  end

  def render("groups.json", %{groups: groups}) do
    render_many(groups, AssetView, "group.json", as: :group)
  end

  def render("group.json", %{group: group}) do
    group
    |> Map.from_struct()
    |> Map.take([:id, :name, :code, :group_type])
  end

  def render("vehicles.json", %{vehicles: vehicles}) do
    render_many(vehicles, AssetView, "vehicle.json", as: :vehicle)
  end

  def render("vehicle.json", %{vehicle: vehicle}) do
    vehicle
    |> Map.from_struct()
    |> Map.take([
      :license_plate,
      :vehicle_type,
      :group,
      :tag,
      :id,
      :code,
      :model,
      :color,
      :connected_device
    ])
  end

  def render("locations.json", %{locations: locations}) do
    render_many(locations, AssetView, "location.json", as: :location)
  end

  def render("location.json", %{location: location}) do
    %{
      id: UUID.generate(),
      vehicle: location.vehicle,
      actual_time: datetime_to_iso8601(location.actual_time),
      latest_time: datetime_to_iso8601(location.latest_time),
      location_hash: "(#{location.lat}, #{location.lng})",
      lat: location.lat,
      lng: location.lng,
      speed: location.speed,
      gpstat: location.gpstat,
      courseval: location.courseval,
      landmark: location.landmark,
      engine: location.engine
    }
  end
end
