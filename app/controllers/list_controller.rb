get '/lists/new' do
  if !logged_in?
    redirect '/'
  else
    erb :'lists/new'
  end
end

post '/lists' do
  if !logged_in?
    redirect '/'
  else
    list = List.new(params[:list])
    if list.save
      redirect "/lists/#{list.id}"
    else
      @errors = list.errors.full_messages
      erb :'lists/new'
    end
  end
end

get '/lists/:id' do
  @list = List.find(params[:id])
  @tasks = @list.tasks
  erb :'lists/show'
end
