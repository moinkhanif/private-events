Rails.application.routes.draw do
  resources :users do
    resources :events
  end
  resources :events
  resources :sessions, only: %i[create new destroy]
  root to: 'users#index'
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
end
