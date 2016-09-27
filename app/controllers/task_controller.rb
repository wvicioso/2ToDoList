get '/lists/:list_id/tasks/new' do
	@list = List.find(params[:list_id])
	if request.xhr?
		erb :'tasks/_new', layout: false
	else
		erb :'tasks/new'
	end
end

post '/lists/:list_id/tasks' do
	@task = Task.new({name: params[:name], list_id: params[:list_id]})
	@list = List.find(params[:list_id])
	if @task.save
		if request.xhr?
			erb :"tasks/_task_item", layout: false, locals: {task: @task}
		else
			redirect "/lists/#{params[:list_id]}"
		end
	else
		@errors = task.errors.full_messages
		erb :"lists/show"
	end
end

get "/lists/:list_id/tasks/:id/edit" do
	@task = Task.find(params[:id])
	@list = List.find(params[:list_id])
	erb :'tasks/edit'
end

put '/lists/:list_id/tasks/:id' do
	@list = List.find(params[:list_id])
	@task = Task.find(params[:id])
	if params.has_key?("name")
		if params[:name] == ""
			@errors = @task.errors.full_messages
			erb :'tasks/edit'
		else
			@task.update_attributes(name: params[:name])
		end
	else
		@task.update_attributes(complete: true)
	end
	redirect "/lists/#{params[:list_id]}"
end

delete '/lists/:list_id/tasks/:id' do
	task = Task.find(params[:id])
	task.destroy
	redirect "lists/#{params[:list_id]}"
end