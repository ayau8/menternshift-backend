require 'swagger_helper'

RSpec.describe 'api/v1/projects', type: :request do

  path '/api/v1/users/{user_id}/projects' do
    parameter name: 'user_id', in: :path, type: :string, description: 'ID of user that needs to be fetched'

    get("Returns the user's projects") do
      tags 'Projects'
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

      response(404, 'Projects not found') do
        run_test!
      end
    end

    post("Creates the user's project") do
      tags 'Projects'
      response(201, 'Successful') do
        let(:user_id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/project' }
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

  path '/api/v1/users/{user_id}/projects/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'ID of the user that needs to be fetched'
    parameter name: 'id', in: :path, type: :string, description: 'ID of the project that needs to be fetched'

    get("Returns the user's project") do
      tags 'Projects'
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

      response(404, 'Project not found') do
        run_test!
      end
    end

    put("Updates the record of the user's project") do
      tags 'Projects'
      response(200, 'Successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/project' }

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

    delete("Deletes the user's project") do
      tags 'Projects'
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

      response(404, 'Project not found') do
        run_test!
      end
    end
  end
end
