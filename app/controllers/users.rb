get '/' do
  @lists = List.all
  erb :'index'
end

post '/users' do
  user = User.create(params[:user])
  if user.save
    if request.xhr?
      "hello"
    else
      redirect '/'
    end
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  user = User.find_by(id: params[:id])
  erb :'/users/show'
end
