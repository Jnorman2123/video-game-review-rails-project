class Game < ApplicationRecord
    has_many :reviews 
    has_many :consoles 
    has_many :users, through: :reviews 
    accepts_nested_attributes_for :consoles
    validates :title, presence: true, uniqueness: true 
    
end
