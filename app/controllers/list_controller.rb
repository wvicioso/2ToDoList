get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

get '/lists/new' do
  erb :'lists/_new'
end

get '/lists/:id/show' do
  @list = List.find_by(id: params[:id])
  @tasklist = @list.tasks
  erb :'lists/show'
end

post '/lists' do
  list = List.new(name: params[:name], user_id: current_user.id)
  if list.save
    redirect "/lists/#{list.id}/show"
  else
    @errors = list.errors.full_messages
    erb :'lists/_new'
  end
end
get '/lists/:id/edit' do
  @list = List.find(params[:id])
  erb :'lists/_edit', locals: {list: @list}
end

put '/lists/:id' do
  list = List.find(params[:id])
  if list
    list.update(name: params[:name])
    redirect "/users/#{current_user.id}/profile"
  else
    erb :'lists/show'
  end
end

delete '/lists/:id' do
  list = List.find(params[:id])
  if list
    list.destroy
    redirect "/users/#{current_user.id}/profile"
  else
    @errors = list.errors.full_messages
    erb :'lists/show'
  end
end
