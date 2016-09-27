8.times {

  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: 'password'
  )

  User.all.each do |user|
    user.lists.create(
      title: Faker::Hacker.adjective
    )
  end

  List.all.each do |list|
    list.tasks.create(
      description: Faker::Hacker.say_something_smart,
      user_id: list.user_id,
      marked_as_complete: false
    )
  end
}
