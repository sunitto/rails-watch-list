Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "lists#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
    resources :bookmarks, only: [:destroy]
  # root "posts#index"
end
