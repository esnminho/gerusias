# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gerusias,
  ecto_repos: [Gerusias.Repo]

# Configures the endpoint
config :gerusias, GerusiasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mg5JnYlGBPD3iJyQko/XSQY0dMghF8X5lpjcgBFv44tEdYKUK3HBQoJjynKHS3Zh",
  render_errors: [view: GerusiasWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gerusias.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :torch,
  otp_app: :gerusias,
  template_format: "eex" || "slim"

config :gerusias, :pow,
  user: Gerusias.Users.User,
  repo: Gerusias.Repo,
  extensions: [PowResetPassword, PowEmailConfirmation, PowInvitation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: GerusiasWeb.PowMailer,
  web_mailer_module: GerusiasWeb,
  web_module: GerusiasWeb,
  routes_backend: GerusiasWeb.Pow.Routes

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
