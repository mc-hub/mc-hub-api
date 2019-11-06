defmodule LinodeVpsApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :uuid, :string
      add :email, :string
      add :encrypted_password, :string

      timestamps()
    end

  end
end
