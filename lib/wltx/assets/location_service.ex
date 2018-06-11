defmodule Wltx.Assets.LocationService do
  @moduledoc """
  Houses all the location related functions and helper functions
  """
  import Ecto.Query

  alias Wltx.Repo
  alias Wltx.Assets.ClientManager

  def vehicle_locations(params) do
    with {:ok, vehicles} <- ClientManager.vehicles_for_group(params) do
      case vehicles
           |> Enum.map(&transform_into_map/1)
           |> Enum.map(&fetch_locations/1)
           |> Enum.filter(&(&1 != nil))
           |> Enum.map(&populate_landmark/1) do
        [] -> {:error, :no_location}
        locations -> {:ok, locations}
      end
    else
      {:error, _} -> {:error, :no_vehicles}
    end
  end

  def nearest_location(lat, lng, limit \\ 1) do
    case poi_sql(lat, lng, limit) do
      [] -> nearest_location_osm(lat, lng, limit)
      xs -> xs |> Enum.map(&format_location/1) |> Enum.join(", ")
    end
  end

  defp populate_landmark(%{lat: lat, lng: lng} = location) do
    Map.merge(location, %{landmark: nearest_location(lat, lng)})
  end

  defp populate_landmark(location) do
    location
  end

  defp transform_into_map(vehicle) do
    vehicle
    |> Map.from_struct()
    |> Map.take([:id, :related_table])
  end

  defp fetch_locations(%{id: id, related_table: related_table}) do
    query =
      from(
        loc in related_table,
        where: loc.lat > 0 and loc.lng > 0,
        group_by: [
          loc.sysdatetime,
          loc.lat,
          loc.lng,
          loc.speed,
          loc.gpstat,
          loc.courseval,
          loc.engine
        ],
        select: %{
          vehicle: fragment("? ::integer", ^id),
          actual_time: loc.sysdatetime,
          latest_time: fragment("max(sysdatetime)"),
          lat: loc.lat,
          lng: loc.lng,
          speed: fragment("case when max(sysdatetime) = sysdatetime then speed else 0 end"),
          gpstat: loc.gpstat,
          courseval: loc.courseval,
          time_delta:
            fragment("extract ('epoch' from (max(sysdatetime) - sysdatetime)::interval)"),
          engine: loc.engine
        },
        limit: 1
      )

    query |> Repo.one()
  end

  defp osm_sql(tablename, lat, lng, limit) do
    query =
      from(
        p in tablename,
        select: %{
          name: p.name,
          distance:
            fragment(
              "ST_Distance(the_geom, ST_MakePoint(?, ?)::geography)",
              ^lng,
              ^lat
            )
        },
        where: not is_nil(p.name),
        order_by: [asc: 2],
        limit: ^limit
      )

    query |> Repo.all()
  end

  defp poi_sql(lat, lng, limit) do
    query =
      from(
        p in "geo_poi",
        select: %{
          name: p.title,
          distance: fragment("ST_Distance(location, ST_MakePoint(?, ?)::geography)", ^lng, ^lat)
        },
        where:
          not is_nil(p.title) and
            fragment("ST_DWithin(location, ST_MakePoint(?, ?)::geography, 1000)", ^lng, ^lat),
        order_by: [asc: 2],
        limit: ^limit
      )

    query |> Repo.all()
  end

  defp nearest_location_osm(lat, lng, limit) do
    Enum.join([osm_point(lat, lng, limit), osm_place(lat, lng, limit)], ", ")
  end

  defp osm_point(lat, lng, limit) do
    osm_sql("points", lat, lng, limit)
    |> Enum.map(&format_location/1)
    |> Enum.join(", ")
  end

  defp osm_place(lat, lng, limit) do
    osm_sql("places", lat, lng, limit)
    |> Enum.map(&format_location/1)
    |> Enum.join(", ")
  end

  defp format_location(%{name: name, distance: distance}) do
    "#{name} (#{Float.round(distance / 1000, 2)}) KM"
  end
end
