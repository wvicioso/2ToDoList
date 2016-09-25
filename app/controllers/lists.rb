get '/lists' do
  "hello"
end

post '/lists' do
  list = List.create(params[:list])
  if list.save
    if request.xhr?
    erb :'/lists/_list', locals: { list: list }, layout: false
    else
      redirect '/'
    end
  else
    binding.pry
    @errors = list.errors.full_messages
    erb :'index'
  end
end
