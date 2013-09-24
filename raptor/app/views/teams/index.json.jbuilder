json.array!(@teams) do |team|
  json.extract! team, :name, :link
  json.url team_url(team, format: :json)
end
