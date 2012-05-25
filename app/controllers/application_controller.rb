class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_lessons


  def all_lessons
    Lesson.all
  end




end
