defmodule LinodeVpsApi.Repo.Migrations.CreateBalancies do
  use Ecto.Migration

  def change do
    create table(:balancies) do
      add :current_balance, :decimal
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:balancies, [:user_id])
  end
end
