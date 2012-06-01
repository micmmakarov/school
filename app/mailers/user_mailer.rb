class UserMailer < ActionMailer::Base
  default from: "info1117@gmail.com"

  def welcome_email


    mail( :to => "info1117@gmail.com",
          :subject => "Thanks for signing up" )


  end
end
