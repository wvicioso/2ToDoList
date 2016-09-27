get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

get '/lists/:id/show' do
  @list = List.find_by(id: params[:id])
  @tasklist = @list.tasks
  erb :'lists/show'
end

post '/list' do
  list = List.new(name: params[:name], user_id: current_user.id)
  if list.save
    redirect "/lists/#{list.id}/show"
  else
    @errors = list.errors.full_messages
    erb :'lists/_new'
  end
end

get '/lists/new' do

  erb :'lists/_new'
end
