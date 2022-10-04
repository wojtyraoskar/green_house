defmodule GreenHouseWeb.PageController do
  use GreenHouseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
