get '/users/login' do 

  erb :'/session/login'
end   

post '/users/logout' do 

  redirect '/lists'
end   

get '/users/new' do 
  user = User.new(params[user])
  if user.save
    session[:user_id] = user.id 
    redirect "/users/#{user.id}"
  else 
    @errors = user.errors.full_messages
    erb :'/users/new', locals {errors: @errors}
end 


post '/users/new' do 


end   
