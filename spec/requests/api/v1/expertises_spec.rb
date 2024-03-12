require 'swagger_helper'

RSpec.describe 'api/v1/expertises', type: :request do

  path '/api/v1/users/{user_id}/expertises' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list expertises') do
      tags 'Expertises'
      response(200, 'successful') do
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
    end

    post('create expertise') do
      tags 'Expertises'
      response(200, 'successful') do
        let(:user_id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            domain: { type: :string },
            years_of_experience: { type: :integer }
          },
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
    end
  end

  path '/api/v1/users/{user_id}/expertises/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show expertise') do
      tags 'Expertises'
      response(200, 'successful') do
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
    end

    patch('update expertise') do
      tags 'Expertises'
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            domain: { type: :string },
            years_of_experience: { type: :integer }
          },
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
    end

    put('update expertise') do
      tags 'Expertises'
      response(200, 'successful') do
        let(:user_id) { '123' }
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            domain: { type: :string },
            years_of_experience: { type: :integer }
          },
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
    end

    delete('delete expertise') do
      tags 'Expertises'
      response(200, 'successful') do
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
    end
  end
end
