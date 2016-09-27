get '/lists' do
	@lists = List.all
	erb :'lists/index'
end

get '/lists/new' do
	if request.xhr?
		erb :'lists/_new', layout: false
	else
		erb :'/lists/new'
	end
end

post '/lists' do
	@list = current_user.lists.new(name: params[:name])
	if @list.save
		if request.xhr?
			erb :"lists/_list_item", layout: false, locals: {list: @list} #not working for first user's first list item
		else
			redirect "/users/#{session[:user_id]}"
		end
	else
		@errors = @list.errors.full_messages
		erb :'/lists/new'
	end
end

get '/lists/:id' do
	require_user
	require_current_user(params[:id]) #put this in more places
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

