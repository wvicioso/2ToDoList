def owns_list?(list)
  current_user.id == list.creator.id if logged_in?
end
