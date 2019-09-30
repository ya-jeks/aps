defmodule Menu.PageController do
  use Menu.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
