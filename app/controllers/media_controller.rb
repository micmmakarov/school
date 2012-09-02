class MediaController < ApplicationController

  before_filter :admin?
  
  def admin?
    true if current_user.admin?
  end

  

  def tell_everybody
  
    @lesson = Lesson.find(params[:id])
    the_date = @lesson.time.strftime('%d %B')
    rnd = (0...2).map{65.+(rand(25)).chr}.join
    message = "We got a new class '#{@lesson.title}' on #{the_date} /#{rnd}"

    Twitter.update(message)
    UserMailer.new_lesson(@lesson).deliver
    Notification.create(:lesson_id => @lesson.id, :sent => true)
    
    respond_to do |format|
      format.js
      format.json
    end  
    
  end

end
