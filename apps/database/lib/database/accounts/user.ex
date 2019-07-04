defmodule Database.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :uuid, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :email_confirmed, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :email_confirmed])
    |> validate_required([:name, :email])
    |> check_uuid()
    |> unique_constraint(:email)
  end

  @doc """
  Put Email/Password
  """
  def update_changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_change(:encrypted_password, encrypted_password(attrs["password"]))
  end

  defp encrypted_password(passowrd) do
    Argon2.hash_pwd_salt(passowrd)
  end

  defp check_uuid(changeset) do
    case get_field(changeset, :uuid) do
      nil ->
        force_change(changeset, :uuid, UUID.uuid4())

      _ ->
        changeset
    end
  end
end
