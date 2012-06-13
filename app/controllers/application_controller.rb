class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_lessons
  before_filter :update_feed

  def all_lessons
    Lesson.all
  end

  def update_feed
  end




end
