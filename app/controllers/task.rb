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
    @errors = task.errors.full_messages
    erb :"/lists/#{params[:list_id]}/tasks"
  end
end

put "/lists/:list_id/tasks/:id" do
  @task = Task.find(params[:id])
  if params[:completed] == "complete" && params[:description] != ""
    @task.update_attributes(status: true)
    @task.update_attributes(description: params[:description])
    redirect "/lists/#{params[:list_id]}/tasks"
  elsif params[:completed] != "complete" && params[:description] != ""
    @task.update_attributes(description: params[:description])
    redirect "/lists/#{params[:list_id]}/tasks"
  elsif params[:completed] == "complete" && params[:description] == ""
    @task.update_attributes(status: true)
    redirect "/lists/#{params[:list_id]}/tasks"
  else
    @errors = @task.errors.full_messages
    erb :"/lists/#{params[:list_id]}/tasks"
  end
end

delete "/lists/:list_id/tasks/:id" do
  @task = Task.find(params[:id])
  @task.destroy
  redirect "/lists/#{params[:list_id]}/tasks"
end