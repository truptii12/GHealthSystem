class WelcomeMail < ApplicationMailer
     default :from =>"kulkarni.trupti.v.19@gmail.com"
    
    def welcome_email(user) 
     
        @user = user
       # @url  = "http://example.com/login"
        mail(:to => @user.Email_id, :subject => "Welcome to My Awesome Site")
    end 
end
