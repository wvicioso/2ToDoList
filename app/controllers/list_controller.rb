get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

get '/lists/:id/show' do
  @list = List.find_by(id: params[:id])
  @tasklist = @list.tasks
  erb :'lists/show'
end
