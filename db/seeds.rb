10.times { User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: "pass") }

10.times { List.create(name: Faker::Hipster.sentence, user_id: (rand(9) + 1)) }


50.times { Task.create(description: Faker::Lorem.sentence, list_id: (rand(9) +1)) }
