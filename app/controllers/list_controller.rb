get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

get '/lists/new' do
  erb :'lists/new'
end

post '/lists' do
  list = List.new(name: params[:name], user_id: current_user.id)
  if list.save
    redirect '/lists'
  else
    @errors = list.errors.full_messages
    erb :'lists/new'
  end
end

get '/lists/:id' do
  erb :'lists/show'
end
