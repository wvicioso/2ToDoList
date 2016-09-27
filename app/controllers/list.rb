get '/lists' do
  if logged_in?
    @lists = List.where(user_id: current_user.id)
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

get "/lists/:id" do
  @list = List.find(params[:id])
  @tasks = Task.where(list_id: @list.id)
  erb :"lists/show"
end