get '/lists/:id/tasks/new' do
  @list = List.find(params[:id])
  erb :'tasks/_new', locals: {list: @list}
end

post '/lists/:id/tasks' do
  @list = List.find(params[:id])
  task = Task.new(description: params[:description], list_id: params[:id])
  if task.save
    redirect "/lists/#{params[:id]}/show"
  else
    @errors = task.errors.full_messages
    erb :'tasks/_new', locals: {list: @list}
  end
end
