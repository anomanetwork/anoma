defmodule Anoma.Client.Web.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, :failed_to_fetch_intents}) do
    conn
    |> put_status(503)
    |> put_view(json: Anoma.Client.Web.ErrorJSON)
    |> json(%{error: "failed to fetch intents"})
  end

  def call(conn, {:error, :add_intent_failed, err}) do
    conn
    |> put_status(503)
    |> put_view(json: Anoma.Client.Web.ErrorJSON)
    |> json(%{error: "failed to add intent", reason: err})
  end

  def call(conn, {:error, :add_transaction_failed, err}) do
    conn
    |> put_status(503)
    |> put_view(json: Anoma.Client.Web.ErrorJSON)
    |> json(%{error: "failed to add transaction", reason: err})
  end

  def call(conn, _err) do
    conn
    |> put_status(503)
    |> put_view(json: Anoma.Client.Web.ErrorJSON)
    |> json(%{error: "unknown error"})
  end
end
