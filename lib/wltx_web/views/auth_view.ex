defmodule WltxWeb.AuthView do
  use WltxWeb, :view

  def render("login.json", %{token: token, user: user}) do
    user
    |> Map.from_struct()
    |> Map.take([:username, :first_name, :last_name, :id, :email])
    |> Map.merge(%{key: token})
  end

  def render("user.json", %{current_user: current_user}) do
    current_user
    |> Map.from_struct()
    |> Map.take([:username, :first_name, :last_name, :id, :email])
  end

  def render("error.json", %{message: message}) do
    %{message: [message]}
  end
end
