class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_lessons, :all_events
  before_filter :update_feed

  def all_lessons
    Lesson.all
  end
  def all_events
    Event.all
  end

  def update_feed
  end




end
