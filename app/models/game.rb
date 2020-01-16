class Game < ApplicationRecord
    has_many :reviews 
    has_many :consoles 
    has_many :users, through: :reviews 
    validates :title, presence: true, uniqueness: true 
    validates :console, presence: true
    
    def console_attributes=(console) 
        self.console = Console.find_or_create_by(name: console[:name])
        self.console.update(console)
    end 
end
