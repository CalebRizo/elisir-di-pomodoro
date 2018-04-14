# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elisir_di_pomodoro,
  ecto_repos: [ElisirDiPomodoro.Repo]

# Configures the endpoint
config :elisir_di_pomodoro, ElisirDiPomodoroWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MK+4qN8d6jS/ZAqAjqMYNttib82qq9LZeW8YxHT/JamjGNtJC7k2Q2I6OY9KPjSU",
  render_errors: [view: ElisirDiPomodoroWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElisirDiPomodoro.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
