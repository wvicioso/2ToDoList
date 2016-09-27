get '/lists/:id/tasks/new' do
  @list = List.find_by(id: params[:id])
  if !logged_in?
    redirect '/'
  else
    erb :'tasks/new'
  end
end

post '/lists/:id/tasks' do
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

get '/lists/:id/tasks/:id' do
  @task = Task.find(params[:id])
  erb :'tasks/show'
end

# put 'lists/:id/tasks/:id' do
#
# end

delete '/lists/:id/tasks/:id' do
  task = Task.find(params[:id])
  task.destroy
  redirect "/lists/#{params[:captures][0]}"
end
