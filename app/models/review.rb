class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :game 
    validates :content, presence: true, length: {maximum: 250}
    validates :rating, presence: true, inclusion: {in: %w(1 2 3 4 5 6 7 8 9 10)}
end
