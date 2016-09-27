get '/lists/:id/tasks/new' do
    @list = List.find_by(id: params[:id])
    if !logged_in?
      redirect '/'
    else
      erb :'tasks/new'
    end
end

post '/lists/:id/tasks' do
  if !logged_in?
    redirect '/'
  else
    task = Task.new(
      description: params[:task][:description],
      list_id: params[:id])
    if task.save
      redirect "/lists/#{task.list_id}"
    else
      @errors = task.errors.full_messages
      erb :'tasks/new'
    end
  end
end

get '/lists/:id/tasks/:id' do
  @task = Task.find(params[:id])
  erb :'tasks/show'
end

get '/lists/:id/tasks/:id/edit' do
  if !logged_in?
    redirect '/'
  else
    @list = List.find(params[:captures][0])
    @task = Task.find(params[:id])
    erb :'tasks/edit'
  end
end

put '/lists/:id/tasks/:id' do
  if !logged_in?
    redirect '/'
  else
    @task = Task.find(params[:id])
    @task.assign_attributes(params[:task])
    if @task.save
      redirect "/lists/#{params[:captures][0]}"
    else
      erb :'tasks/edit'
    end
  end
end

delete '/lists/:id/tasks/:id' do
  if !logged_in?
    redirect '/'
  else
    task = Task.find(params[:id])
    task.destroy
    redirect "/lists/#{params[:captures][0]}"
  end
end
