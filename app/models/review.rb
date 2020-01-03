class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  
    #validates :released_on, presence: true
   #validates :stars, :numericality => { :greater_than_or_equal_to => 1,:less_than_or_equal_to => 5 }

STARS = [1, 2, 3, 4, 5]

  validates :stars, inclusion: {
    in: STARS,
    message: "must be between 1 and 5"
  }
  
    validates :comment, length: { minimum: 4 }
end
