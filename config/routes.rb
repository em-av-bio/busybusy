Rails.application.routes.draw do
  devise_for :users
  root 'journeys#index'
  resources :journeys do
    resources :journey_members, only: [:edit, :new, :create]
    resources :journey_locations, only: [:index, :create]
    resources :journey_dates, only: [:index, :create]
    resources :journey_accommodations, only: [:index, :create]
    resources :journey_activities, only: [:index, :create]
  end

  get '/test', to: 'journeys#test'
end
