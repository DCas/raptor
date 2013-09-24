class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.datetime :time
      t.integer :home_id
      t.integer :away_id
      t.string :home_symbol
      t.string :home_symbol
      t.string :away_symbol

      t.timestamps
    end
  end
end
