get '/' do
  @lists = List.all.sample(20)
  erb :index
end
