defmodule BaseApiWeb.AuthController do
  use BaseApiWeb, :controller

  alias Database.Accounts
  alias Database.Accounts.User

  alias BaseApi.Guardian

  action_fallback BaseApiWeb.FallbackController

  def register(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      token = Phoenix.Token.sign(BaseApiWeb.Endpoint, "user salt", user.id)
      BaseApi.Email.hello_email(user.email, token) |> BaseApi.Mailer.deliver_now

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

  def email_confirmnation(conn, %{"token" => token}) do
    {:ok, user_id} = Phoenix.Token.verify(BaseApiWeb.Endpoint, "user salt", token, max_age: 900)
    user_obj = Accounts.get_user!(user_id)

    Accounts.update_user(user_obj, %{email_confirmed: true})
    IO.inspect user_obj

    with {:ok, token, _claims} <- Guardian.encode_and_sign(user_obj) do
      conn |> json(%{"token": token})
    end
  end
end
