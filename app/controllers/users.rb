get '/' do
  @lists = List.all
  erb :'index'
end

post '/users' do
  user = User.create(params[:user])
  if user.save
    session[:user_id] = user.id
    if request.xhr?
      "hello"
    else
    redirect '/'
    end
  else
    @errors = user.errors.full_messages
    erb :'/sessions/new'
  end
end
