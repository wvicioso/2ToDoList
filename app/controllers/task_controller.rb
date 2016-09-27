get '/lists/:list_id/tasks/new' do
  @list = List.find(params[:list_id])
  erb :'tasks/_new', locals: {list: @list}
end

post '/lists/:list_id/tasks' do
  @list = List.find(params[:list_id])
  task = Task.new(description: params[:description], list_id: params[:list_id])
  if task.save
    redirect "/lists/#{params[:list_id]}/show"
  else
    @errors = task.errors.full_messages
    erb :'tasks/_new', locals: {list: @list}
  end
end

get '/lists/:list_id/tasks/:id/edit' do
  @task = Task.find(params[:id])
  @list = List.find(params[:list_id])
  erb :'tasks/_edit', locals: {list: @list, task: @task}
end

put '/lists/:list_id/tasks/:id' do
  task = Task.find(params[:id])
  if task
    if params[:description]
      task.update(description: params[:description])
      redirect "/lists/#{params[:list_id]}/show"
    elsif params[:completed]
      task.update(completed: true)
      redirect "/lists/#{params[:list_id]}/show"
    end
  else
    erb :'lists/show'
  end
end

delete '/lists/:list_id/tasks/:id' do
  task = Task.find(params[:id])
  if task
    task.destroy
    redirect "/users/#{current_user.id}/profile"
  else
    @errors = list.errors.full_messages
    erb :'lists/show'
  end
end
