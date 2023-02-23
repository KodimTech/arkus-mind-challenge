Rails.application.routes.draw do
  namespace :admin do
    resources :accounts
    resources :users
  end
end