get '/lists' do
  @lists = TodoList.all

  erb :'lists/index'
end

get '/lists/new' do
  if request.xhr?
    erb :'lists/_new', layout: false
  else
    erb :'lists/_new'
  end
end

post '/lists' do
  @list = TodoList.new(params[:todolist])
  if @list.save
    current_user.todo_lists << @list
    if request.xhr?
      erb :'lists/_show_one', locals: {list: @list, user: current_user}, layout: false
    else
      redirect "/lists/#{@list.id}"
    end
  else
    @errors = ["Your list needs a title!"]
    if request.xhr?
      halt 400, erb(:'lists/_new', locals: {errors: @errors}, layout: false)
    else
      erb :'lists/_new', locals: {errors: @errors}
    end
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
  if request.xhr?
    "It worked!"
  else
    erb :'lists/show'
  end
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
  if request.xhr?
    erb :'tasks/_new', locals: {list: @list}, layout: false
  else
    erb :'tasks/_new', locals: {list: @list}
  end
end

post '/lists/:list_id/tasks' do
  @list = TodoList.find_by(id: params[:list_id])
  @task = Task.new(params[:task])
  if @task.save
    @list.tasks << @task
    if request.xhr?
      erb :'tasks/_show', locals: {task: @task, list: @list}, layout: false
    else
      redirect "/lists/#{@list.id}"
    end
  else
    @errors = ["Please enter a description of your task."]
    erb :'tasks/_new'
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