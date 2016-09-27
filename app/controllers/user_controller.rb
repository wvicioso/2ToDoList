get '/login' do
  if logged_in?
    user = current_user
    redirect "/user/#{user.id}/profile"
  else
    erb :'sessions/login'
  end
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/user/#{user.id}/profile"
  else
    @errors = ['Invalid email/password combination.']
    erb :'sessions/login'
  end
end

get '/register' do
  erb :'sessions/new'
end

post '/register' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/user/#{user.id}/profile"
  else
    @errors = user.errors.full_messages
    erb :'sessions/new'
  end
end

get '/user/:id/profile' do
  erb :'sessions/show'
end

get '/logout' do
  session.clear
  redirect '/'
end
