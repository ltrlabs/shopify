defmodule Shopify.Fulfillment do
  @moduledoc false
  @derive [Poison.Encoder]
  @singular "fulfillment"
  @plural "fulfillments"

  alias Shopify.{
    Fulfillment
  }

  use Shopify.NestedResource, import: [
    :find,
    :all,
    :create,
    :update
  ]

  defstruct [
    :created_at,
    :id,
    :line_items,
    :location_id,
    :order_id,
    :receipt,
    :status,
    :tracking_company,
    :tracking_number,
    :tracking_numbers,
    :tracking_url,
    :tracking_urls,
    :updated_at,
    :service,
    :shipment_status,
  ]

  def cancel(%Session{} = session, top_id, nest_id) do
    body = "{}"
    session
      |> Request.new(cancel_url(top_id, nest_id), %{}, singular_resource(), body)
      |> Client.post
  end

  @doc false
  def empty_resource do
    %Fulfillment{}
  end

  @doc false
  def find_url(top_id, nest_id) do 
    "orders/#{top_id}/" <> @plural <>  "/#{nest_id}.json"
  end

  def cancel_url(top_id, nest_id) do 
    "orders/#{top_id}/" <> @plural <>  "/#{nest_id}/cancel.json"
  end

  @doc false
  def all_url(top_id) do
    "orders/#{top_id}/" <> @plural <> ".json"
  end
end
