Rails.application.routes.draw do
  root to: "home#index"
  resources :courses
  resources :reels
  resources :videos, only: [:new, :create, :index]
  get "text_to_speech", to: "text_to_speech#text_to_speech"
  get "text_to_speech/index"
  get "integrations", to: "integrations#index"
  get "fb_integration", to: "integrations#create"
  get "callback_integration", to: "integrations#facebook_callback"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"
  get "/auth/facebook/callback", to: "integrations#facebook_callback"
  get "share_post", to: "integrations#post_content"
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end
