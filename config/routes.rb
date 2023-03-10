# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: 'shared/sessions#new'

  draw(:api)
  draw(:shared)

  match '*path' => redirect('/'), via: :get
end
