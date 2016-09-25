get '/lists' do
  @lists = List.all
  erb :'list/index'
end

post '/lists/new' do
  @list = List.new(user_id: current_user.id, title: params[:title])
  if @list.save
    if request.xhr?
      erb :'/share/_list_item', locals: { list: @list }, layout: false
    else
      redirect "users/#{current_user.id}"
    end
  else
    @error = "Please add a title"
    erb :'list/new'
  end
end

get '/lists/:list_id' do
  @list = List.find_by(id: params[:list_id])
  erb :'list/show'
end

get '/lists/:list_id/delete' do
  list = List.find_by(id: params[:list_id])
  list.destroy
  unless request.xhr?
    redirect "/users/#{current_user.id}"
  end
end
