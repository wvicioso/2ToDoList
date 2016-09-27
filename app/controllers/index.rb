get '/' do
  erb :"index"
end

get '/login' do
  erb :"/session/login"
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/secret'
  else 
    erb :"session/login"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/register' do
  erb :'users/new'
end

post '/register' do
  user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if user.save
    erb :"session/login"
  else
    @errors = user.errors.messages
    erb :"session/login"
  end
end

get '/secret' do
  if logged_in?
    erb :"secret"
  else
    erb :"sesion/login"
  end
end