Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  devise_for :users
  resources :posts, only: %i[ show new create ]
end
