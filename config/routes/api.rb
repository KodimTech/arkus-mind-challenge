Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :shared do
        resources :sessions, only: [:create]
      end
    end
  end
end