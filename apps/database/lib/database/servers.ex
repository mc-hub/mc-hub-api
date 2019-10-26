defmodule Database.Servers do
  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.Servers.Server

  def create_server(attrs \\ %{}) do
    %Server{}
    |> Server.changeset(attrs)
    #|> Server.creation_date = DateTime.now()
    |> Repo.insert()

  end

  def remove_server(attrs \\ %{}) do
    #TODO
  end

  def list_server(user) do
    query =
      from s in Server,
      where: s.user == ^user

    Repo.all(query)
  end

  def get_server(id) do
    Repo.get(Servers, id)
  end
end
