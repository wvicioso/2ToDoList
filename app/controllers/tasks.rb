get '/lists/:id/tasks/new' do
  @list = List.find(params[:id])
  erb :'tasks/new'
end

post '/lists/:id/tasks/new' do
  @list = List.find(params[:id])
  task = Task.new(params[:task])
  task.list = @list
  if task.save
    redirect "/lists/#{@list.id}"
  else
    @errors = task.errors.full_messages
    erb :'tasks/new'
  end
end

get '/tasks/:id' do
  task = Task.find(params[:id])
  task.update(status: true)
  redirect "/lists/#{task.list_id}"
end
