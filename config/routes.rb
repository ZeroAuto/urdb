Urdb::Application.routes.draw do
  resources :movies do
    resources :showtimes
  end

  resources :stars, only: [:show]

  root 'movies#index'
end
