defmodule BaseApiWeb.ServerController do
  use BaseApiWeb, :controller
  require IEx

  alias Database.Accounts
  alias Database.Servers
  alias Database.Accounts.User

  alias BaseApi.Guardian


  action_fallback BaseApiWeb.FallbackController

  def listserver(conn, _params) do
    conn
    |>json(%{test: "ljfljfs"})
  end

  def addserver(conn, %{"token" => token, "plan" => %{"region" => region, "plan" => plan, "game" => game}}) do
    # TODO: Token authentication

    {:ok, response} = HTTPoison.request(
      :post,
      "https://api.linode.com/v4/linode/instances",
      '{"region":"ap-northeast","type":"g6-nanode-1"}',
      [{"Content-Type","application/json"},{"Authorization","Bearer d12ddf6521257c86019c93b7313fdda8db482028c51fb5272980033f63e6b66f"}]
      #TODO LINODE AUTH TOKEN
      )
    Servers.create_server(id: response.'"id"', ip: Enum.at(response.ipv4, 0))

  #  %{id: id, ip: ip} = response


    conn
    |>json(%{test: "server added!"})
  end

  def removeServer(conn, %{"token" => token, "id" => id}) do
    #TODO
  end

  def tokentest(conn, %{"token" => token}) do
    case Guardian.decode_and_verify(token) do
      {:ok, claims} ->
        sub = claims["sub"]
        conn |> json(%{"userID": sub})
      {:error, _claims} ->
        conn |> json(%{"error": "invalid token"})
      end

  end



end
