get '/lists' do 
  @lists = List.all 
  erb :'list/show'
end