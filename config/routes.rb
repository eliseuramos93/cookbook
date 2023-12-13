Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :recipe_types, only: %i[new create index show]
  resources :recipes, only: %i[new create edit update show] do
    resources :favorite_recipes, only: %i[new create]
  end
  resources :recipe_lists, only: %i[new create show]
  

  namespace :api do
    namespace :v1 do
      resources :recipes, only: %i[index]
    end
  end
end
