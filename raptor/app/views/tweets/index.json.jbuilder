json.array!(@tweets) do |tweet|
  json.extract! tweet, :body, :post_date, :sentiment_score, :sentiment
  json.url tweet_url(tweet, format: :json)
end
