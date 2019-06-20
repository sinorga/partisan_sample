defmodule DistributedPartisan do
  @moduledoc """
  Documentation for DistributedPartisan.
  """

  def enable_ssl do
    :partisan_config.set(:tls, true)

    ssl_opts =
      case :partisan_config.get(:tag, :server) do
        "server" ->
          [
            cacertfile: "priv/ca.cer",
            certfile: "priv/server.cer",
            keyfile: "priv/server-key.pem",
            verify: :verify_peer,
            fail_if_no_peer_cert: true,
            server_name_indication: :disable
          ]

        _ ->
          [
            cacertfile: "priv/ca.cer",
            certfile: "priv/client.cer",
            keyfile: "priv/client-key.pem",
            verify: :verify_peer,
            fail_if_no_peer_cert: true,
            server_name_indication: :disable
          ]
      end

    :partisan_config.set(:tls_options, ssl_opts)
  end

  @doc """
  connect remote node

  ex: `DistributedPartisan.connect(:"bob@xxxx.local")`
  """
  def connect(node) do
    :partisan_peer_service.join(node)
  end

  def node do
    :partisan_peer_service_manager.myself()
  end

  def disconnect(node) do
    :partisan_peer_service.leave(node)
  end

  def cast(node, msg) do
    :partisan_peer_service.cast_message(node, MessageServer, msg)
  end

  def send(node, msg) do
    :partisan_peer_service.forward_message(node, MessageServer, msg)
  end

  def list do
    :partisan_peer_service.members()
  end
end
