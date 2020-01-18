class GamesController < ApplicationController 
    before_action :not_admin, only: [:new, :create, :edit]
    before_action :set_game_or_invalid, only: [:edit, :update, :show, :destroy]
    def index 
        @games = Game.all 
    end 

    def new 
        @game = Game.new
        @consoles = Console.all
        3.times {@game.consoles.build}
    end 

    def create 
        @game = Game.create(game_params)

        if @game.save 
            redirect_to game_path(@game)
        else 
            game_errors
            redirect_to new_game_path 
        end 
    end 

    def edit 
    end 

    def update 
        if @game.update(game_params)
            redirect_to game_path(@game)
        else 
            game_errors
            redirect_to edit_game_path(@game)
        end 
    end  

    def show 
        @review = @game.reviews.new
    end  

    def destroy  
        @reviews = @game.reviews
        @reviews.each do |review|
            review.destroy
        end
        @game.delete
        redirect_to games_path
    end 

    private 

    def game_params 
        params.require(:game).permit(
            :title, 
            :genre, 
            :img_url, 
            :release_date,
            consoles_attributes: [
                :name,
            ]
        )
    end 

    def set_game 
        Game.find_by_id(params[:id])
    end 

    def invalid_game
        flash[:notice] = "That game does not exist."
        redirect_to games_path 
    end 

    def not_admin 
        if !current_user.admin
            flash[:notice] = "Only Admins can access that page."
            redirect_to root_path 
            return
        end 
    end 

    def set_game_or_invalid 
        @game = set_game ? @game = set_game : invalid_game
    end 

    def game_errors 
        flash[:notice] = "#{@game.errors.full_messages.first}"
    end 
end 