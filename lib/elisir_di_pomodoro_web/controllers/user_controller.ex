defmodule ElisirDiPomodoroWeb.UserController do
  use ElisirDiPomodoroWeb, :controller

  alias ElisirDiPomodoro.Accounts

  def index(conn, _) do
    users = Accounts.list_users
    render conn, "index.html", users: users
  end

  def new(conn, _) do
    changeset = Accounts.change_user
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Usuario Creado")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Algo salió mal")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => user_id}) do
    Accounts.delete_user(user_id)
    conn
    |> put_flash(:info, "Se borro man, el bato con id: #{user_id}")
    |> redirect(to: user_path(conn, :index))
  end
end
