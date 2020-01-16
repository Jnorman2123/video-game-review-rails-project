class Console < ApplicationRecord
    has_many :consoles_games
    has_many :games, through: :consoles_games 
    
end
