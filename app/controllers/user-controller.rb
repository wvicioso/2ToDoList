get '/users/login' do 

  erb :'/session/login'
end   

post '/users/login' do 
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else 
    @errors = ["Invalid email or password"]
    erb :'/session/login', locals: {errors: @errors}
  end   
end   

get '/users/new' do 
  erb :'/users/new'
end 


post '/users/new' do 
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id 
    redirect "/users/#{user.id}"
  else 
    @errors = user.errors.full_messages
    erb :'/users/new', locals: {errors: @errors}
  end 
end   

get '/users/logout' do 
  require_user 
  session.clear
  redirect '/'
end   

get '/users/:id' do 
  require_user 
  @lists = current_user.lists
  erb :'/users/show'
end   