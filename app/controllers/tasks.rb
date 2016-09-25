post '/tasks' do
  binding.pry
  task = Task.create(params[:task])
  if task.save
    binding.pry
    redirect "/lists/#{task.list_id}"
  else
    @errors = task.errors.full_messages
    erb :"/lists/#{task.list_id}"
  end
end
