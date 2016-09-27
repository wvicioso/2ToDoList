def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def yourself?(user_id)
  current_user.id == user_id if logged_in?
end