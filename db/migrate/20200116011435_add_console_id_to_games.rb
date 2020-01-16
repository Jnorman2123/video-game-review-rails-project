class AddConsoleIdToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :console_id, :integer
  end
end
