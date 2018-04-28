defmodule ElisirDiPomodoroWeb.UserController do
  use ElisirDiPomodoroWeb, :controller

  alias ElisirDiPomodoro.{Repo, User}

  def index(conn, _) do
    users = Repo.all(User)
    render conn, "index.html", users: users
  end

  def new(conn, _) do
    changeset = User.changeset(%User{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
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
    user = Repo.get(User, user_id)
    Repo.delete(user)
    conn
    |> put_flash(:info, "Se borro man, el bato con id: #{user_id}")
    |> redirect(to: user_path(conn, :index))
  end
end
