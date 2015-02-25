json.array!(@players) do |player|
  json.extract! player, :id, :name, :title, :email, :password_digest
  json.url player_url(player, format: :json)
end
