get '/lists' do 
  @lists = List.all 
  erb :'lists/index'
end   

get '/lists/:id' do 
  @list = List.find_by(id: params[:id])
  erb :'/lists/show'
end 

post '/lists/new' do
  list = List.new(title: params[:title], user_id: current_user.id)
  if list.save
    redirect '/lists'
  else
    @errors = list.errors.full_messages
    @lists = List.all
    erb :'/lists/index', locals: {errors: @errors}
  end   
end   