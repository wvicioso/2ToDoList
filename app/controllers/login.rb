get '/login' do
  erb :'login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  # binding.pry
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @error = "Invalid log in, please try again."
    erb :'login'
  end
end

get '/logout' do
  session.clear
  redirect '/login'
end

get '/restricted' do
  erb :'restricted'
end
