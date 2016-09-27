users = 5.times {User.create(username: Faker::GameOfThrones.character,
                     email: Faker::Internet.safe_email,
                     password: "123"
                    )}

lists = 20.times {List.create(name: Faker::Company.name,
                      user_id: rand(1..5)
  )}

tasks = 100.times {Task.create(description:     Faker::Company.catch_phrase,
                       completed: [true, false].sample,
                       list_id: rand(1..20)
  )}
