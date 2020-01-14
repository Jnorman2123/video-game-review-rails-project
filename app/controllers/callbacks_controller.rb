class CallbacksController < Devise::OmniauthCallbacksController 
    def github 
        binding.pry
        @user = User.from_omniauth(request.env["omniauth.auth"])

        sign_in_and_redirect root_path
    end 
end 