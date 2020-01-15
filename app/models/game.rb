class Game < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews 
    validates :title, presence: true, uniqueness: true 
    validates :console, presence: true
end
