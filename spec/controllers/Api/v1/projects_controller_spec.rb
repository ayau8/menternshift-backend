RSpec.describe Api::V1::ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:projects) { create_list(:project, 5, user: user) }
  let(:project_id) { projects.last.id }

  describe "GET /users/:user_id/projects" do
    context "when user's projects exist" do
      before { projects }
      it "returns the user's projects" do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(200)
        users_response = JSON.parse(response.body)
        expect(users_response).not_to be_empty
        expect(users_response.size).to eq(5)
      end
    end

    context "when user's projects do not exist" do
      let(:projects) { [] }
      it "returns an empty array with a 404" do
        get :index, format: :json, params: { user_id: user.id }
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("Projects not found")
      end
    end
  end

  describe "GET /users/:user_id/projects/:id" do
    context "when user's project exists" do
      it "returns the user's project" do
        get :show, format: :json, params: { user_id: user.id, id: project_id }
        expect(response.status).to eq(200)
        project_response = JSON.parse(response.body)
        expect(project_response["name"]).to eq(projects.last.name)
        expect(project_response["description"]).to eq(projects.last.description)
        expect(project_response["image_url"]).to eq(projects.last.image_url)
        expect(project_response["start_date"].to_s).to eq(projects.last.start_date.to_s)
        expect(project_response["end_date"].to_s).to eq(projects.last.end_date.to_s)
        expect(project_response["duration"]).to eq(projects.last.duration)
        expect(project_response["progress"]).to eq(projects.last.progress)
        expect(project_response["skills"]).to eq(projects.last.skills)
      end
    end

    context "when project does not exist" do
      it "returns a 404 for missing project" do
        get :show, format: :json, params: { user_id: user.id, id: 0 }
        expect(response.status).to eq(404)
        error_response = JSON.parse(response.body)
        expect(error_response["error"]).to eq("Project not found")
      end
    end
  end

  describe "POST /users/:user_id/projects" do
    let(:project_params) { attributes_for(:project) }
    let(:invalid_project_params) { attributes_for(:project).merge(name: nil) }

    context "when creating a new project with valid parameters" do
      it "creates the user's project" do
        post :create, format: :json, params: { user_id: user.id, project: project_params }
        expect(response.status).to eq(201)
        create_project = JSON.parse(response.body)['project']
        expect(create_project['name']).to eq(project_params[:name])
        expect(create_project['description']).to eq(project_params[:description])
        expect(create_project['image_url']).to eq(project_params[:image_url])
        expect(create_project['start_date'].to_s).to eq(project_params[:start_date].to_s)
        expect(create_project['end_date'].to_s).to eq(project_params[:end_date].to_s)
        expect(create_project['duration']).to eq(project_params[:duration])
        expect(create_project['progress']).to eq(project_params[:progress])
        expect(create_project['skills']).to eq(project_params[:skills])
      end
    end

    context "when creating a new project with invalid parameters" do
      it "returns a 422 for invalid creation" do
        post :create, format: :json, params: { user_id: user.id, project: invalid_project_params }
        expect(response.status).to eq(422)
        error_response = JSON.parse(response.body)['errors']
        expect(error_response['name']).to include("can't be blank")
      end
    end
  end

  describe "PUT /users/:user_id/projects/:id" do
    let(:project_params) { attributes_for(:project).merge(name: "Example Project") }
    let(:invalid_project_params) { attributes_for(:project).merge(name: nil) }

    context "when updating an existing project with valid parameters" do
      it "updates the record of the user's project" do
      put :update, format: :json, params: { user_id: user.id, id: project_id, project: project_params }
      expect(response.status).to eq(200)
      updated_response = JSON.parse(response.body)['project']
      expect(updated_response['name']).to eq(project_params[:name])
      end
    end

    context "when updating an existing project with invalid parameters" do
      it "does not update the record of the user's project" do
      put :update, format: :json, params: { user_id: user.id, id: project_id, project: invalid_project_params }
      expect(response.status).to eq(422)
      error_response = JSON.parse(response.body)['errors']
      expect(error_response['name']).to include("can't be blank")
      end
    end
  end

  describe "DELETE /users/:user_id/projects/:id" do
    context "when the user's project exists" do
      it "deletes the user's project" do
        delete :destroy, format: :json, params: { user_id: user.id, id: project_id }
        expect(response.status).to eq(204)
      end
    end

    context "when the user's project does not exist" do
      it "returns a 404 for missing user's project" do
        delete :destroy, format: :json, params: { user_id: user.id, id: 0 }
        expect(response.status).to eq(404)
      end
    end
  end
end
