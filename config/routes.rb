Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, only: []

  resources :posts, only: [:index, :create, :update, :show, :destroy]

  post '/login', to: 'sessions#create', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
end
