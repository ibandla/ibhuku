class UserMailer < ApplicationMailer
 default from: 'notifications@example.com'
 
  def welcome_email(user,url)
    @user = user
    @url =url

    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end
end
