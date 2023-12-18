Rails.application.routes.draw do
  namespace :api do
    resources :samples, only: [:index, :show, :create, :update]
  end 
end
