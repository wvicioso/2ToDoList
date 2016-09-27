post '/lists/:list_id/tasks' do
  @list = List.find_by(id: params[:list_id])
  task = Task.new(description: params[:description], user_id: current_user.id, list_id: @list.id, marked_as_complete: false)
  # binding.pry
  if task.save
    redirect "/lists/#{@list.id}"
  else
    @error = "Invalid task"
    erb :'list/show'
  end
end
