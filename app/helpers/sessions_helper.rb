module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def flash_login
		flash[:notice] = "Sign in successful!"
	end

	def flash_logout
		flash[:notice] = "Logged out."
	end

	def go_home
		redirect_to root_path
	end
end