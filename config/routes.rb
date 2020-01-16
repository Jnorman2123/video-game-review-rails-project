Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :games do 
    resources :reviews, only: [:new, :create, :edit, :update, :show, :destroy]
  end  
  resources :consoles, only: [:show]
  resources :reviews 
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'signin', to: 'devise/sessions#new' 
    get 'signup', to: 'devise/registrations#new' 
    delete 'logout', to: 'devise/sessions#destroy'
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#welcome'
end
