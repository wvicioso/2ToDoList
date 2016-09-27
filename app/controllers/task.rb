post '/lists/:list_id/tasks' do
  @list = List.find_by(id: params[:list_id])
  task = Task.new(description: params[:description], user_id: current_user.id, list_id: @list.id, marked_as_complete: false)
  # binding.pry
  if task.save
    redirect "/lists/#{@list.id}"
  else
    @error = "Invalid task"
    erb :'list/show'
  end
end

delete '/lists/:list_id/tasks/:task_id' do
  task = Task.find_by(id: params[:task_id])
  task.destroy
  redirect "/lists/#{params[:list_id]}"
end

get '/lists/:list_id/tasks/:task_id/edit' do
  @task = Task.find_by(id: params[:task_id])
  erb :'task/edit'
end

put '/lists/:list_id/tasks/:task_id' do
  @task = Task.find_by(id: params[:task_id])
  @task.description = params[:description]
  if @task.save
    redirect "/lists/#{params[:list_id]}"
  else
    @error = "Task cannot be blank"
    erb :'task/edit'
  end
end

get '/lists/:list_id/tasks/:task_id/mark' do
  task = Task.find_by(id: params[:task_id])
  task.marked_as_complete = true
  task.save
  redirect "/lists/#{params[:list_id]}"
end
