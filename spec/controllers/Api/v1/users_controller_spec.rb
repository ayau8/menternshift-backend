module Api
  module V1
    describe UsersController, type: :controller do
      context "#show" do
        it "returns a specifc user" do
          user = FactoryBot.create(:user)
          get :show, format: :json, params: { id: user.id }
          expect(response.status).to eq(200)
          user_response = JSON.parse(response.body)
          expect(user_response["first_name"]).to eq(user.first_name)
          expect(user_response["location"]).to eq(user.location)
          expect(user_response["guidances"]).to eq(user.guidances)
        end

        it "returns a 404 for missing user" do
          get :show, format: :json, params: { id: 0 }
          expect(response.status).to eq(404)
          error_response = JSON.parse(response.body)
          expect(error_response["error"]).to eq("User not found")
        end
      end 
    end
  end
end
