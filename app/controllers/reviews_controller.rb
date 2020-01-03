class ReviewsController < ApplicationController
	before_action :set_movie
  before_action :require_signin
  
  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user=current_user
    if !check_user_review_for_movie && @review.save
      redirect_to movie_reviews_path(@movie),
                    notice: "Thanks for your review!"
    else
      flash[:alert] = "You already give the review for this movie"
      render :new
    end
  end
  
 def edit
   @review = @movie.reviews.find(params[:id])
 end

  def update
      @review = @movie.reviews.find(params[:id])

     if @review.update(review_params)
        flash[:success] = "movie updated"
      redirect_to movie_reviews_path(@movie),notice: "One review is Updated!!"
    else
      render :edit
    end
  end
   def destroy
    @movie.reviews.find(params[:id]).destroy
    redirect_to movie_reviews_path(@movie),notice: "One review is deleted!!"
  end
private

  def review_params
    params.require(:review).permit(:comment, :stars)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def check_user_review_for_movie
    @movie.reviews.each do |review|
      if review.user_id == current_user.id
        return true
      end
    end
  end
end
