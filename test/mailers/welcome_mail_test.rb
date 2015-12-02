require 'test_helper'

class WelcomeMailTest < ActionMailer::TestCase
   test "the truth" do
     assert true
   end
   def welcome_email_preview
        @user = user
       # @url  = "http://example.com/login"
        mail(:to => @user.Email_id, :subject => "Welcome to My Awesome Site")
   end 
end
