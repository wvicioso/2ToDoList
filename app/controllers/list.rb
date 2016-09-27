get '/lists' do
  @lists = List.all
  erb :'list/index'
end

get '/lists/:list_id' do
  @list = List.find_by(id: params[:list_id])
  erb :'list/show'
end
