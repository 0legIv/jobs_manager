use Mix.Config

# Configure your database
config :jobs_manager, JobsManager.Repo,
  username: "postgres",
  password: "postgres",
  database: "jobs_manager_test",
  hostname: "localhost",
  types: JobsManager.PostgresTypes,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :jobs_manager, JobsManagerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
