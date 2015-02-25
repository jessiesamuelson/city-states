json.array!(@countries) do |country|
  json.extract! country, :id, :name, :player_id, :flag, :motto, :population, :employment, :tax_rate, :wealth
  json.url country_url(country, format: :json)
end
