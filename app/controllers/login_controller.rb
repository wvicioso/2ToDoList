get '/login/new' do
  erb :'login/new'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ['Incorrect email or password']
    erb :'login/new'
  end
end