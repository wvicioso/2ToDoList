get '/' do
  puts "YOOOO LOOOK HEREEEEE"
  puts session.inspect
  erb :home
end

# TASKS

# new task page
get '/tasks/new' do
  erb :'/tasks/new'
end

# create new task
post '/tasks' do
  task = Post.new(content: params[:content], user_id: current_user.id)
  if task.save
    redirect '/'
  else
    @errors = task.errors.full_messages
    erb :'/tasks/new'
end

# USER SESSIONS

# register page
get '/users/new' do
  erb :'/users/new'
end

# login page
get '/users/login' do
  erb :'/users/login'
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


# login authentication
post '/users/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["Please correctly enter all fields"]
    erb :'/users/login'
  end
end






