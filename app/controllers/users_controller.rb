class UsersController < ApplicationController
	
before_action :require_signin, only: [:show, :edit, :update, :destroy]
before_action :check_current_user, only: [:edit, :update, :destroy]
before_action :require_signout,only:[:new]
  def index
		@users=User.all 
	end
	 def show
  	@user=User.find(params[:id])
    # @fav_movies=@user.favorite_movies
  end
  def new
  	@user=User.new
  end
   def edit
  	# @user=User.find(params[:id])	
  end
  def update
  	# @user=User.find(params[:id])	
    if @user.update(user_params)
      flash[:notice]="successfully updated!!"
  	   redirect_to users_path
    else
        render :edit
      end
  end
  def create
  		@user=User.create(user_params)
      if @user.save
        session[:user_id]=@user.id
        flash[:notice]="successfully Registered!! Welcome #{@user.name}"
  	     redirect_to user_path(@user)
      else
        render :new
      end
  end
   def destroy
  	@user.delete
  	redirect_to users_path(@user),notice: "One User is deleted!!"
  end
  def create_admin
     @user=User.find(params[:id])
     @user.admin= true
     @user.save
          flash[:notice]="Admin successfully created!!"
         redirect_to user_path(@user)
    end
    def remove_admin
     @user=User.find(params[:id])
     @user.admin= false
     @user.save
          flash[:notice]="Admin successfully Removed!!"
         redirect_to user_path(@user)
    end

  private
  def user_params
  	params.require(:user).permit!
  end

  def check_current_user
      @user = User.find(params[:id])
      unless current_user == @user || current_user.admin
        flash[:error] = "you are not allow for this action"
        redirect_to user_path(@user)
      end
    end

end
