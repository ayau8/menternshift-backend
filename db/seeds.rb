# Cleaning the database
puts "--------------------------------------"
puts "Clearing DB"

#Destroying the database
Expertise.destroy_all
User.destroy_all
Project.destroy_all

#Creating the users
puts "--------------------------------------"
puts "Creating the users"
puts "--------------------------------------"
puts "Creating mentors"
puts "--------------------------------------"

#mentors
 first_user = User.create!(
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
    "Portfolio" => ""
  },
  )

puts "Creating Expertise"
puts "--------------------------------------"
#Expertise
Expertise.create!(
  domain: "Product Design",
  years_of_experience: 5,
  user_id: first_user.id
)

puts "Creating Project"
puts "--------------------------------------"
#Project
Project.create!(
  name: "Example Project",
  description: "This is an example project.",
  user_id: first_user.id
)
