defmodule LinodeVpsApi.Repo.Migrations.CreateServerUsageInfo do
  use Ecto.Migration

  def change do
    create table(:server_usage_info) do
      add :uuid, :string
      add :host_ip, :string
      add :start_time, :utc_datetime
      add :server_name, :string
      add :extra_data, :map
      add :host_name, :string
      add :user_id, references(:user, on_delete: :nothing)

      timestamps()
    end

    create index(:server_usage_info, [:user_id])
  end
end
