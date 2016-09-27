get '/lists/new' do
  erb :'lists/new'
end

post '/lists' do
  list = List.new(title: params[:list][:title], user: current_user)
  if list.save
    redirect "/users/#{list.user_id}"
  else
    @errors = list.errors.full_messages
    erb :'lists/new'
  end
end

get '/lists/:id' do
  @list = List.find(params[:id])
  @tasks = @list.tasks.order('created_at desc')
  erb :'lists/show'
end


get '/lists/:id/edit' do
  @list = List.find(params[:id])
  erb :'lists/edit'
end

put '/lists/:id' do
  list = List.find(params[:id])
  list.update(params[:list])
  if list.save
    redirect "/users/#{list.user_id}"
  else
    @errors = list.errors.full_messages
    erb :'lists/edit'
  end
end

delete '/lists/:id' do
  list = List.find(params[:id])
  list.destroy
  if request.xhr?
    status 200
  else
    redirect "/users/#{current_user.id}"
  end
end
