json.array!(@trade_deals) do |trade_deal|
  json.extract! trade_deal, :id, :player_id, :country_resource_id, :cost, :quantity, :agreed
  json.url trade_deal_url(trade_deal, format: :json)
end
