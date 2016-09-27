def owner?(ownable)
  current_user == ownable.user if logged_in?
end