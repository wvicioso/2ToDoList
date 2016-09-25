get '/lists' do
  "hello"
end

post '/lists' do
  list = List.create(params[:list])
  if list.save?
    
  else
    @errors = list.errors.full_messages
    erb :'index'
  end
end
