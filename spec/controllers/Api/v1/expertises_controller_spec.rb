module Api
  module V1
    describe ExpertisesController, type: :controller do
      context "#show" do
        it "returns the expertise of the user" do 
          user = FactoryBot.create(:user)
          expertise = FactoryBot.create(:expertise, user: user)
          get :show, format: :json, params: { user_id: user.id, id: expertise.id }
          expect(response.status).to eq(200)
          expertise_response = JSON.parse(response.body)
          expect(expertise_response["domain"]).to eq(expertise.domain)
          expect(expertise_response["years_of_experience"]).to eq(expertise.years_of_experience)
        end

        it "returns a 404 for missing expertise" do
          user = FactoryBot.create(:user)
          get :show, format: :json, params: { user_id: user.id, id: 0 }
          expect(response.status).to eq(404)
          error_response = JSON.parse(response.body)
          expect(error_response["error"]).to eq("Expertise not found")
        end 
      end
    end
  end
end
