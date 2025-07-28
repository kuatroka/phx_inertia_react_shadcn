defmodule ElixirPhoenixInertiaReactTypescriptWeb.PageController do
  use ElixirPhoenixInertiaReactTypescriptWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    IO.puts("Rendering home page")
    conn
    |> render_inertia("Home")
  end
end
