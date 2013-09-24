class RemoveLinkFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :link, :string
  end
end
