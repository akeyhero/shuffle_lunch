Rails.application.routes.draw do
  resources :participations, only: %i(index show new create destroy)
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
