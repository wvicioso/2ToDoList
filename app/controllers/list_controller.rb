# List of all lists for a specific user
get '/users/:user_id/lists' do
  @user = User.find(params[:user_id])
  @lists = @user.lists

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
  @list = List.new(user_id: @user.id, title: params[:title])
  # @task = Task.new(list_id: @list.id, title: params[:title], description: params[:description], due_date: params[:due_date])
  # binding.pry
  if @list.save

    redirect "/users/#{@user.id}/lists"
  else
   
    erb :'lists/index'
  end
end

# Display a specific list that belongs to a specific user
get '/users/:user_id/lists/:id' do
  @user = User.find(params[:user_id])
  @list = List.find(params[:id])

  erb :'lists/show'
end

# Return a form for editing a list
get '/users/:user_id/lists/:id/edit' do
end