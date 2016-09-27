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
  task = Task.find_by(id: params[:id])
  if params[:description]
    task.update(description: params[:description]) if current_user == task.list.user 
  else   
    task.update(completed: params[:completed]) if current_user == task.list.user 
  end 
    redirect "/lists/#{params[:list_id]}"
end 

delete '/lists/:list_id/tasks/:id' do #delete a task item
  task = Task.find_by(id: params[:id])
  task.destroy if current_user == task.list.user 
  redirect "/lists/#{params[:list_id]}"
end 

get '/lists/:list_id/tasks/:id/edit' do 
  @task = Task.find_by(id: params[:id])
  erb :'/tasks/edit'
end 
 