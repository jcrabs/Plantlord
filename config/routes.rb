Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "offers#index"
  resources :offers do
    post "/:id", to: "bookings#create"
  end
  get "/offers/:offer_id/new_booking", to: "bookings#new", as: "new_booking"
  get "/listings", to: "listings#list", as: "listings"
  get "/subscriptions/", to: "subscriptions#list", as: "subscriptions"
end
