Rails.application.routes.draw do
  devise_for :users
  root 'journeys#index'
  resources :journeys do
    resources :journey_members, only: [:new, :create, :edit, :update]
    resources :journey_locations, only: %i[index new create destroy] do
      collection do
        post :update_ranking
      end
    end
    resources :journey_dates, only: %i[index new create destroy] do
      collection do
        post :update_ranking
      end
    end
    resources :journey_accommodations, only: %i[index new create destroy]
    resources :journey_activities, only: %i[index new create destroy] do
      collection do
        post :update_ranking
      end
    end
  end
  get 'journeys/:id/summary', to: 'journeys#summary', as: :summary
  get '/test', to: 'journeys#test'
  post '/search', to: 'users#search', as: :users_search
  post '/locations/search', to: 'locations#search', as: :locations_search
  post '/activities/search', to: 'activities#search', as: :activities_search
  get '/journeys/:id/has_voted', to: 'journeys#has_voted', as: :has_voted
  get '/journeys/:id/waitings', to: 'journeys#waitings', as: :waitings
  get '/journeys/:id/waitings_act', to: 'journeys#waitings_act', as: :waitings_act
  get '/journeys/:id/journey_locations/votes', to: 'journey_locations#votes', as: :locations_votes
  get '/journeys/:id/journey_dates/votes', to: 'journey_dates#votes', as: :dates_votes
  get '/journeys/:id/journey_accommodations/votes', to: 'journey_accommodations#votes', as: :accommodations_votes
  get '/journeys/:id/journey_activities/votes', to: 'journey_activities#votes', as: :activities_votes
  get '/journeys/:id/waitings_votes', to: 'journey_activities#waitings_votes', as: :waitings_votes
end
