# Display a list of all users
get '/users' do
  @users = User.all

  erb :'users/index'
end

# Form to create new user
get '/users/new' do
  erb :'users/_new_user'
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

# Specific user
get '/users/:id' do
  @user = User.find(params[:id])

  erb :'users/show'
end

# Edit a user
get '/users/:id/edit' do
end

# Delete a specific user
delete '/users/:id' do
end