Rails.application.routes.draw do
  root to: "home#index"
  resources :courses
  resources :reels
  resources :videos, only: [:new, :create]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end
