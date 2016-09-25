get '/lists' do
  @lists = TodoList.all
  erb :'lists/index'
end