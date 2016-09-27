get "/lists/:id/tasks" do
  @list = List.find(params[:id])
  @tasks = Task.where(list_id: @list.id)
  erb :"lists/show"
end

get "/lists/:list_id/tasks/new" do
  @list = List.find(params[:list_id])
  if logged_in?
    erb :"tasks/new"
  else
    redirect '/login'
  end
end

post "/lists/:list_id/tasks" do
  task = Task.new(description: params[:description], list_id: params[:list_id])
  if task.save
    redirect "/lists/#{params[:list_id]}/tasks"
  else
    redirect '/'
  end
end