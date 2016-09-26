get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:username/profile' do
  @user = User.find_by(username: params[:username])
  @lists = @user.lists
  @uncompleted_tasks = @user.uncompleted_tasks
  @completed_tasks = @user.completed_tasks
  erb :'users/profile'

end
