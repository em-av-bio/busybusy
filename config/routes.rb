Rails.application.routes.draw do
  devise_for :users
  root 'journeys#index'
  resources :journeys
end
