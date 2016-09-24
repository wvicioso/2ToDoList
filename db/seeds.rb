20.times { User.create(username: Faker::Internet.user_name,
                       email: Faker::Internet.email,
                       password: 'doom')}

User.all.each do |user|
  user.todo_lists << TodoList.create(name: Faker::Pokemon.name)
  user.todo_lists.first.tasks = Array.new(5) { Task.create(description: Faker::Space.agency)}
end