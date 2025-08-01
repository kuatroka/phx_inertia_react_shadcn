defmodule ElixirPhoenixInertiaReactTypescript.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirPhoenixInertiaReactTypescriptWeb.Telemetry,
      ElixirPhoenixInertiaReactTypescript.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:elixir_phoenix_inertia_react_typescript, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:elixir_phoenix_inertia_react_typescript, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirPhoenixInertiaReactTypescript.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ElixirPhoenixInertiaReactTypescript.Finch},
      # Start a worker by calling: ElixirPhoenixInertiaReactTypescript.Worker.start_link(arg)
      # {ElixirPhoenixInertiaReactTypescript.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirPhoenixInertiaReactTypescriptWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirPhoenixInertiaReactTypescript.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirPhoenixInertiaReactTypescriptWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
