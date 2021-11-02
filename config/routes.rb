Rails.application.routes.draw do
  resources :customers do
    resources :tea_subscriptions, only: [:create, :update, :index]
  end
end
