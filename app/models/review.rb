class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :game 
    validates :content, presence: true, length: {maximum: 250}
    validates :rating, presence: true, numericality: {only_integer: true}
    validate :rating_values

    def rating_values 
        if rating < 0 || rating > 10 
            errors.add(:rating, "That is not a valid rating.")
        end 
    end 

    def rating_score 
        "RATING #{self.rating} out of 10." if !self.rating.nil?
    end 
end
