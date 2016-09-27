# List of all lists for a specific user
get '/users/:user_id/lists' do
  @user = User.find(params[:user_id])
  @list = @user.lists

  erb :'lists/index'
end

# Returns form for creating a new to do list
get '/users/:user_id/lists/new' do
  @user = User.find(params[:user_id])

  erb :'lists/_new_list'
end

# POST - Create a new list that belongs to currently logged in user
post '/users/:user_id/lists' do
  @user = User.find(params[:user_id])
  @list = @user.lists.new(params[:list])
  @task = @user.tasks.new(params[:task])
  binding.pry
  if @list.save && @task.save
    redirect '/users/#{@user.id}/lists'
  else
    erb :'lists/index'
  end
end

# Display a specific list that belongs to a specific user
get '/users/:user_id/lists/:id' do
  @user = User.find(params[:user_id])
  @list = List.find(params[:id])
  binding.pry
  # @tasks = @list.tasks

  erb :'lists/show'
end

# Return a form for editing a list
get '/users/:user_id/lists/:id/edit' do
end