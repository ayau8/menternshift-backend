RSpec.describe Api::V1::UsersController, type: :controller do
  let(:users) { create_list(:user, 10) }
  let(:user_id) { users.last.id }
  let(:expertises) { create_list(:expertise, 3, user_id: user_id) }
  
  describe "GET /users" do
    context "when users exist" do
      before { users }
      it "returns a list of users" do
        get :index, format: :json
        expect(response.status).to eq(200)
        users_response = JSON.parse(response.body)
        expect(users_response).not_to be_empty
        expect(users_response.size).to eq(10)
      end
    end
    
    context "when users do not exist" do
      let(:users) { [] }
      it "returns an empty array with a 404" do
        get :index, format: :json
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("Users not found")
      end
    end
  end
  
  describe "GET /users/:id" do
    context "when a user exists" do
      before { expertises }
      it "returns a specific user" do     
        get :show, format: :json, params: { id: user_id }
        expect(response.status).to eq(200)
        user_response = JSON.parse(response.body)
        expect(user_response["first_name"]).to eq(users.last.first_name)
        expect(user_response["location"]).to eq(users.last.location)
        expect(user_response["guidances"]).to eq(users.last.guidances)
      end

      it "returns associated expertises" do
        expect(users.last.expertises).not_to be_empty
        expect(users.last.expertises.size).to eq(3)
      end
    end

    context "when a user does not exist" do
      it "returns a 404 for missing user" do
        get :show, format: :json, params: { id: 0 }
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("User not found")
      end
    end
  end 

  describe "POST /users" do 
    let(:user_params) { attributes_for(:user) }
    let(:invalid_user_params) { attributes_for(:user).merge(email: nil) }
    
    context "when the parameters are valid" do
      it "creates a user" do 
        post :create, format: :json, params: { user: user_params }
        expect(response.status).to eq(201)
        user_response = JSON.parse(response.body)["user"]
        expect(user_response["first_name"]).to eq(user_params[:first_name])
        expect(user_response["location"]).to eq(user_params[:location])
        expect(user_response["guidances"]).to eq(user_params[:guidances])
      end
    end

    context "when the parameters are not valid" do
      it "does not create a user" do 
        post :create, format: :json, params: { user: invalid_user_params }
        expect(response.status).to eq(422)
        error_response = JSON.parse(response.body)["errors"]
        expect(error_response["email"]).to include("can't be blank")
      end
    end
  end
  
  describe "PUT /users/:id" do
    let(:user_params) { attributes_for(:user).merge(email: "testing@gmail.com") }
    let(:invalid_user_params) { attributes_for(:user).merge(email: nil) }

    context "when updating an existing user with valid parameters" do 
      it "updates the record of a user" do
        put :update, format: :json, params: { id: user_id, user: user_params }
        expect(response.status).to eq(200)
        updated_response = JSON.parse(response.body)["user"]
        expect(updated_response["email"]).to eq("testing@gmail.com")
      end
    end

    context "when updating an existing user with invalid parameters" do 
      it "does not update the record of a user" do
        put :update, format: :json, params: { id: user_id, user: invalid_user_params }
        expect(response.status).to eq(422)
        error_response = JSON.parse(response.body)["errors"]
        expect(error_response["email"]).to include("can't be blank")
      end
    end
  end 

  describe "DESTROY /users/:id" do
    context "when the specific user exists" do
      it "deletes a user" do
        delete :destroy, format: :json, params: { id: user_id }
        expect(response.status).to eq(204)
        expect(User.exists?(user_id)).to be_falsey
        expect(Expertise.where(user_id: user_id)).to be_empty
      end
    end

    context "when the specifc user does not exist" do
      it "returns a 404 for missing user" do
        delete :destroy, format: :json, params: { id: 0 }
        expect(response.status).to eq(404)
      end
    end
  end
end
