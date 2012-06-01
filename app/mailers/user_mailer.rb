class UserMailer < ActionMailer::Base
  default from: "info1117@gmail.com"

  def welcome_email


    Pony.options = {
        :via => :smtp,
        :via_options => {
            :address => 'smtp.sendgrid.net',
            :port => '587',
            :domain => 'heroku.com',
            :user_name => ENV['SENDGRID_USERNAME'],
            :password => ENV['SENDGRID_PASSWORD'],
            :authentication => :plain,
            :enable_starttls_auto => true
        }
    }


  end
end
