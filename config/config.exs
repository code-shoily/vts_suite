# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wltx, ecto_repos: [Wltx.Repo]

# Configures the endpoint
config :wltx, WltxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MubWHVBVcP2a7ngW8MRigqHFn07y1e8x9BWm/YgI76AaO7pDyYRuLQnHB2d3FB3T",
  render_errors: [view: WltxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wltx.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders, json: ProperCase.JSONEncoder.CamelCase

config :wltx, WltxWeb.Guardian,
  issuer: "wltx",
  secret_key: "ObhXKr9YtNwYlZIUA1/p/ACMBDIkBRlJpurTnU6AfmKV1cYFOmHRvEVRygHTStfY",
  allowed_algos: ["HS256"],
  ttl: {30, :days},
  allowed_drift: 2000

config :wltx, Wltx.Repo, types: Wltx.PostgresTypes
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
