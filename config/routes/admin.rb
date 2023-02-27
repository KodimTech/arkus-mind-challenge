Rails.application.routes.draw do
  namespace :admin do
    resources :accounts do
      resources :teams do
        resources :team_users, only: %i[new create destroy]
      end
    end

    resources :users
  end
end