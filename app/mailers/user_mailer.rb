require 'rest_client'
API_KEY = ENV['MAILGUN_API_KEY']
API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/mailgun.net"

class UserMailer < ActionMailer::Base
  default from: "info1117@gmail.com"

  def welcome_email


    RestClient.post API_URL+"/messages",
                    :from => "info1117@gmail.com",
                    :to => "info1117@gmail.com",
                    :subject => "This is subject",
                    :text => "Text body",
                    :html => "<b>HTML</b> version of the body!"
    puts "##########"
    puts "##########"
    puts "##########"
    puts "##########"
    puts "##########"
    @url  = "http://example.com/login"
    mail(:to => "info1117@gmail.com", :subject => "Welcome to My Awesome Site")
  end
end
