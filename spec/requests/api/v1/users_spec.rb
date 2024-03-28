require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users' do

    get('Returns a list of users') do
      tags 'Users'
      response(200, 'Successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Users not found') do
        run_test!
      end
    end

    post('Creates a user') do
      tags 'Users'
      response(201, 'Successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/user' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, "Can't be blank") do
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'ID of the user that needs to be fetched'

    get('Returns a specific user') do
      tags 'Users'
      response(200, 'Successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'User not found') do
        run_test!
      end
    end

    put('Updates the record of a user') do
      tags 'Users'
      response(200, 'Successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/user' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, "Can't be blank") do
        run_test!
      end
    end

    delete('Deletes a user') do
      tags 'Users'
      response(204, 'Successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'User not found') do
        run_test!
      end
    end
  end
end
