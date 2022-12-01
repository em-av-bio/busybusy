Rails.application.routes.draw do
  devise_for :users
  root 'journeys#index'
  resources :journeys do
    resources :journey_members, only: [:new, :create, :edit, :update]
    resources :journey_locations, only: [:index, :new, :create]
    resources :journey_dates, only: [:index, :new, :create]
    resources :journey_accommodations, only: [:index, :new, :create]
    resources :journey_activities, only: [:index, :new, :create]
  end
  get 'journeys/:id/summary', to: 'journeys#summary', as: :summary
  get '/test', to: 'journeys#test'
end
