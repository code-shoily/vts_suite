defmodule Wltx.Helpers do
  @moduledoc """
  Houses functions that will be used by the rest of the module.
  """
  import Ecto.Query
  alias Wltx.Repo
  alias Wltx.Assets.Vehicle
  alias Wltx.Accounts.User

  @doc """
  Converts datetime into ISO8601 string
  """
  def datetime_to_iso8601(datetime) do
    {:ok, ecto_datetime} = Ecto.DateTime.cast(datetime)
    Ecto.DateTime.to_iso8601(ecto_datetime)
  end

  @doc """
  Converts ISO8601 string into DateTime struct
  """
  def parse_date(iso_date) do
    Timex.parse(iso_date, "{ISO:Extended}")
  end

  @doc """
  Returns the name of the table for a vehicle
  """
  def get_table(vehicle_id) do
    query = from(v in Vehicle, where: v.id == ^vehicle_id, limit: 1)

    case query |> Repo.one() do
      %Vehicle{} = v -> {:ok, v.related_table}
      _ -> {:error, :no_table}
    end
  end

  @doc """
  Returns tables of valid vehicles based on the user.
  """
  def valid_vehicles(%User{is_superuser: true}, vehicle_ids) do
    query = from(v in Vehicle, where: v.id in ^vehicle_ids, select: [v.related_table])

    case query |> Repo.all() do
      [] -> {:error, :not_found}
      _vehicles -> {:ok, :vehicles}
    end
  end

  def valid_vehicles(
        %User{client_group_id: client_group_id, tags: tags},
        vehicle_ids
      ) do
    query =
      from(
        v in Vehicle,
        where: v.group_id == ^client_group_id and v.tag_id in ^tags and v.id in ^vehicle_ids,
        select: [v.related_table]
      )

    case query |> Repo.all() do
      [] -> {:error, :not_found}
      vehicles -> {:ok, vehicles}
    end
  end

  @doc """
  Returns the user struct who has the username.
  FIXME: For testing purpose only.
  """
  def get_user(username) do
    from(u in User, where: u.username == ^username)
    |> Repo.one()
  end

  @doc """
  Returns the valid vehicle ids for the user
  FIXME: Testing purposes
  """
  def get_vehicle_ids(%User{is_superuser: true}) do
    from(v in Vehicle, select: [v.id]) |> Repo.all()
  end

  def get_vehicle_ids(%User{client_group_id: client_group_id, tags: tags}) do
    from(
      v in Vehicle,
      where: v.group_id == ^client_group_id and v.tag_id in ^tags,
      select: [v.id]
    )
    |> Repo.all()
  end
end
