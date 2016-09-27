get '/login' do
  if logged_in?
    user = current_user
    redirect "/users/#{user.id}/profile"
  else
    erb :'sessions/login'
  end
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}/profile"
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
    redirect "/users/#{user.id}/profile"
  else
    @errors = user.errors.full_messages
    erb :'sessions/new'
  end
end

get '/users/:id/profile' do
    @user = User.find(params[:id])
    if @user && current_user.id == @user.id
      @lists = @user.lists
      erb :'sessions/show'
    elsif logged_in?
      redirect '/'
    else
      redirect '/login'
    end
end

#error route if Sinatra is in production environment.
# error ActiveRecord::RecordNotFound do
#   redirect '/'
# end

get '/logout' do
  session.clear
  redirect '/'
end
