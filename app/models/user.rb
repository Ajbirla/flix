class User < ApplicationRecord
      has_secure_password
      has_many :reviews
      has_many :favorites,dependent: :destroy
      has_many :favorite_movies, through: :favorites,source: :movie
     validates :name, presence: true
    validates :email, presence: true,
                    format: /\w+@\w+\.{1}[a-zA-Z]{2,}/ ,
                    uniqueness: {
                            case_sensitive: false
                            }
     validates :password, :length => {:within => 6..15, allow_blank: true}
    include Gravtastic
  		gravtastic
    def self.authenticate?(email,password)
        user = User.find_by(email:email)
        if user and user.authenticate(password)
          true
        else
          false
    end
  end

end
