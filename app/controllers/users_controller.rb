class UsersController < ApplicationController 
    before_action :must_be_logged_in, only: [:index, :show]
    def index 
        @users = User.all 
    end 

    def show 
        @user = User.find(params[:id])
    end 
 
end 