require 'swagger_helper'

RSpec.describe 'api/v1/shared/sessions', type: :request do
  path '/api/v1/shared/sessions' do
    post 'Creates session' do
      tags 'Sessions'

      produces 'application/json'

      parameter name: :session, in: :path, schema: {
        type: :object,
        properties: {
          email: { type: :string }
        }
      }
      # parameter name: "#{[:session]}#{[:email]}", in: :path, type: :string, description: 'User email'
      # parameter name: [:session][:password], in: :path, type: :string

      response '200', 'User found' do
        schema type: :object,
               properties: {
                 email: { type: :string, description: 'User Email' },
                 first_name: { type: :string, description: 'User first name' },
                 last_name: { type: :string, description: 'User last name' },
                 full_name: { type: :string, description: 'User full name' },
                 jwt: { type: :string, description: 'User JWT' }
               }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: '' #JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end

    end
  end
end
