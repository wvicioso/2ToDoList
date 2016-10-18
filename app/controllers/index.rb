enable :sessions

get '/' do
  if current_user
    redirect '/lists'
  else
    erb :index
  end
end

get '/login' do
  erb :'/sessions/new'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
  session[:id] = user.id
  if user && user.authenticate(params[:user][:password])
    redirect '/lists'
  else
    "error"
  end
end

get '/logout' do
  p "*"*50
  p current_user
    session.clear
    redirect '/'
end
