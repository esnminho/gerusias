defmodule GerusiasWeb.PageController do
  use GerusiasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
