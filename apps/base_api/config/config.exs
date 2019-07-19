# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :base_api, BaseApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dG/cJCNnFBx6fHoAoEX3zfS7ag7fcu3gZH+HrkB8rrJkJCV8sLDOmq3DhxUfGydY",
  render_errors: [view: BaseApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BaseApi.PubSub, adapter: Phoenix.PubSub.PG2]

config :base_api,
  ecto_repos: [Database.Repo]


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :base_api, :generators,
  migration: false,
  model: false

config :base_api, BaseApi.Guardian,
       issuer: "mc-hub",
       secret_key: "Secret key. You can use `mix guardian.gen.secret` to get one"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
