Rails.application.routes.draw do
  root to: "home#index"
  resources :courses do
    member do
      get "script", to: "courses#script"
      get "editor", to: "courses#editor"
    end

  end

  resources :reels
  resources :videos, only: [:new, :create, :index]
  get "text_to_speech", to: "text_to_speech#text_to_speech"
  get "text_to_speech/index"
  get "integrations", to: "integrations#index"
  get "callback_integration", to: "integrations#facebook_callback"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "share_post", to: "integrations#post_content"
  get "disconnect_facebook", to: "integrations#destroy_session"
  get "/audio/save", to: "record_audio#show"
  get "record_audio", to: "record_audio#new"
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  resources :users do
    resources :courses do
      member do
        get "script", to: "courses#script"
        get "editor", to: "courses#editor"
      end
      resources :templates
    end
  end
end
