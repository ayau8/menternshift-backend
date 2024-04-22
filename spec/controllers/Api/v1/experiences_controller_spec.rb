RSpec.describe Api::V1::ExperiencesController, type: :controller do
  let(:user) { create(:user) }
  let(:experiences) { create_list(:experience, 5, user: user) }
  let(:experience_id) { experiences.last.id }

  describe "GET /users/:user_id/experiences" do
    context "when user's experiences exist" do
      before { experiences }
      it "returns the user's experiences" do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(200)
        users_response = JSON.parse(response.body)
        expect(users_response).not_to be_empty
        expect(users_response.size).to eq(5)
      end
    end

    context "when user's experiences do not exist" do
      let(:experiences) { [] }
      it "returns an empty array with a 404" do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("Experiences not found")
      end
    end
  end

  describe "GET /users/:user_id/experiences/:id" do
    context "when user's experience exists" do
      it "returns the user's experience" do
        get :show, format: :json, params: { user_id: user.id, id: experience_id }
        expect(response.status).to eq(200)
        experience_response = JSON.parse(response.body)
        expect(experience_response["company"]).to eq(experiences.last.company)
        expect(experience_response["job_title"]).to eq(experiences.last.job_title)
        expect(experience_response["description"]).to eq(experiences.last.description)
        expect(experience_response["start_date"]).to eq(experiences.last.start_date)
        expect(experience_response["end_date"]).to eq(experiences.last.end_date)
      end
    end

      context "when experience does not exist" do
        it "returns a 404 for missing experience" do
        get :show, format: :json, params: { user_id: user.id, id: 0 }
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("Experience not found")
      end
    end
  end

  describe "POST /users/:user_id/experiences" do
    let(:experience_params) { attributes_for(:experience) }
    let(:invalid_experience_params) { attributes_for(:experience).merge(company: nil) }

    context "when creating a new experience with valid parameters" do
      it "creates the user's experience" do
        post :create, format: :json, params: {  user_id: user.id, experience: experience_params }
        expect(response.status).to eq(201)
        create_experience = JSON.parse(response.body)['experience']
        expect(create_experience['company']).to eq(experience_params[:company])
        expect(create_experience['job_title']).to eq(experience_params[:job_title])
        expect(create_experience['description']).to eq(experience_params[:description])
        expect(create_experience['start_date']).to eq(experience_params[:start_date])
        expect(create_experience['end_date']).to eq(experience_params[:end_date])
      end
    end

    context "when creating a new experience with invalid parameters" do
      it "returns a 422 for invalid creation" do
        post :create, format: :json, params: {  user_id: user.id, experience: invalid_experience_params }
        expect(response.status).to eq(422)
        error_response = JSON.parse(response.body)['errors']
        expect(error_response['company']).to include("can't be blank")
      end
    end
  end

  describe "PUT /users/:user_id/experiences/:id" do
    let(:experience_params) { attributes_for(:experience).merge(company: "Example Company") }
    let(:invalid_experience_params) { attributes_for(:experience).merge(company: nil) }

    context "when updating an existing experience with valid parameters" do
      it "updates the record of the user's experience" do
      put :update, format: :json, params: { user_id: user.id, id: experience_id, experience: experience_params }
      expect(response.status).to eq(200)
      updated_response = JSON.parse(response.body)['experience']
      expect(updated_response['company']).to eq (experience_params[:company])
      end
    end

    context "when updating an existing experience with invalid parameters" do
      it "does not update the record of the user's experience" do
      put :update, format: :json, params: { user_id: user.id, id: experience_id, experience: invalid_experience_params }
      expect(response.status).to eq(422)
      error_response = JSON.parse(response.body)['errors']
      expect(error_response['company']).to include ("can't be blank")
      end
    end
  end

  describe "DELETE /users/:user_id/experiences/:id" do
    context "when the user's experience exists" do
      it "deletes the user's experience" do
        delete :destroy, format: :json, params: { user_id: user.id, id: experience_id }
        expect(response.status).to eq(204)
      end
    end

    context "when the user's experience does not exist" do
      it "returns a 404 for missing user's experience" do
        delete :destroy, format: :json, params: { user_id: user.id, id: 0 }
        expect(response.status).to eq(404)
      end
    end
  end
end
