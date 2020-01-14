Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  devise_scope :user do 
    get 'signin', to: 'devise/sessions#new' 
    get 'signup', to: 'registrations#new' 
    delete 'logout', to: 'devise/sessions#destroy'
  end 
  get '/users/auth/github/callback', to: 'devise/sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'
end
