json.array!(@players) do |player|
  json.extract! player, :name, :twitter_username
  json.url player_url(player, format: :json)
end
