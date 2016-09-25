post '/lists/:list_id/tasks/new' do
  @list=List.find_by(id: params[:list_id])
  new_task = Task.new(list_id: @list.id, task_description: params[:task_description], marked_as_complete: false)

  if new_task.save
    if request.xhr?
          erb :'/share/_task', locals: {task: new_task}, layout: false
    else
      redirect "lists/#{@list.id}"
    end
  else
    @error = "Please enter a new task"
    erb :'list/show'
  end
end

get '/lists/:list_id/tasks/:task_id/mark' do
  task = Task.find_by(id: params[:task_id])
  task.marked_as_complete = true
  task.save
  if request.xhr?
    erb :'/share/_check', layout: false
  else
    redirect "/lists/#{params[:list_id]}"
  end
end

get '/lists/:list_id/tasks/:task_id/edit' do
  # @list = List.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:task_id])
  @original_description = @task.task_description
  erb :'task/edit'
end

put '/lists/:list_id/tasks/:task_id' do
  @task = Task.find_by(id: params[:task_id])
  @original_description = @task.task_description
  @task.task_description = params[:task_description]
  if @task.save
    redirect "/lists/#{@task.list_id}"
  else
    @error = "Task description cannot be blank"
    erb :'task/edit'
  end
end

get '/lists/:list_id/tasks/:task_id/delete' do
  task = Task.find_by(id: params[:task_id])
  task.destroy
  unless request.xhr?
    redirect "/lists/#{params[:list_id]}"
  end
end
