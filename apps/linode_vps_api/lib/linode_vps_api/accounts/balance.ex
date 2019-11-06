defmodule LinodeVpsApi.Accounts.Balance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "balancies" do
    field :current_balance, :decimal
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(balance, attrs) do
    balance
    |> cast(attrs, [:current_balance])
    |> validate_required([:current_balance])
  end
end
