require 'swagger_helper'

RSpec.describe 'api/v1/experiences', type: :request do

  path '/api/v1/users/{user_id}/experiences' do
    parameter name: 'user_id', in: :path, type: :string, description: 'ID of user that needs to be fetched'

    get("Returns the user's experiences") do
      tags 'Experiences'
      response(200, 'Successful') do
        let(:user_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'Experiences not found') do
        run_test!
      end
    end

    post("Creates the user's experience") do
      tags 'Experiences'
      response(201, 'Successful') do
        let(:user_id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/experience' }
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

  path '/api/v1/users/{user_id}/experiences/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'ID of the user that needs to be fetched'
    parameter name: 'id', in: :path, type: :string, description: 'ID of the experience that needs to be fetched'

    get("Returns the user's experience") do
      tags 'Experiences'
      response(200, 'Successful') do
        let(:user_id) { '123' }
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

      response(404, 'Experience not found') do
        run_test!
      end
    end

    put("Updates the record of the user's experience") do
      tags 'Experiences'
      response(200, 'Successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/experience' }

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

    delete("Deletes the user's experience") do
      tags 'Experiences'
      response(204, 'Successful') do
        let(:user_id) { '123' }
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

      response(404, 'Experience not found') do
        run_test!
      end
    end
  end
end
