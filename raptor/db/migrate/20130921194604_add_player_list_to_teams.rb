class AddPlayerListToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :player_list, :string
  end
end
