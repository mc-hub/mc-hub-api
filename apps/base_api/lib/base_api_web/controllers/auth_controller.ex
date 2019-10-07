defmodule BaseApiWeb.AuthController do
  use BaseApiWeb, :controller

  alias Database.Accounts
  alias Database.Accounts.User

  alias BaseApi.Guardian

  action_fallback BaseApiWeb.FallbackController

  def register(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn |> json(%{user: user.id, token: token})
    end
  end

  def login(conn, %{"user" => %{"email" => email, "password" => password}}) do
    user_obj = Accounts.get_user_by_email!(email)
    IO.inspect user_obj

    with {:ok, %User{} = user} <- Accounts.check_pass(user_obj, password),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn |> json(%{"token": token})
    end
  end

  def getUserByToken(conn, %{"token" => token}) do
    #{:ok, claims} = Guardian.decode_and_verify(token)
    case Guardian.decode_and_verify(token) do
      {:ok, claims} ->
        sub = claims["sub"]
        conn |> json(%{"userID": sub})
      {:error, _claims} ->
        conn |> json(%{"error": "invalid token"})


    end


  end

end
