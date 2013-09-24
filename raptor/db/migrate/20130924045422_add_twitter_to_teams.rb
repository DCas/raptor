class AddTwitterToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :twitter, :string
  end
end
