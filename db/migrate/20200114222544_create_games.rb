class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :console 
      t.string :genre 
      t.string :img_url 
      t.date :release_date 
      t.timestamps
    end
  end
end
