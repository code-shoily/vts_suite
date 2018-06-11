defmodule Wltx.Repo do
  use Ecto.Repo, otp_app: :wltx

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end

  Postgrex.Types.define(
    Wltx.PostgresTypes,
    [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
    library: Geo
  )
end
