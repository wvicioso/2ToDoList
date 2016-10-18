User.create(username: "will",
            password: "password")
User.create(username: "mike",
            password: "password")
User.create(username: "gill",
            password: "password")


User.all.each do |user|
  user.lists << List.create(name: Faker::App.name)
  user.lists.first.tasks = Array.new(5) { Task.create(description: Faker::Beer.name)}
end
