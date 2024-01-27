# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :samples, only: [:index, :show, :create, :update]
    end
  end
end
