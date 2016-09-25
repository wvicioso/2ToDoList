get '/' do
  puts "YOOOO LOOOK HEREEEEE"
  puts session.inspect
  erb :home
end

# controlling user sessions
get '/users/new' do
  erb :'/users/new'
end

# profile page
get '/users/:id' do
  erb :'/users/show'
end

get '/logout' do
  session.clear()
  redirect '/'
end

# register new user
post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

# login page
get '/users/login' do
  erb :'/users/login'
end

# login authentication
post '/users/login' do
  if User.authenticate(params[:username])
end