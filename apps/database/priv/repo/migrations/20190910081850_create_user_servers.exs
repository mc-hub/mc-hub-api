defmodule Database.Repo.Migrations.CreateUserServers do
  use Ecto.Migration

  def change do
    create table(:user_servers) do
      add :host_id, :string
      add :is_server_active, :boolean
      add :ip, :string
      add :user, :string
      add :server_name, :string
      add :creation_date, :utc_datetime
      add :deleted_date, :utc_datetime
  end
  end
end
