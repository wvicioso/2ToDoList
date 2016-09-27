get '/lists' do
  if logged_in?
    @lists = List.where(user_id: current_user.id).order("name ASC")
    erb :"/lists/index"
  else
    redirect '/login'
  end
end

get '/lists/new' do
  if logged_in?
    erb :"/lists/new"
  else
    redirect '/login'
  end
end

post '/lists' do
  list = List.new(name: params[:name], user_id: current_user.id)
  if list.save
    redirect '/lists'
  else
    @errors = list.errors.messages
    erb :"/lists/new"
  end
end

get "/lists/:id/edit" do
  @list = List.find(params[:id])
  if logged_in? && current_user.id == @list.user_id
    erb :"/lists/edit"
  else
    redirect '/login'
  end
end

put "/lists/:id" do
  @list = List.find(params[:id])
  @list.update_attributes(name: params[:name])
  if @list.save
    redirect "/lists"
  else
    @errors = @list.errors.full_messages
    erb :"/lists/edit"
  end
end

delete '/lists/:id' do
  @list = List.find(params[:id]) 
  @list.destroy
  redirect '/lists'
end