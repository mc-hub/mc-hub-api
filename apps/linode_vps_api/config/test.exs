use Mix.Config

# Configure your database
config :linode_vps_api, LinodeVpsApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "linode_vps_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :linode_vps_api, LinodeVpsApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
