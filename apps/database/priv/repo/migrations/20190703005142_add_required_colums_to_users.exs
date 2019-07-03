defmodule Database.Repo.Migrations.AddRequiredColumsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :uuid, :string
      add :email, :string
      add :encrypted_password, :string
    end

    create unique_index(:users, :email)
  end
end
