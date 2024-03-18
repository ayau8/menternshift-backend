RSpec.describe Api::V1::ExpertisesController, type: :controller do
  let(:user) { create(:user) }
  let(:expertises) { create_list(:expertise, 5, user: user) }
  let(:expertise_id) { expertises.last.id }

  describe "GET /users/:user_id/expertises" do
    context "when user's expertises exist" do
      before { expertises }
      it "returns the user's expertises" do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(200)
        users_response = JSON.parse(response.body)
        expect(users_response).not_to be_empty
        expect(users_response.size).to eq(5)
      end
    end

    context "when user's expertises do not exist" do
      let(:expertises) { [] }
      it "returns an empty array with a 404" do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("Expertises not found")
      end
    end
  end

  describe "GET /users/:user_id/expertises/:id" do
    context "when user's expertise exists" do
      it "returns the user's expertise" do
        get :show, format: :json, params: { user_id: user.id, id: expertise_id }
        expect(response.status).to eq(200)
        expertise_response = JSON.parse(response.body)
        expect(expertise_response["domain"]).to eq(expertises.last.domain)
        expect(expertise_response["years_of_experience"]).to eq(expertises.last.years_of_experience)
      end
    end

      context "when expertise does not exist" do
        it "returns a 404 for missing expertise" do
        get :show, format: :json, params: { user_id: user.id, id: 0 }
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("Expertise not found")
      end
    end
  end

  describe "POST /users/:user_id/expertises" do
    let(:expertise_params) { attributes_for(:expertise) }
    let(:invalid_expertise_params) { attributes_for(:expertise).merge(domain: nil) }

    context "when creating a new expertise with valid parameters" do
      it "creates the user's expertise" do
        post :create, format: :json, params: {  user_id: user.id, expertise: expertise_params }
        expect(response.status).to eq(201)
        create_expertise = JSON.parse(response.body)['expertise']
        expect(create_expertise['domain']).to eq(expertise_params[:domain])
        expect(create_expertise['years_of_experience']).to eq(expertise_params[:years_of_experience])
      end
    end

    context "when creating a new expertise with invalid parameters" do
      it "returns a 422 for invalid creation" do
        post :create, format: :json, params: {  user_id: user.id, expertise: invalid_expertise_params }
        expect(response.status).to eq(422)
        error_response = JSON.parse(response.body)['errors']
        expect(error_response['domain']).to include("can't be blank")
      end
    end
  end

  describe "PUT /users/:user_id/expertises/:id" do
    let(:expertise_params) { attributes_for(:expertise).merge(domain: "Project Management", years_of_experience: 6) }
    let(:invalid_expertise_params) { attributes_for(:expertise).merge(domain: nil) }

    context "when updating an existing expertise with valid parameters" do
      it "updates the record of the user's expertise" do
      put :update, format: :json, params: { user_id: user.id, id: expertise_id, expertise: expertise_params }
      expect(response.status).to eq(200)
      updated_response = JSON.parse(response.body)['expertise']
      expect(updated_response['domain']).to eq (expertise_params[:domain])
      end
    end

    context "when updating an existing expertise with invalid parameters" do
      it "does not update the record of the user's expertise" do
      put :update, format: :json, params: { user_id: user.id, id: expertise_id, expertise: invalid_expertise_params }
      expect(response.status).to eq(422)
      error_response = JSON.parse(response.body)['errors']
      expect(error_response['domain']).to include ("can't be blank")
      end
    end
  end

  describe "DELETE /users/:user_id/expertises/:id" do
    context "when the user's expertise exists" do
      it "deletes the user's expertise" do
        delete :destroy, format: :json, params: { user_id: user.id, id: expertise_id }
        expect(response.status).to eq(204)
      end
    end

    context "when the user's expertise does not exist" do
      it "returns a 404 for missing user's expertise" do
        delete :destroy, format: :json, params: { user_id: user.id, id: 0 }
        expect(response.status).to eq(404)
      end
    end
  end
end
