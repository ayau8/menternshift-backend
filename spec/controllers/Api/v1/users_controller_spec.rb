module Api
  module V1
    describe UsersController, type: :controller do
      context "#show" do
        let!(:user) {User.create(
          email: "menternshift@gmail.com",
          password: "123456",
          role: "mentor",
          first_name: "Alvin",
          middle_name: "Ken",
          last_name: "Yau",
          username: "Alvin Yau",
          location: "Tokyo",
          company: "Menternshift",
          job_title: "Software Engineer",
          bio: "Hello, My name is Alvin Yau",
          profile_img: "https://media.istockphoto.com/id/1142003972/photo/side-portrait-of-laughing-african-american-man-looking-up.jpg?s=612x612&w=0&k=20&c=fCiBfXI-PIdPACKbH3RdnYxq8ee5MZAhXKQN3I17j1Q=",
          guidances: [
            "Interview Coaching", 
            "Skill Development", 
            "Personal Development"
          ],
          languages: [
            "English", 
            "Japanese", 
            "Cantonese", 
            "Mandarin"
          ],
          skills: [],
          is_available: true,
          timezone: "Japan Standard Time (PST) UTC+09:00",
          social_platforms: {
            "LinkedIn" => "https://www.linkedin.com/in/alvin-yau/",
            "Behance" => "",
            "Instagram" => "",
            "Portfolio" => "",
        })}
        
        it "returns a specifc user" do
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
