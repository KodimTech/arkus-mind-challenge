module Api
  module V1
    module Shared
      class SessionsController < Api::V1::Shared::ApiController
        skip_before_action :verify_authenticity_token

        def create
          if user.present?
            token = Utilities::Jwt.generate(user: user)
            render json: payload(token), status: :ok
          else
            render json: { message: 'Wrong email or password' }, status: :unauthorized
          end
        end

        private

        def user
          @user ||= login(params[:session][:email], params[:session][:password])
        end

        def payload(token)
          {
            id: user.id,
            email: user.email,
            first_name: user.first_name,
            last_name: user.last_name,
            full_name: user.full_name,
            jwt: token
          }
        end
      end
    end
  end
end