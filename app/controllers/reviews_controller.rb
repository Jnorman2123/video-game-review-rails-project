class ReviewsController < ApplicationController 
    before_action :set_review_or_invalid, only: [:show, :edit, :update, :destroy]
    def index 
        @reviews = Review.all
    end 
    
    def new 
        @review = Review.new
    end 

    def create 
        @review = Review.create(review_params)
        if @review.save
            redirect_to game_path(@review.game_id)
        else 
            review_errors
            redirect_to game_path(@review.game_id)
        end 
    end 

    def show 
    end 

    def edit 
        if !current_user.admin || current_user != @review.user
            flash[:notice] = "Only Admins or the Owner of the review can edit it."
            redirect_to game_review_path(@review)
        end 
    end 

    def update 
        if @review.update(review_params)
            redirect_to game_path(@review.game_id)
        else 
            review_errors 
            redirect_to edit_game_review_path(@review)
        end
    end 
    
    def destroy 
        @review.delete 
        redirect_to game_path(@review.game)
    end 

    private 

    def review_params 
        params.require(:review).permit(:content, :rating, :game_id, :user_id)
    end 

    def set_review
        Review.find_by_id(params[:id])
    end 

    def invalid_review
        flash[:notice] = "That review does not exist."
        redirect_to game_reviews_path 
    end 

    def set_review_or_invalid 
        @review = set_review ? @review = set_review : invalid_review
    end 

    def review_errors 
        flash[:notice] = "#{@review.errors.full_messages.first}"
    end 
end 



