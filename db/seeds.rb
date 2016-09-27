users =[]
70.times {
          users << User.create!(username: Faker::Internet.user_name,
                       email: Faker::Internet.email,
                       password: 'test'
          )
}
lists = []
60.times {
          lists << List.create!(title: Faker::Book.title,
                       user: users.sample,
                       created_at: Faker::Date.backward(1000)
          )
}
statuses = %w(complete incomplete)
300.times {
          Task.create!(description: Faker::Hacker.say_something_smart,
                        status: statuses.sample,
                        list: lists.sample
          )
}
