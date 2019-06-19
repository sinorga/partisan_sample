defmodule DistributedPartisan do
  @moduledoc """
  Documentation for DistributedPartisan.
  """

  @doc """
  connect remote node

  ex: `DistributedPartisan.connect(:"bob@xxxx.local")`
  """
  def connect(node) do
    :partisan_peer_service.join(node)
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
