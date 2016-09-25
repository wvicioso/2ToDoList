get '/lists' do 
  @lists = List.all 
  erb :'list/index'
end

get '/lists/new' do 
  erb :'list/new'
end

post '/lists/new' do 
  @list = List.new(user_id: current_user.id, title: params[:title])
  if @list.save
    redirect "lists/#{@list.id}"
  else
    @error = "Please add a title"
    erb :'list/new'
  end
end

get '/lists/:list_id' do
  @list = List.find_by(id: params[:list_id])
  erb :'list/show'
end