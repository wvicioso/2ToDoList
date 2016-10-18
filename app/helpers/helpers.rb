def current_user
  User.find_by(id: session[:id])
end

def login(user, params)
  user.athenticate(params[:user][:password])
end
