class Player < ActiveRecord::Base
  belongs_to :team
  has_many :tweets
  validates :name, length: {maximum:40}

  HOURS_BETWEEN_UPDATES = 12
  
  def set_name
    player = Twitter.user(twitter_username)
    update_attribute(:name, player.name)
  end
  
  def week_sentiment
    if self.tweets.where("post_date > ?" , 1.week.ago).empty?
      0
    else
      self.tweets.where("post_date > ?" , 1.week.ago).average(:sentiment_score).round(2)
    end
  end
  
  def get_tweets_with_sentiment
    if last_checked.nil? || Time.diff(DateTime.current, last_checked)[:hour] > HOURS_BETWEEN_UPDATES
      analyzer = Sentimental.new
      unless Twitter.user(twitter_username).protected?
        tweets = Twitter.user_timeline(twitter_username)
        tweets_last_week = tweets.keep_if { |tweet| tweet.created_at > 1.week.ago }
        tweets_last_week.each do |tweet|
          if (Tweet.find_by_tweet_id(tweet.id).nil?)
            Tweet.create(:player_id => self.id, :body => tweet.full_text, :post_date => tweet.created_at, :sentiment_score => analyzer.get_score(tweet.full_text), :sentiment => analyzer.get_sentiment(tweet.full_text).to_s, :tweet_id => tweet.id)
          end
        end
        update_attribute(:last_checked, DateTime.current)
      end
    end
    self.tweets.where("post_date > ?" , 1.week.ago).order('post_date DESC')
  end
  
end