class UsersController < ApplicationController 
    before_action :must_be_logged_in, only: [:index, :show]
    def index 
        @users = User.user_non_admins
        @admins = User.user_admins
    end 

    def show 
        @user = User.find(params[:id])
        @reviews = @user.reviews
    end 
 
end 