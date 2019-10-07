defmodule Database.Repo.Migrations.RemoveServerRelatedTables do
  use Ecto.Migration

  def change do
    drop table(:host_servers)
    drop table(:server_usage_info)
    drop table(:deleted_servers)
    drop table(:ip_address)
  end
end
