defmodule BaseApiWeb.AuthController do
  use BaseApiWeb, :controller

  alias Database.Accounts
  alias Database.Accounts.User

  alias BaseApi.Guardian

  action_fallback BaseApiWeb.FallbackController

  def register(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user)
    do
      conn
      |> json(%{user: user.id, token: token})
    end
  end

  def login(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end
end
