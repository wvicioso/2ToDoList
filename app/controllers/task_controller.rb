get 'users/:user_id/tasks/new' do
  @user = User.find_by(id: params[:user_id])
  @list = List.find_by(id: params[:list_id])

  erb :'tasks/_new_task'  
end

post '/users/:user_id/tasks/new' do
  @user = User.find_by(id: params[:user_id])
  @list = List.find_by(id: params[:list_id])

  erb :'tasks/_new_task'
end
