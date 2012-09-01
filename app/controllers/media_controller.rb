class MediaController < ApplicationController

  before_filter :admin?
  
  def admin?
    true if current_user.admin?
  end

  

  def tell_everybody
    lesson = Lesson.find(params[:id])
    the_date = lesson.time.strftime('%d %B')
    message = "We got a new class '#{lesson.title}' on #{the_date}"

    Twitter.update(message)
    UserMailer.new_lesson(lesson).deliver
    
  end

end
