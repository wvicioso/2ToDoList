post '/lists/:list_id/tasks/new' do
  @list=List.find_by(id: params[:list_id])
  new_task = Task.new(list_id: @list.id, task_description: params[:task_description], marked_as_complete: false)

  if new_task.save
    redirect "lists/#{@list.id}"
  else
    @error = "Please enter a new task"
    erb :'list/show'
  end
end