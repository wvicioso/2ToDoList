def owner?(task)
  current_user == task.user if logged_in?
end