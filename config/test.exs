import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :elixir_phoenix_inertia_react_typescript, ElixirPhoenixInertiaReactTypescript.Repo,
  database: Path.expand("../elixir_phoenix_inertia_react_typescript_test.db", __DIR__),
  pool_size: 5,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_phoenix_inertia_react_typescript, ElixirPhoenixInertiaReactTypescriptWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "WPTcFRIMRaQZ9+O7K6p3Y2i9udAO+heuM8aIGFyv8zEFmE9oj14Z86WAMfpr4LSP",
  server: false

# In test we don't send emails
config :elixir_phoenix_inertia_react_typescript, ElixirPhoenixInertiaReactTypescript.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
