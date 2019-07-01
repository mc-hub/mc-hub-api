defmodule BaseApiWeb.Router do
  use BaseApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BaseApiWeb do
    pipe_through :api

    resources "/users", UserController
  end
end
