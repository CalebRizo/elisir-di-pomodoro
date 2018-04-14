defmodule ElisirDiPomodoroWeb.PageController do
  use ElisirDiPomodoroWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
