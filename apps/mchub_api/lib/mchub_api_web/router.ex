defmodule MchubApiWeb.Router do
  use MchubApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MchubApiWeb do
    pipe_through :api
  end
end
