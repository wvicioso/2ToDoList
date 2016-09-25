get '/users/:user_id' do 
  @user = User.find_by(id: params[:user_id])
  if session[:user_id] == @user.id 
    erb :'user/show'
  else
    "You do not have permission to view this page"
  end
end