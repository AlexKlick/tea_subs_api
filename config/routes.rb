Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :customers do
        resources :tea_subscriptions, only: [:create, :update, :index]
      end
    end
  end
end
