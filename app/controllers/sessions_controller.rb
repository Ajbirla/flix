class SessionsController < ApplicationController
	before_action :require_signout,only:[:new]
	def new
		
	end
	def create
		user=User.find_by(Email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id]=user.id
			if session[:intended_url].nil?
				redirect_to user_path(user), notice: "Welcome back #{user.name}"
			else
				redirect_to session[:intended_url],	notice: "Welcome back #{user.name}"
				session[:intended_url]=nil
			end
		else
			flash.now[:notice]="Email and password is not match" 
			render :new
		end	
	end
	def destroy
	  session[:user_id] = nil

	  redirect_to new_sessions_path
    end
end
