Rails.application.routes.draw do
  get 'lists/index'
  get 'movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: 'lists#index'
  # resources :movies, only: %i[index show]
  resources :lists , except: :index do
    resources :bookmarks, only: %i[index show new create]
  end

  # Defines the root path route ("/")
end
