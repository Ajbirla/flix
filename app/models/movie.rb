class Movie < ApplicationRecord
  has_many_attached :uploads
  has_many :reviews,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :fans, through: :favorites, source: :user

  has_many :characterizations
  has_many :genres, through: :characterizations
  validates :title, presence: true
    validates :released_on, presence: true
    validates :duration, presence: true
    validates :description, length: { minimum: 25 }
    validates :total_gross, :numericality => { :greater_than_or_equal_to => 0 }
    # validates :image_file_name, allow_blank: true,format:{
    #     with: /\w+\.(gif|jpg|png)\z/i,
    #     message: "must reference a GIF, JPG, or PNG "
    # }
    RATINGS = %w(G PG PG-13 R NC-17)
  def flop?
    total_gross<50000000
  end
  def self.released
    where("released_on <?",Time.now).order(released_on: :desc)
  end

  def average_stars
    reviews.average(:stars)
  end

  def self.recent_reviews(movie)
    movie.reviews.order(updated_at: :desc).limit(2)
  end
end