defmodule Database.Balancies do
  @moduledoc """
  The Balance context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.Accounts.Balance

  @doc """
  Gets a balance for a user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

  iex> get_balance!(123)
  %Balance{}

  iex> get_balance!(123)
  ** (Ecto.NoResultsError)

  """
  def get_balance!(user_id) do
    query = from b in Balance,
      where: b.user_id == ^user_id

    Repo.one!(query)
  end
end
