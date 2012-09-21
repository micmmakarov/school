class UserMailer < ActionMailer::Base
  default from: "info1117@gmail.com"

  def welcome_email


    mail( :to => "info1117@gmail.com",
          :subject => "Thanks for signing up" )


  end

  def new_user(user)

    mail( :from => "rails-school.heroku.com",
          :to => "info1117@gmail.com",
          :subject => "New user " + user.name.to_s + " has registered!",
          :text => "So user's name is " + user.name.to_s + "!"
    )
    if user.subscribe
      mail( :from => "rails-school.heroku.com",
            :to => user.email,
            :subject => "Thank you for registration on Rails School!",
      )
    end

  end

   def new_lesson(lesson)

      @the_date = lesson.time.strftime('%d %B')
      
      @lesson = lesson
      @the_link = "#{lessons_path}/#{@lesson.slug}"
      subscribed_users = User.where(:subscribe => true)
      subscribed_users.each do |u|
        @user = u
        mail( :from => "rails-school.heroku.com",
              #:to => "railsschool.sf@gmail.com",
              :to => u.email,
              :subject => "Rails School: Lesson #{lesson.title} is added on #{lesson.time.strftime('%A')}"
        )
      end

   end

end
