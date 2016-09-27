get '/lists' do
  @lists = List.all
  erb :'list/index'
end

post '/lists' do
  list = List.new(title: params[:title], user_id: current_user.id)
  if list.save
    redirect "/users/#{current_user.id}"
  else
    @error = "invalid list title"
    @user = current_user
    erb :'user/show'
  end
end

get '/lists/:list_id' do
  @list = List.find_by(id: params[:list_id])
  erb :'list/show'
end

get '/lists/:list_id/edit' do
  @list = List.find_by(id: params[:list_id])
  erb :'list/edit'
end

delete '/lists/:list_id' do
  list = List.find_by(id: params[:list_id])
  list.destroy
  redirect "/users/#{current_user.id}"
end

put '/lists/:list_id' do
  @list = List.find_by(id: params[:list_id])
  @list.title = params[:title]
  if @list.save
    redirect "/users/#{current_user.id}"
  else
    @error = "Invalid List title"
    erb :'list/edit'
  end
end
