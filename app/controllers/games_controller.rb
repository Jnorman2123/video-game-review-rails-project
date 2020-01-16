class GamesController < ApplicationController 

    def index 
        @games = Game.all 
    end 

    def new 
        @game = Game.new
        3.times {@game.consoles.build}
    end 

    def create 
        @game = Game.create(game_params)

        if @game.save 
            redirect_to game_path(@game)
        else 
            redirect_to new_game_path 
        end 
    end 

    def edit 
        @game = set_game
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
        binding.pry
        @game = set_game
        @review = @game.reviews.new
    end  

    def destroy 
        @game = set_game 
        @game.delete
    end 

    private 

    def game_params 
        params.require(:game).permit(
            :title, 
            :genre, 
            :img_url, 
            :release_date,
            consoles_attributes: [
                :name
            ]
        )
    end 

    def set_game 
        Game.find(params[:id])
    end 
end 