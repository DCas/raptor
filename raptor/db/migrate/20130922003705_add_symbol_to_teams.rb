class AddSymbolToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :symbol, :string
  end
end
