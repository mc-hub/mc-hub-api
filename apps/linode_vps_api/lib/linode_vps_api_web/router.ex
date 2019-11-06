defmodule LinodeVpsApiWeb.Router do
  use LinodeVpsApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LinodeVpsApiWeb do
    pipe_through :api

    resources "/accounts/users", UserController, except: [:new, :edit]
  end
end
