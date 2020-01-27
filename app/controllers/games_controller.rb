class GamesController < ApplicationController 
    before_action :not_admin, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_game_or_invalid, only: [:edit, :update, :show, :destroy]
    before_action :must_be_logged_in, only: [:index, :show, :new, :edit]
    def index 
        if params[:title]
            @games = Game.where('title LIKE ?', "%#{params[:title]}%")
        else
            @games = Game.all 
        end 
    end 

    def new 
        @game = Game.new
        @consoles = Console.all
        3.times {@game.consoles.build}
    end 

    def create 
        @game = Game.new(game_params)

        if @game.save 
            success_message("Game", "created")
            redirect_to game_path(@game)
        else 
            game_errors
            @consoles = Console.all
            2.times {@game.consoles.build}
            render :new 
        end 
    end 

    def edit 
   
    end 

    def update 
        if @game.update(game_params)
            success_message("Game", "edited")
            redirect_to game_path(@game)
        else 
            game_errors
            render :edit
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
        success_message("Game", "deleted")
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