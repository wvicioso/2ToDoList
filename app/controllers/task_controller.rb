get 'users/:user_id/lists/:list_id/tasks/new' do
  @user = User.find_by(id: params[:user_id])
  @list = List.find_by(id: @user.id)

  erb :'tasks/_new_task'  
end

post '/users/:user_id/lists/:list_id/tasks/new' do
  @user = User.find_by(id: params[:user_id])
  @list = List.find_by(user_id: @user.id)
  @task = @list.tasks.new(params[:task])

  if @task.save
    redirect "/users/#{@user.id}/lists/#{@list.id}"
  else
    # "wrong!"
    @errors = @task.errors.full_messages
    erb :'tasks/_new_task', locals: { list: @list }
  end
end

# Delete a specific list
delete '/users/:user_id/lists/:list_id/tasks/:task_id' do
  task = Task.find_by(id: params[:task_id])
  task.destroy

  redirect "users/#{params[:user_id]}/lists/#{params[:list_id]}"
end
