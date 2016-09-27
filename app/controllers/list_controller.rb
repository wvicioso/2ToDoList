get '/lists' do
	@lists = List.all
	erb :'lists/index'
end

get '/lists/new' do
	erb :'lists/new'
end

post '/lists' do
	list = List.new({name: params[:name], user_id: session[:user_id]})
	if list.save
		redirect "/users/#{session[:user_id]}"
	else
		@errors = list.errors.full_messages
		erb :'/lists/new'
	end
end

get '/lists/:id' do
	require_user
	require_current_user(params[:id])
	@list = List.find(params[:id])
	erb :'lists/show'
end

get '/lists/:id/edit' do
	@list = List.find(params[:id])
	erb :'lists/edit'
end

put '/lists/:id' do
	list = List.find(params[:id])
	list.update_attributes({name: params[:name]})
	redirect "/lists/#{params[:id]}"
end

delete "/lists/:id" do
	list = List.find(params[:id])
	list.destroy
	redirect "/users/#{current_user.id}"
end

