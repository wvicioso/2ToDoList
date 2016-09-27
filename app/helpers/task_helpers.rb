def owner?(ownable)
  return false if ownable == nil
  current_user == ownable.user if logged_in?
end