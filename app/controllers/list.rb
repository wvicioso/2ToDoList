get '/lists' do
  @lists = List.all
  erb :'/lists/index'
end

get '/lists/new' do
  erb :'/lists/new'
end

get '/lists/:id' do
  @list = List.find_by(id: params[:id])
  erb :'/lists/show'
end
