defmodule Wltx.Assets.ClientManager do
  @moduledoc """
  Houses all functions that's involved with querying client/vehicle relationships
  and ownerships.
  """
  import Ecto.Query

  alias Wltx.Repo
  alias Wltx.Assets.{Group, Vehicle}

  def groups_for_user(%{is_superuser: true}) do
    case group_query() |> Repo.all() do
      [] -> {:error, :no_groups}
      groups -> {:ok, groups}
    end
  end

  def groups_for_user(%{client_group_id: client_group_id, is_superuser: false}) do
    query = from(group in group_query(), where: group.id == ^client_group_id)

    case query |> Repo.all() do
      [] -> {:error, :no_groups}
      groups -> {:ok, groups}
    end
  end

  def vehicles_for_group(%{
        group_id: group_id,
        client_group_id: client_group_id,
        tags: tags,
        is_superuser: false
      })
      when group_id == client_group_id do
    query = from(v in vehicle_query(%{group_id: group_id}), where: v.tag_id in ^tags)

    case query |> Repo.all() do
      [] -> {:error, :no_vehicles}
      vehicles -> {:ok, vehicles}
    end
  end

  def vehicles_for_group(%{group_id: group_id, is_superuser: true}) do
    query_results = %{group_id: group_id} |> vehicle_query |> Repo.all()

    case query_results do
      [] -> {:error, :no_vehicles}
      vehicles -> {:ok, vehicles}
    end
  end

  def vehicles_for_group(_) do
    {:error, :no_vehicles}
  end

  defp group_query do
    from(group in Group, order_by: [asc: group.name])
  end

  defp vehicle_query(%{group_id: group_id}) do
    from(
      v in Vehicle,
      join: g in Group,
      on: g.id == v.group_id,
      join: d in "inventory_device",
      on: d.id == v.connected_device_id,
      join: vt in "asset_vehicletype",
      on: vt.id == v.vehicle_type_id,
      join: t in "setup_tag",
      on: t.id == v.tag_id,
      where: g.id == ^group_id,
      order_by: [asc: v.license_plate],
      select_merge: %{group: g.name, connected_device: d.imei, tag: t.name, vehicle_type: vt.name}
    )
  end
end
