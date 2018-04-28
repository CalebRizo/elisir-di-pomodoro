defmodule ElisirDiPomodoro.Accounts do
  alias ElisirDiPomodoro.{Repo, User}

  def list_users do
    Repo.all(User)
  end

  def change_user do
    User.changeset(%User{}, %{})
  end

  def create_user(params) do
    changeset = User.changeset(%User{}, params)
    Repo.insert(changeset)
  end

  def delete_user(id) do
    User
    |> Repo.get(id)
    |> Repo.delete
  end
end
