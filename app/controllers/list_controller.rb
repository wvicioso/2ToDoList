# List of all lists for a specific user
get '/user/:user_id/lists' do
end

# Returns form for creating a new to do list
get '/users/:user_id/lists/new' do
end

# POST - Create a new list that belongs to currently logged in user
post '/users/:user_id/lists' do
end

# Display a specific list that belongs to a specific user
get 'users/:user_id/lists/:id' do
end

# Return a form for editing a list
get 'users/:user_id/lists/:id/edit' do
end