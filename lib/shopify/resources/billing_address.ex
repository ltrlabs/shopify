defmodule Shopify.BillingAddress do
  @moduledoc false
  
  @derive [Poison.Encoder]

  defstruct [
    :address1,
    :address2,
    :city,
    :company,
    :country,
    :country_code,
    :first_name,
    :last_name,
    :latitude,
    :longitude,
    :name,
    :phone,
    :province,
    :province_code,
    :zip
  ]
end