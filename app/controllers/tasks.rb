post '/tasks' do
  task = Task.create(params[:task])
  if task.save
    redirect "/lists/#{task.list_id}"
  else
    @errors = task.errors.full_messages
    erb :"/lists/#{task.list_id}"
  end
end

get '/tasks/:id/edit' do
  @task = Task.find_by(id: params[:id])
  @list = @task.list
  erb :'/tasks/show'
end

put '/tasks/:id' do
  @task = Task.find_by(id: params[:id])
  @task.update_attributes(params[:task])
  @list = @task.list
  redirect "/lists/#{@list.id}"
end

delete '/tasks/:id' do
  task = Task.find_by(id: params[:id])
  task.destroy
  redirect "/lists/#{task.list_id}"
end
