class Team < ActiveRecord::Base
  require 'twitter'
  has_many :players
  has_many :tweets, through: :players
  after_create :create_all_players
  
  def get_players
    Twitter.list_members(username, player_list)
  end
  
  def player_sentiments
    averages = Hash.new
    players.each do |p|
      averages[p] = p.week_sentiment
    end
    averages
  end
  
  def create_all_players
    get_players.each do |player|
      players.create(:twitter_username => player.screen_name)
    end
  end
  
  def week_sentiment
    self.tweets.where("post_date > ?", 1.week.ago).average(:sentiment_score).round(2)
  end
  
  def display_name
    location + ' ' + name
  end
  
  def twitter_url
    'http://www.twitter.com/' + twitter
  end
  
end
