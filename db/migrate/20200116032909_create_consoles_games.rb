class CreateConsolesGames < ActiveRecord::Migration[6.0]
  def change
    create_table :consoles_games do |t|
      t.integer :game_id
      t.integer :console_id

      t.timestamps
    end
  end
end
