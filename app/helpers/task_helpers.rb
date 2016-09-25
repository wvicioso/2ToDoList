def owns_list?(list)
  binding.pry
  current_user.id == list.creator.id if logged_in?
end
