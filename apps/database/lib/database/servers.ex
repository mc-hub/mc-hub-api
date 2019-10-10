defmodule Database.Servers do
  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.Servers.Server

  def create_server(attrs \\ %{}) do
    %Server{}
    |> Server.changeset(attrs)
    |> Repo.insert()

  end

  def remove_server(attrs \\ %{}) do
    
  end
end
