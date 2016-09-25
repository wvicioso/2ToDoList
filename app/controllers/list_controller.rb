get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

get '/lists/new' do
  if request.xhr?
    erb :'lists/_new_list_form', layout: false
  else
    erb :'lists/new'
  end
end

post '/lists' do
  list = List.new(name: params[:name], user_id: current_user.id)
  if list.save
    if request.xhr?
      erb :'lists/_list_item', locals: {list: list}, layout: false
    else
      redirect '/lists'
    end
  else
    @errors = list.errors.full_messages
    if request.xhr?
      erb :'_errors', layout: false
    else
      erb :'lists/new'
    end
  end
end

get '/lists/:id' do
  erb :'lists/show'
end

get 'lists/:id/edit' do
  @list = List.find(params[:id])
  erb :'lists/edit'
end

put 'lists/:id' do

end
