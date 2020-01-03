class FavoritesController < ApplicationController

before_action :require_signin
before_action :set_movie
  def create
    
    @favorite = @movie.favorites.create(user: current_user)
    @fans = @movie.fans
    redirect_to @movie
  end
  def destroy
  
          @user = current_user
        @fave = @user.favorites.find_by(movie:@movie)
        if @fave.destroy
            redirect_to movie_path(@movie), notice:"You just UNFAVED"
        else
            redirect_to movie_path(@movie), notice:"Something went wrong"
        end
    end
    private
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

end
