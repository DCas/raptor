class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.string :post_date
      t.decimal :sentiment_score
      t.string :sentiment

      t.timestamps
    end
  end
end
