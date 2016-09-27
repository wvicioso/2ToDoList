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

get '/lists/:id' do
  @list = TodoList.find_by(id: params[:id])
  @tasks = @list.tasks
  erb :'lists/show'
end

put '/lists/:list_id/tasks'do
  @list = TodoList.find_by(id: params[:list_id])
  @tasks = @list.tasks
  # to_update = @tasks.map { |task| Task.find_by(id: ta)}
end