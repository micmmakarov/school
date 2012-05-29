class HomeController < ApplicationController
  def index
    #Course.find_each(&:save)
    @courses = Course.all(:order => "created_at DESC")
    @posts = Post.all(:order => "created_at DESC", :limit => 4)
  end
  def about
  end

  def reformat
    Post.find_each(&:save)
    Lesson.find_each(&:save)
    Course.find_each(&:save)
  end

  def thumbs
    attachments = Attachment.all
    attachments.each do |attachment|
      puts "Regeneration pics for " + attachment.id.to_s
      attachment.pic.reprocess!
    end
    render text: "OK!"
  end

  def calendar

    direction = params[:direction]
    @year = params[:year]
    @month = params[:month]

    old_date = Date.civil(@year.to_i,@month.to_i,1)

    if direction.to_s == "previous"
      new_date = old_date.to_time.advance(:months => -1).to_date
    end
    if direction.to_s == "next"
      new_date = old_date.to_time.advance(:months => 1).to_date
    end

    @year = new_date.year
    @month = new_date.month

    respond_to do |format|
      format.js
    end

  end




end
