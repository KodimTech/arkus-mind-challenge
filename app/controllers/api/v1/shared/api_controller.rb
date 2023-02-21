module Api
  module V1
    module Shared
      class ApiController < ApplicationController
        protect_from_forgery with: :exception

        helper_method :validate_jwt_expiration

        private

        def validate_jwt_expiration(token)
          Utilities::Jwt.validate_expiration(token)
        end
      end
    end
  end
end