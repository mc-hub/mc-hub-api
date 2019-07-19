defmodule BaseApiWeb.Router do
  use BaseApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug BaseApi.Plugs.EnsureAuthenticatedPlug
    plug BaseApi.Plugs.FetchUserPlug
  end

  scope "/api", BaseApiWeb do
    pipe_through [:api]

    post "/auth/login", AuthController, :login
    post "/auth/register", AuthController, :register

    resources "/users", UserController
  end

  scope "/api", BaseApiWeb do
    pipe_through [:api, :authenticated]

    get "/account/balance", BalanceController, :show
  end
end
