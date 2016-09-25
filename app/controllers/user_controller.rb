get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages.uniq
    erb :'users/new'
  end
end

get '/users/:id' do
  "A profile page, eventually"
end