def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def require_login
  redirect '/login' unless logged_in?
end

def validate_user(id)
  unless session[:user_id] == id.to_i
    redirect "/restricted"
  end
end
