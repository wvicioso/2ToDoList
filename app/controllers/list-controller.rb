get '/lists' do 
  # @lists = List.all 
  erb :'lists/index'
end   

get '/lists/:id' do 
  @list = List.find_by(id: params[:id])
  erb :'/lists/show'
end 

delete '/lists/:id' do 
  @list = List.find_by(id: params[:id])
  if current_user == @list.user 
    @list.destroy 
  end   
  redirect "/lists"
end 

post '/lists/new' do
  # @lists = List.all

  list = List.new(title: params[:title], user_id: current_user.id)
  if list.save
    if request.xhr?
      # erb :'/shared/_lists', locals: {lists: list}, layout: false
    else   
      redirect '/lists'
    end   
  else
    @errors = list.errors.full_messages
    if request.xhr?
      halt 422, "There was an error"
    else 
      erb :'/lists/index', locals: {errors: @errors}
    end   
  end   
end  

