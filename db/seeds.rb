users = []

10.times {
  users << User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'password')
}

lists = []

20.times {
  
}

tasks = []

50.times {
  tasks << Task.create!(
    name: (Faker::Hacker.verb + " " + Faker::Hacker.noun + " " + "for " + Faker::App.author).capitalize
  )
}
