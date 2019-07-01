defmodule BaseApi.Plugs.FetchCurrentUser do
  import Plug.Conn

  alias Database.Accounts.User

  def init(options), do: options

  def call(conn, _options) do
    case BaseApi.Guardian.Plug.current_resource(conn) do
      nil ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(403, Jason.encode!(%{error: "Invalid Crendentials."}))
        |> halt
      %User{} = user ->
        assign(conn, :user, user)
    end
  end
end
