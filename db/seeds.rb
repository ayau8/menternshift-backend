#Creating the users
puts "--------------------------------------"
puts "Creating the users"
puts "Creating mentors"

area = ProjectArea.new(
  design: "Design placeholder",
  frontend: "FE placeholder",
  backend: "BE placeholder",
  devops: "DevOps placeholder",
  qa: "QA placeholder",
  project_manager: "PM placeholder",
  project_id: project.id
)
area.save!

#mentors
alvin = User.new(
  email: "ayaualvin@gmail.com",
  password: "123456",
  role: "mentor",
  first_name: "Alvin",
  middle_name: "Ken",
  last_name: "Yau",
  username: "Alvinyau",
  location: "Tokyo",
  company: "Menternshift",
  job_title: "Software Engineer",
  bio: "Hello, My name is Alvin Yau",
  project_area_id: area.id
  )
  alvin.save!
  
  
project = Project.new(
  name: "Mentorship",
  description: "Facilitate the formation of project teams",
  image_url: "placeholder",
  start_date: "01/01/2024",
  end_date:"31/03/2024",
  duration: "3",
  progress: "In Progress",
  skills: ["placeholder1", "placeholder2"],
  user_id: alvin.id
)
project.save!





