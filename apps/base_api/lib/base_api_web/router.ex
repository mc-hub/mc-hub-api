defmodule BaseApiWeb.Router do
  use BaseApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug BaseApi.Plugs.EnsureAuthenticated
    plug BaseApi.Plugs.FetchCurrentUser
  end

  scope "/api", BaseApiWeb do
    pipe_through [:api]

    post "/login", AuthController, :login
    post "/register", AuthController, :register
    get "/listserver", ServerController, :listserver
    post "/addserver", ServerController, :addserver
    post "/tokentest", ServerController, :tokentest

    resources "/users", UserController
  end
end
