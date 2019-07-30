defmodule Database.Repo.Migrations.CreateServers do
  use Ecto.Migration

  def change do
    create table(:host_servers) do
      add :host_id, :string
      add :free_ram, :integer
      add :usable_ram, :integer
      add :cpu, :string
      add :cpu_cores, :integer
      add :ram, :integer
      add :storage, :integer
      add :storage_type, :integer
      add :ip_address, :string
    end
  end

end
