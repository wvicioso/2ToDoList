get '/lists' do
  @lists = TodoList.all

  erb :'lists/index'
end

get '/lists/new' do
  erb :'lists/new'
end

post '/lists' do
  @list = TodoList.new(params[:todolist])
  if @list.save
    current_user.todo_lists << @list
    redirect "/lists/#{@list.id}"
  else
    @errors = "Your list needs a title!"
    erb :'lists/new'
  end
end

before '/lists/:id' do
  @list = TodoList.find_by(id: params[:id])
  if params[:id] == 'new'
    pass
  elsif @list == nil
    halt 404, erb(:'404')
  end
end

get '/lists/:id' do
  @tasks = @list.tasks
  erb :'lists/show'
end

put '/lists/:list_id/tasks'do
  completed_task_ids = params.select { |key, value| value == "on" }.keys
  @list = TodoList.find_by(id: params[:list_id])
  @tasks = @list.tasks
  completed_task_ids.each { |task_id| Task.update(task_id, status: true) }
  erb :'lists/show'
end

before '/lists/:list_id/edit' do
  @list = TodoList.find_by(id: params[:list_id])
  if !owner?(@list) 
    halt 404, erb(:'404')
  end
end

get '/lists/:list_id/edit' do
  erb :'lists/edit'
end

put '/lists/:list_id' do
  TodoList.update(params[:list_id], name: params[:name])
  redirect "/lists/#{params[:list_id]}"
end

before '/lists/:list_id/tasks/new' do
  @list = TodoList.find_by(id: params[:list_id])
  if !owner?(@list)
    halt 404, erb(:'404')
  end
end

get '/lists/:list_id/tasks/new' do
  @list = TodoList.find_by(id: params[:list_id])
  erb :'tasks/new'
end

post '/lists/:list_id/tasks' do
  @list = TodoList.find_by(id: params[:list_id])
  @task = Task.new(params[:task])
  if @task.save
    @list.tasks << @task
    redirect "/lists/#{@list.id}"
  else
    @errors = ["Please enter a description of your task."]
    erb :'tasks/new'
  end
end

before '/lists/:list_id/tasks/:id/edit' do
  @list = TodoList.find_by(id: params[:list_id])
  if !owner?(@list)
    halt 404, erb(:'404')
  end
end

get '/lists/:list_id/tasks/:id/edit' do
  @list = TodoList.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  erb :'tasks/edit'  
end

put '/lists/:list_id/tasks/:id' do
  @list = TodoList.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  Task.update(@task.id, description: params[:description])
  redirect "/lists/#{@list.id}"
end

before '/lists/:list_id/tasks/:id/delete' do
  @list = TodoList.find_by(id: params[:list_id])
  if !owner?(@list)
    halt 404, erb(:'404')
  end
end

get '/lists/:list_id/tasks/:id/delete' do
  @list = TodoList.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  erb :'tasks/delete'  
end

delete '/lists/:list_id/tasks/:id' do
  @list = TodoList.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  @task.destroy
  redirect "/lists/#{@list.id}"
end

not_found do 
  erb :'404'
end