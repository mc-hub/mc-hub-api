# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :linode_vps_api,
  ecto_repos: [LinodeVpsApi.Repo]

# Configures the endpoint
config :linode_vps_api, LinodeVpsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U7Br7KPCjhiObeD02hs/AoOjD/6TFSBOqLDy8KbcVoE2UKxa0d+hs9WaWn+PHNQH",
  render_errors: [view: LinodeVpsApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: LinodeVpsApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
