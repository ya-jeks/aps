# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config


config :phoenix, :template_engines,
   slim: PhoenixSlime.Engine,
   slime: PhoenixSlime.Engine

# General application configuration
config :menu,
  ecto_repos: [Menu.Repo]

# Configures the endpoint
config :menu, Menu.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZHcFUm9/kk9oFITZuZ114nEP/X2SssvezqWqgYlaGCJ9aWuT/+YHsD40YzmLGRvI",
  render_errors: [view: Menu.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Menu.PubSub,
           adapter: Phoenix.PubSub.PG2],
  live_reload: [
   patterns: [
     ~r{web/views/.*(ex)$},
     ~r{web/templates/.*(eex|slim|slime)$},
     ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$}
   ]
  ]

# Configures Elixir's Logger
config :logger, :console,
  level: :debug,
  format: "$date $time [$level] $metadata $message\n",
  metadata: [:module, :pid]

config :logger, :info,
  path: "log/app.log",
  level: :info,
  format: "$date $time [$level] $metadata $message\n",
  metadata: [:module, :pid]

config :logger, :warn,
  path: "log/app.log",
  level: :warn,
  format: "$date $time [$level] $metadata $message\n",
  metadata: [:module, :pid]

config :logger, :error,
  path: "log/app.log",
  level: :error,
  format: "$date $time [$level] $metadata $message\n",
  metadata: [:module, :pid]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  require_current_password: false,
  user_schema: Menu.User,
  repo: Menu.Repo,
  module: Menu,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%
