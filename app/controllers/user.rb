get '/users/:user_id' do
  validate_user(params[:user_id])
  @user = User.find_by(id: params[:user_id])
  erb :'user/show'
end
