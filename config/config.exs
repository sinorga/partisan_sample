# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# third-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :distributed_partisan, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:distributed_partisan, :key)
#
# You can also configure a third-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"

config :lager,
  handlers: [
    lager_console_backend: :debug
  ]

config :logger, level: :debug

config :partisan,
  peer_port: (System.get_env("PEER_PORT") || "60000") |> String.to_integer(),
  # partisan_peer_service_manager: :partisan_client_server_peer_service_manager,
  tag: (System.get_env("TAG") || "server") |> String.to_atom()
