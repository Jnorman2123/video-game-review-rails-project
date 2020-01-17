class ReviewsController < ApplicationController 

    def index 
        @reviews = Review.all
    end 
    
    def new 
        @review = Review.new
    end 

    def create 
        binding.pry
        @review = Review.create(review_params)
        redirect_to game_path(@review.game_id)
    end 

    def show 
        @review = Review.find_by(params[:id])
    end 

    def edit 

    end 

    def update 

    end 
    
    def destroy 

    end 

    private 

    def review_params 
        params.require(:review).permit(:content, :rating, :game_id, :user_id)
    end 
end 