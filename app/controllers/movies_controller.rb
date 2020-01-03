class MoviesController < ApplicationController
  before_action :require_signin, except:[:index,:show]
  before_action :require_admin, except:[:index,:show]
	def index
		@movies=Movie.released 
		end
  def show
  	@movie=Movie.find(params[:id])
    @fans=@movie.fans
    if current_user
    @current_favorite=current_user.favorites.find_by(movie_id: @movie.id)
  end
  @movie_genres=@movie.genres
  end
  def edit
  	@movie=Movie.find(params[:id])	
  end
  def update
  	@movie=Movie.find(params[:id])	
    if @movie.update(movie_params)
      flash[:notice]="successfully updated!!"
  	   redirect_to root_path
    else
        render :edit
      end
  end
  def new
  	@movie=Movie.new
  end
  def create
  		@movie=Movie.create(movie_params)
      if @movie.save
        flash[:notice]="successfully inserted!!"
  	     redirect_to movie_path(@movie)
      else
        render :new
      end
  end
  def destroy
  	@movie=Movie.find(params[:id]).delete
  	redirect_to movies_path(@movie),notice: "One movie is deleted!!"
  end
  private
  def movie_params
  	params.require(:movie).permit!
  end
end
