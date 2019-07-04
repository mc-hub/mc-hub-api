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

config :base_api, BaseApi.Mailer,
         adapter: Bamboo.SMTPAdapter,
         server: "mailhog",
         #System.get_env("MAIL_SERVER")
#         hostname: "your.domain",
         port: 1025,
#         username: "your.name@your.domain", # or {:system, "SMTP_USERNAME"}
#         password: "pa55word", # or {:system, "SMTP_PASSWORD"}
         tls: :if_available, # can be `:always` or `:never`
         allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"], # or {:system, "ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
         ssl: false, # can be `true`
         retries: 1,
         no_mx_lookups: false, # can be `true`
         auth: :if_available
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
