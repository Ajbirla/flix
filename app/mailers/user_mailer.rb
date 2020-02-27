class UserMailer < ApplicationMailer
  default :from => "ajaybirla143@gmail.com"
  def welcome_email user
    @user = user
    @url  = 'localhost:3000/sessions/new'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
