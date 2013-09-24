class AddPlayerIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :player_id, :integer
  end
end
