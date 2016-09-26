# Display a list of all users
get '/users' do
  @users = User.all

  erb :'users/index'
end

# Form to create new user
get '/users/new' do
  erb :'users/_new_user'
end

# GET - User login page
get '/users/login' do
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    session[:login] = true
    erb :'users/_login'
  end
end

# POST - User login page
post '/users/login' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Invalid email or password"]
    erb :'users/_login', locals: { errors: @errors }
  end
end

# Post after new user is created
post '/users' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages

    erb :'users/_new_user'
  end
end

# Log a user out of a session
get '/users/logout' do
  require_user
  session.clear
  redirect '/'
end


# Specific user
get '/users/:id' do
  @user = User.find(params[:id])
  @lists = @user.lists
  require_user
  if !logged_in?
    @errors = ["You must be logged in to view this page"]
  else
    erb :'users/show'
  end
end

# Edit a user
get '/users/:id/edit' do
end

# Delete a specific user
delete '/users/:id' do
end