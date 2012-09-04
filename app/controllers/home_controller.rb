class HomeController < ApplicationController
  def index
    #Course.find_each(&:save)
    @courses = Course.all(:order => "created_at DESC")
    @posts = Post.all(:order => "created_at DESC", :limit => 4)
    @lessons = Lesson.all(:order => "time DESC", :limit => 3)
    @events = Event.where("TIME >= ?", Time.current).all(:limit => 5, :order => "time DESC")
    @e_l = Event.all.length
    respond_to do |format|
      format.js { render "home/answer.js"}
      format.html
    end


  end
  def about

    respond_to do |format|
      format.js { render "home/answer.js"}
      format.html
    end
  end
  def charts

	@questions = Question.all

	@questions.each do |q|

		hash = {}
		q.answers.each { |a| hash[a.text] = (hash[a.text].to_i + 1).to_s }

	end

  end



  def feed
    @feeds = Feed.all
  end

  def reformat
    Post.find_each(&:save)
    Lesson.find_each(&:save)
    Course.find_each(&:save)

    Lesson.all.each do |l|
      if l.results.length == 0
        l.results.build(:good => true)
        l.results.build(:good => false)
        l.save
      end
    end

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
