defmodule Wltx.Assets.Group do
  @moduledoc """
  Module for the client group table
  """
  use Ecto.Schema

  schema "setup_clientgroup" do
    field(:code, :string)
    field(:name, :string)
    field(:group_type, :string)
  end
end
