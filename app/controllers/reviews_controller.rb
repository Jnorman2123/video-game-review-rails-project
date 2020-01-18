class ReviewsController < ApplicationController 

    def index 
        @reviews = Review.all
    end 
    
    def new 
        @review = Review.new
    end 

    def create 
        @review = Review.create(review_params)
        redirect_to game_path(@review.game_id)
    end 

    def show 
        @review = Review.find(params[:id])
    end 

    def edit 
        @review = Review.find(params[:id])
        if !current_user.admin || current_user != @review.user
            flash[:notice] = "Only Admins or the Owner of the review can edit it."
            redirect_to game_review_path(@review)
        end 
    end 

    def update 
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to game_path(@review.game_id)
        else 
            redirect_to game_review_edit_path(@review)
        end
    end 
    
    def destroy 
        @review = Review.find(params[:id])
        @review.delete 
        redirect_to game_path(@review.game)
    end 

    private 

    def review_params 
        params.require(:review).permit(:content, :rating, :game_id, :user_id)
    end 
end 