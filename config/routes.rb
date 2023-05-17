Rails.application.routes.draw do
  get 'integrations/index'
  root to: "home#index"
  resources :courses
  resources :reels
  resources :videos, only: [:new, :create, :index]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end
