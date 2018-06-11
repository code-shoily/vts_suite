defmodule Wltx.Accounts.Authenticator do
  @moduledoc """
  Houses all functions involving user authentication and passwords
  """
  import Ecto.Query

  alias Wltx.Repo
  alias Wltx.Accounts.User

  @unauthorized_message "Invalid Username or Password"

  defp user_query(username) do
    from(
      u in User,
      left_join: ut in "setup_appuser_tags",
      on: ut.appuser_id == u.id,
      left_join: t in "setup_tag",
      on: ut.tag_id == t.id,
      where: u.username == ^username,
      group_by: [1, 2, 3, 4, 5, 6, 7],
      select_merge: %{tags: fragment("array_agg(?)", t.id)}
    )
  end

  @doc """
  Performs authentication from the Django database.

  Returns: {:ok, %User{}} | {:error, message}
  """
  def login(username, password) do
    query_results = Repo.one(user_query(username))

    case query_results do
      %User{password: hash} = user ->
        case Pbkdf2.verify_pass(password, hash) do
          true -> {:ok, user}
          _ -> {:error, @unauthorized_message}
        end

      _ ->
        {:error, @unauthorized_message}
    end
  end
end
