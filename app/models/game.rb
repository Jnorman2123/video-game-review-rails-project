class Game < ApplicationRecord
    has_many :reviews 
    has_many :consoles_games 
    has_many :consoles, through: :consoles_games
    has_many :users, through: :reviews 
    accepts_nested_attributes_for :consoles
    validates :title, presence: true, uniqueness: true 

    def consoles_attributes=(consoles) 
        consoles.each do |key, value|
            value.each do |k,v|
                console = Console.find_or_create_by(name: v) if !v.nil?
                self.consoles << console
                self.save
            end 
        end 
    end 
    
end
