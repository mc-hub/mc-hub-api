defmodule Database.Servers.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_servers" do
    field :host_id, :string
    field :is_server_active, :string
    field :ip, :string
    field :user, :string
    field :server_name, :string
    field :creation_date, :utc_datetime
    field :deleted_date, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:host_id,:ip])
    |> validate_required([:host_id,:ip])

  end

end
