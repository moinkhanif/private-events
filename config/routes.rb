Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: [:create, :new, :destroy]
  root to: 'users#index'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
end
