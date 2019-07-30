defmodule Database.Repo.Migrations.CreateIpaddresses do
  use Ecto.Migration

  def change do
    create table(:ip_address) do
      add :host_name, :string
      add :ip, :string
      add :is_using, :boolean
  end
end
end
