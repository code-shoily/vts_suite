defmodule Wltx.Assets.Vehicle do
  @moduledoc """
  Schema for the vehicle/asset table
  """
  use Ecto.Schema

  schema "asset_vehicle" do
    field(:license_plate, :string)
    field(:vehicle_type_id, :integer)
    field(:group_id, :integer)
    field(:tag_id, :integer)
    field(:code, :string)
    field(:model, :string)
    field(:color, :string)
    field(:connected_device_id, :integer)
    field(:related_table, :string)
    field(:group, :string, virtual: true)
    field(:tag, :string, virtual: true)
    field(:connected_device, :string, virtual: true)
    field(:vehicle_type, :string, virtual: true)
  end
end
