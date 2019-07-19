defmodule Database.Accounts.Balance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "balancies" do
    field :currentBalance, :decimal
    belongs_to :user, Database.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:currentBalance])
    |> validate_required([:currentBalance])
  end
end
