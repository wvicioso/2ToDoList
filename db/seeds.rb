8.times {

  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'password'
    )

  User.all.each do |user|
    user.lists.create(
      title: Faker::Hacker.ingverb
      )
  end

  List.all.each do |list|
    list.tasks.create(
      task_description: Faker::Hacker.say_something_smart,
      marked_as_complete: false
      )
  end

}