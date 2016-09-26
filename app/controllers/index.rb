get '/' do
  titles = List.all.sample(15)
  @lists = List.sort_by(titles)
  erb :index
end
