# Cleaning the database
puts "--------------------------------------"
puts "Clearing DB"

#Destroying the database
User.destroy_all

#Creating the users
puts "--------------------------------------"
puts "Creating the users"
puts "--------------------------------------"
puts "Creating mentors"
puts "--------------------------------------"

#mentors
User.create!(
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
  },
  )

