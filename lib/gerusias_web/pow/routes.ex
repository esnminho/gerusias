defmodule GerusiasWeb.Pow.Routes do
  use Pow.Phoenix.Routes
  alias GerusiasWeb.Router.Helpers, as: Routes

  def after_sign_in_path(conn), do: Routes.page_path(conn, :index)
end
