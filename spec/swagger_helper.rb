# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Menternshift API V1',
        version: 'v1'
      },
      components: {
        schemas: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              encrypted_password: { type: :string },
              reset_password_token: { type: :string },
              reset_password_sent_at: { type: :string, format: :datetime },
              remember_created_at: { type: :string, format: :datetime },
              created_at: { type: :string, format: :datetime },
              updated_at: { type: :string, format: :datetime },
              role: { type: :string },
              first_name: { type: :string },
              last_name: { type: :string },
              username: { type: :string },
              location: { type: :string },
              company: { type: :string },
              job_title: { type: :string },
              profile_img: { type: :string, format: :text },
              bio: { type: :string, format: :text },
              guidances: {
                type: :array,
                items: {
                  type: :string,
                  format: :text
                }
              },
              languages: {
                type: :array,
                items: {
                  type: :string,
                  format: :text
                }
              },
              skills: {
                type: :array,
                items: {
                  type: :string,
                  format: :text
                }
              },
              is_available: { type: :boolean },
              timezone: { type: :string },
              social_platforms: { type: :string, format: :hstore },
              project_area_id: { type: :integer }
            },
            required: %w[email encrypted_password created_at updated_at]
          },
          expertise: {
            type: :object,
            properties: {
              domain: { type: :string },
              years_of_experience: { type: :integer },
              user_id: { type: :integer },
              created_at: { type: :string, format: :datetime },
              updated_at: { type: :string, format: :datetime }
            },
            required: %w[user_id created_at updated_at]
          },
          experience: {
            type: :object,
            properties: {
              company: { type: :string },
              job_title: { type: :string },
              description: { type: :string, format: :text },
              start_date: { type: :string, format: :date },
              end_date: { type: :string, format: :date },
              user_id: { type: :integer },
              created_at: { type: :string, format: :datetime },
              updated_at: { type: :string, format: :datetime }
            },
            required: %w[user_id created_at updated_at]
          }
        }
      },
      paths: {},
      servers: [
        {
          url: 'http://localhost:3000/',
          variables: {
            defaultHost: {
              default: 'localhost:3000'
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
