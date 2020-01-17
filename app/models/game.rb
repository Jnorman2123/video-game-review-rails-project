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
                binding.pry
                if !v.nil? && !v.empty?
                    console = Console.find_by(name: v) 
                    self.consoles << console
                    self.save
                end 
            end 
        end 
    end 
    
end
