post '/tasks' do
  task = Task.create(params[:task])
  if task.save
    redirect "/lists/#{task.list_id}"
  else
    @errors = task.errors.full_messages
    erb :"/lists/#{task.list_id}"
  end
end
