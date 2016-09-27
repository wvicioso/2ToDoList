get '/lists/new' do
  erb :'lists/new'
end

post '/lists' do
  list = List.new(params[:list])
  if list.save
    redirect "/lists/#{list.id}"
  else
    @errors = list.errors.full_messages
    erb :'lists/new'
  end
end

get '/lists/:id' do
  @list = List.find(params[:id])
  @tasks = @list.tasks
  erb :'lists/show'
end
