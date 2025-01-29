defmodule Anoma.Client.Api.Servers.Blocks do
  @moduledoc """
  I implement the callbacks for the GRPC service `Indexer`.
  Each function below implements one API call.
  """
  alias Anoma.Client.Connection.GRPCProxy
  alias Anoma.Protobuf.Indexer.Blocks.Filtered
  alias Anoma.Protobuf.Indexer.Blocks.Get
  alias Anoma.Protobuf.Indexer.Blocks.Latest
  alias Anoma.Protobuf.Indexer.Blocks.Root
  alias GRPC.Server.Stream

  require Logger

  use GRPC.Server, service: Anoma.Protobuf.BlockService.Service

  import Anoma.Protobuf.ErrorHandler

  @doc """
  I implement the `get` API call.

  I return a list of blocks from/before the given height.

  Example request:
  ```
  %Anoma.Protobuf.Indexer.Blocks.Get.Request{
    node_info: %Anoma.Protobuf.NodeInfo{
      node_id: "117735458",
    },
    index: {:before, 2},
  }
  ```
  """
  @spec get(Get.Request.t(), Stream.t()) :: Get.Response.t()
  def get(request, _stream) do
    Logger.debug("GRPC #{inspect(__ENV__.function)}: #{inspect(request)}")

    # validate the request. will raise if not valid.
    validate_request!(request)

    case GRPCProxy.get_blocks(request.index) do
      {:ok, response} ->
        response

      {:error, grpc_error} ->
        raise grpc_error
    end
  end

  @doc """
  I return the latest block from the indexer.
  """
  @spec get(Latest.Request.t(), Stream.t()) :: Latest.Response.t()
  def latest(_request, _stream) do
    case GRPCProxy.get_latest_block() do
      {:ok, response} ->
        response

      {:error, grpc_error} ->
        raise grpc_error
    end
  end

  @doc """
  I return the root of the indexer.
  """
  @spec root(Root.Request.t(), Stream.t()) :: Root.Response.t()
  def root(_request, _stream) do
    case GRPCProxy.root() do
      {:ok, response} ->
        response

      {:error, grpc_error} ->
        raise grpc_error
    end
  end

  @doc """
  I return a list of resources as jammed nouns from the indexer matching the given filters.
  """
  @spec filter(Filtered.Request.t(), Stream.t()) :: Filtered.Response.t()
  def filter(request, _stream) do
    case GRPCProxy.filter(request.filters) do
      {:ok, response} ->
        response

      {:error, grpc_error} ->
        raise grpc_error
    end
  end
end
