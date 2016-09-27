get 'users/:user_id/lists/tasks/new' do
  @user = User.find_by(id: params[:user_id])
  @list = List.find_by(id: params[:list_id])

  erb :'tasks/_new_task'  
end

post '/users/:user_id/lists/tasks/new' do
  @user = User.find_by(id: params[:user_id])
  @list = List.find_by(id: params[:list_id])
  # binding.pry
  @task = Task.new(title: params[:title], description: params[:description], due_date: params[:due_date])
  binding.pry
  erb :'tasks/_new_task'
end
