defmodule ElisirDiPomodoroWeb.Router do
  use ElisirDiPomodoroWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElisirDiPomodoroWeb do
    pipe_through :browser # Use the default browser stack

    get "/", UserController, :index
    get "/users/new", UserController, :new
    post "/users", UserController, :create
    delete "/users/:id", UserController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElisirDiPomodoroWeb do
  #   pipe_through :api
  # end
end
