# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElisirDiPomodoro.Repo.insert!(%ElisirDiPomodoro.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ElisirDiPomodoro.{Repo, User}

Repo.delete_all(User)

caleb = %User{username: "caleb", password: "asdf0987", email: "kaleb.rizzo@gmail.com"}

Repo.insert!(caleb)
