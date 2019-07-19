defmodule BaseApiWeb.BalanceController do
  use BaseApiWeb, :controller

  alias Database.Balancies
  alias Database.Accounts.{User, Balance}

  action_fallback BaseApiWeb.FallbackController

  def show(%{assigns: %{user: user}} = conn, _params) do
    with {:ok, balance} <- Balancies.get_balance!(user.id) do
      conn |> json(%{balance: balance.currentBalance})
    end
  end
end
