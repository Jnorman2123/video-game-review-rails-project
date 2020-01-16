class ReviewsController < ApplicationController 

    def index 
        @reviews = Review.all
    end 
    
    def new 
        @review = Review.new
    end 

    def create 
        @review = Review.create(review_params)
        if @review.save 
            redirect_to game_path(@review) 
        else 
            redirect_to new_review_path
        end 
    end 

    def show 

    end 

    def edit 

    end 

    def update 

    end 
    
    def destroy 

    end 
end 