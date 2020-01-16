class RemoveConsoleFromGame < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :console 
  end
end
