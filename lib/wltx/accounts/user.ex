defmodule Wltx.Accounts.User do
  @moduledoc """
  Module for the authentication table and abstraction of the Django user model
  """
  use Ecto.Schema

  schema "setup_appuser" do
    field(:username, :string)
    field(:password, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:is_superuser, :boolean)
    field(:client_group_id, :integer)
    field(:tags, {:array, :integer}, virtual: true)
  end
end
