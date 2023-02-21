# frozen_string_literal: true

Rails.application.routes.draw do
  get '/dashboard', to: 'shared/dashboards#index'

  scope module: :shared do
    resource :sessions, only: [] do
      get :new, path: :sign_in
      post :create, path: :sign_in
      delete :sign_out, to: 'sessions#destroy'
    end

    resources :profiles, only: [:show, :edit, :update]
  end
end
