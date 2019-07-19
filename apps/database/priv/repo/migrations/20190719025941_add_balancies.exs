defmodule Database.Repo.Migrations.AddBalancies do
  use Ecto.Migration

  def change do
    create table(:balancies) do
      add :user_id, references(:users, on_delete: :nothing)
      add :currentBalance, :decimal

      timestamps()
    end

    create index(:balancies, [:user_id])
  end
end
