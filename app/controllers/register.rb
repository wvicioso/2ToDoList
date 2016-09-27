get '/users/new' do
  erb :'user/new'
end

post '/users' do
  @user = User.new(params[:new_user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'user/new'
  end
end
