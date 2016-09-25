def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def require_login
  redirect '/login' unless current_user
end