class GamesController < ApplicationController 

    def index 
        @games = Game.all 
    end 

    def new 
        not_admin
        @game = Game.new
        @consoles = Console.all
        3.times {@game.consoles.build}
    end 

    def create 
        not_admin
        @game = Game.create(game_params)

        if @game.save 
            redirect_to game_path(@game)
        else 
            redirect_to new_game_path 
        end 
    end 

    def edit 
        not_admin 
        @game = set_game ? @game = set_game : invalid_game
        binding.pry
    end 

    def update 
        @game = set_game 
        if @game.update(game_params)
            redirect_to game_path(@game)
        else 
            redirect_to edit_game_path(@game)
        end 
    end  

    def show 
        if @game = set_game
            @review = @game.reviews.new
        else 
            invalid_game
        end 
    end  

    def destroy 
        @game = set_game 
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
end 