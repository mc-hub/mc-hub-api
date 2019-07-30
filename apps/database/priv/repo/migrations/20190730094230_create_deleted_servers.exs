defmodule Database.Repo.Migrations.CreateDeletedServers do
  use Ecto.Migration

  def change do
    create table(:deleted_servers) do
      add :user_id, :integer
      add :uuid, :string
      add :host_ip, :string
      add :start_time, :utc_datetime
      add :use_type, :integer
      add :host_type, :integer
      add :host_plan, :integer
      add :host_name, :string
      add :server_ip, :string
      add :is_dedicated_ip, :boolean
      add :host_id, :string
  end
end
end
