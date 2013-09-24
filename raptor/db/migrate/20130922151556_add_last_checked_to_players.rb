class AddLastCheckedToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :last_checked, :datetime
  end
end
