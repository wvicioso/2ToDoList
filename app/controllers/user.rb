
get '/users/new' do
  erb :'user/new' 
end

get '/users/:user_id' do 
  @user = User.find_by(id: params[:user_id])
  if session[:user_id] == @user.id 
    erb :'user/show'
  else
    "You do not have permission to view this page"
  end
end

post '/users/new' do 
  @user = User.new(params[:new_user])
   if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
   else
    @errors = @user.errors.full_messages
    erb :'user/new'
   end
end