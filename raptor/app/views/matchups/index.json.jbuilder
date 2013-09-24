json.array!(@matchups) do |matchup|
  json.extract! matchup, :time, :home_id, :away_id, :home_symbol, :home_symbol, :away_symbol
  json.url matchup_url(matchup, format: :json)
end
