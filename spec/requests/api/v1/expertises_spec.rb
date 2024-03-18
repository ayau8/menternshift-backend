require 'swagger_helper'

RSpec.describe 'api/v1/expertises', type: :request do

  path '/api/v1/users/{user_id}/expertises' do
    parameter name: 'user_id', in: :path, type: :string, description: 'ID of user that needs to be fetched'

    get("Returns the user's expertises") do
      tags 'Expertises'
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

      response(404, 'Expertises not found') do
        run_test!
      end
    end

    post("Creates the user's expertise") do
      tags 'Expertises'
      response(201, 'Successful') do
        let(:user_id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            domain: { type: :string },
            years_of_experience: { type: :integer }
          }
        }

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

  path '/api/v1/users/{user_id}/expertises/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'ID of the user that needs to be fetched'
    parameter name: 'id', in: :path, type: :string, description: 'ID of the expertise that needs to be fetched'

    get("Returns the user's expertise") do
      tags 'Expertises'
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

      response(404, 'Expertise not found') do
        run_test!
      end
    end

    put("Updates the record of the user's expertise") do
      tags 'Expertises'
      response(200, 'Successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            domain: { type: :string },
            years_of_experience: { type: :integer }
          }
        }

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

    delete("Deletes the user's expertise") do
      tags 'Expertises'
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

      response(404, 'Expertise not found') do
        run_test!
      end
    end
  end
end
