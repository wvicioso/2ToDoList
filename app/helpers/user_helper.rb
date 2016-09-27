def current_user
	@user ||= User.find_by(id: session[:user_id])
end

def logged_in?
	!!current_user
end

def require_user
	redirect '/login' unless logged_in?
end

def require_current_user(list_id)
	redirect '/lists' unless current_user.lists.include?(List.find(list_id))
end

def current_user_lists
	current_user.lists.where(user_id: current_user.id)
end

def prevent_user
	redirect '/' if logged_in?
end

def has_lists?
	current_user.lists.count > 0
end

# def completed_tasks
# 	current_user.tasks.where(complete: true) #move these methods to task model
# end

# def incomplete_tasks
# 	current_user.tasks.where(complete: false)
# end