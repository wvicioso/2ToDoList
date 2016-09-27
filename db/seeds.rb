u = User.create!(username: "user1", email: "user1@me.com", password:"password")

u2 = User.create!(username: "bono", email: "bono@me.com", password:"password")

list2= List.create!(title:"Upcoming", user_id: u2.id)

task1 = Task.create!(description:"Sign deal", list_id: list2.id)
task2 = Task.create!(description:"Meet with band", list_id: list2.id)