class AddGameIdToConsoles < ActiveRecord::Migration[6.0]
  def change
    add_column :consoles, :game_id, :integer
  end
end
