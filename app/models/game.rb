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
                if !v.nil? && !v.empty?
                    console = Console.find_by(name: v) 
                    self.consoles << console
                    self.save
                end 
            end 
        end 
    end   

    def show_release_date 
        self.release_date.strftime('%b, %d, %Y')
    end 

    def average_rating 
        scores = []
        self.reviews.each do |review| 
            scores << review.rating
        end 
        total_score = scores.inject(0){ |sum, x| sum + x}
        num_of_reviews = self.reviews.count 
        total_score / num_of_reviews   
    end 
end
