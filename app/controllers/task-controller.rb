post '/lists/:list_id/tasks/new' do #Add new task
  list_id = params[:list_id]
  task = Task.new(description: params[:description], list_id: list_id)
  if task.save
    redirect "/lists/#{list_id}"
  else
    @list = List.find_by(id: list_id)
    @errors = task.errors.full_messages
    erb :'/lists/show', locals: {errors: @errors}
  end  
end 

put '/lists/:list_id/tasks/:id' do #Edit existing task

end 

delete '/lists/:list_id/tasks/:id' do #delete a task item

end 

 