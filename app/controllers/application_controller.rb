class ApplicationController < ActionController::Base

    def welcome 

    end 

    def must_be_logged_in 
        if !user_signed_in? 
            flash[:notice] = "You must be logged in to view that page."
            redirect_to root_path 
            return
        end 
    end 

end
