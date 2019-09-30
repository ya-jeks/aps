defmodule Menu.SettingController do
  use Menu.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", settings: current_user(conn).settings
  end
end
